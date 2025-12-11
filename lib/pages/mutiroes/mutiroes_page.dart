import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:sigmus/extensions/response_ext.dart';
import 'package:sigmus/generated/sigmus_api.swagger.dart';
import 'package:sigmus/models/interfaces/model.dart';
import 'package:sigmus/models/mutirao_item.dart';
import 'package:sigmus/pages/mutiroes/mutirao_form_dialog.dart';
import 'package:sigmus/repositories/historico_sincronizacao_repository.dart';
import 'package:sigmus/repositories/mutirao_repository.dart';
import 'package:sigmus/routes/app_router.dart';
import 'package:sigmus/services/sigmus_api.dart';
import 'package:sigmus/services/sync_service.dart';
import 'package:sigmus/theme/app_typography.dart';
import 'package:sigmus/utils/date_utils.dart';
import 'package:sigmus/widgets/app_alert.dart';
import 'package:sigmus/widgets/app_data_table.dart';
import 'package:sigmus/widgets/app_toast.dart';
import 'package:sigmus/widgets/stat_card.dart';

class MutiroesPage extends StatefulWidget {
  const MutiroesPage({super.key});

  @override
  State<MutiroesPage> createState() => _MutiroesPageState();
}

class _MutiroesPageState extends State<MutiroesPage> {
  late final Listenable _dataListener;

  List<MutiraoItem> mutiroes = [];
  bool isLoading = false;

  final int _pacientesCount = 0;
  final int _cirurgiasCount = 0;
  final int _prescricoesOculosCount = 0;

  @override
  void initState() {
    super.initState();

    _dataListener = Listenable.merge([sigmusApi.authService.userData]);

    _dataListener.addListener(_loadData);

    _loadData();
  }

  @override
  void dispose() {
    _dataListener.removeListener(_loadData);
    super.dispose();
  }

  Future<void> _loadData() async {
    isLoading = true;

    final usuarioId = sigmusApi.authService.userData.value?.id;

    if (usuarioId == null) {
      mutiroes = [];
      isLoading = false;
      setState(() {});
      return;
    }
    List<MutiraoInfo> remoteMutiroes = [];
    try {
      final res = await sigmusApi.getUsuarioMutiroes(usuarioID: usuarioId);
      if (!res.isSuccessful) {
        throw res.errorMessage?.messagem ?? 'Erro Desconhecido';
      }
      remoteMutiroes = res.body?.mutiroes ?? [];
    } catch (e) {
      isLoading = false;
      setState(() {});
      AppToast.error(context, message: 'Erro: $e');
    }

    final localMutiroes = await GetIt.I<MutiraoRepository>().getAll();

    List<MutiraoItem> list = await localMutiroes
        .map((item) => MutiraoItem.fromDbMutirao(item))
        .map((item) async {
          item.permissoes = await GetIt.I<MutiraoRepository>().getPermissoes(
            item.id,
          );
          return item;
        })
        .wait;

    for (final mutirao in remoteMutiroes) {
      final localIndex = list.indexWhere((item) => item.id == mutirao.id);
      final item = MutiraoItem.fromApiMutirao(mutirao);

      if (localIndex != -1) {
        final localDbItem = localMutiroes.firstWhere((m) => m.id == mutirao.id);
        final lastSync = await GetIt.I<HistoricoSincronizacaoRepository>()
            .getLast(mutirao.id);

        if (lastSync != null) {
          final remoteNewer = lastSync.remoteTs < mutirao.atualizadoEm;
          final localNewer = lastSync.localTs < localDbItem.atualizadoEm;

          if (remoteNewer && localNewer) {
            item.syncStatus = SyncStatus.toMerge;
            list[localIndex] = item;
          } else if (remoteNewer) {
            item.syncStatus = SyncStatus.toDownload;
            list[localIndex] = item;
          } else if (localNewer) {
            list[localIndex].syncStatus = SyncStatus.toUpload;
          } else {
            list[localIndex].syncStatus = SyncStatus.upToDate;
          }
        } else {
          item.syncStatus = SyncStatus.toMerge;
          list[localIndex] = item;
        }
      } else {
        list.add(item);
      }
    }

    mutiroes = list
        .where((item) => item.status != ModelStatus.deleted.index)
        .where(
          (item) =>
              item.permissoes[sigmusApi.authService.userData.value?.email]
                  ?.contains('leitura') ??
              false,
        )
        .toList();
    isLoading = false;
    setState(() {});
  }

  void _createMutirao() {
    showDialog(
      context: context,
      builder: (context) => MutiraoFormDialog(
        onSubmit: (mutirao) {
          // mutiroes = [...mutiroes, mutirao];
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Mutirão criado com sucesso!')),
          );
        },
      ),
    );
  }

  void _editMutirao(MutiraoItem mutirao) {
    // showDialog(
    //   context: context,
    //   builder: (context) => MutiraoFormDialog(
    //     mutirao: mutirao,
    //     onSubmit: (updatedMutirao) {
    //       final mutiroes = [...this.mutiroes];
    //       final index = mutiroes.indexWhere((m) => m.id == mutirao.id);
    //       if (index != -1) {
    //         mutiroes[index] = updatedMutirao;
    //         this.mutiroes = mutiroes;
    //       }
    //       ScaffoldMessenger.of(context).showSnackBar(
    //         const SnackBar(content: Text('Mutirão atualizado com sucesso!')),
    //       );
    //     },
    //   ),
    // );
  }

  void _deleteMutirao(MutiraoItem mutirao) async {
    final confirmed = await AppAlert.show(
      context: context,
      title: 'Confirmar exclusão',
      message:
          'Tem certeza que deseja excluir o mutirão de ${mutirao.municipio}?\n\nA exclusão é permanente e não pode ser desfeita.',
      cancelText: 'Cancelar',
      confirmText: 'Excluir Mutirão',
      isDestructive: true,
    );

    if (confirmed == true) {
      // TODO: Implementar exclusão
    }
  }

  void _generateReport(MutiraoItem mutirao) {
    // TODO: Abrir dialog de relatórios
  }

  void _managePermissions(MutiraoItem mutirao) {
    // TODO: Abrir dialog de permissões
  }

  Future<void> _syncAllMutiroes() async {
    for (final mutirao in mutiroes) {
      await _syncMutirao(mutirao);
    }
    _loadData();
  }

  Future<void> _syncMutirao(MutiraoItem mutirao) async {
    if (mutirao.syncStatus == SyncStatus.toUpload ||
        mutirao.syncStatus == SyncStatus.toMerge) {
      await SyncService.instance.uploadMutiraoMudancas(mutirao.id);
    }

    if (mutirao.syncStatus == SyncStatus.toDownload ||
        mutirao.syncStatus == SyncStatus.toMerge) {
      await SyncService.instance.downloadMutiraoMudancas(mutirao.id);
    }

    _loadData();
  }

  String _capitalize(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeaderSection(),
            const SizedBox(height: 32),
            AppDataTable<MutiraoItem>(
              items: mutiroes,
              isLoading: isLoading,
              searchHint: 'Filtrar',
              emptyMessage: 'Sem dados',
              emptySearchMessage: 'Nenhum resultado para',
              actions: [
                OutlinedButton.icon(
                  onPressed: isLoading ? null : _loadData,
                  icon: const Icon(Icons.sync, size: 16),
                  label: const Text('Atualizar'),
                ),
                const SizedBox(width: 8),
                OutlinedButton.icon(
                  onPressed: isLoading ? null : _syncAllMutiroes,
                  icon: const Icon(Icons.sync, size: 16),
                  label: const Text('Sincronizar todos'),
                ),
                const SizedBox(width: 8),
                ElevatedButton.icon(
                  onPressed: isLoading ? null : _createMutirao,
                  icon: const Icon(Icons.add, size: 16),
                  label: const Text('Criar mutirão'),
                ),
              ],
              onRowTap: (item) {
                if (item.tipo == "refracao") {
                  AppRouter.goToMutiraoRefracao(mutiraoId: item.id);
                } else if (item.tipo == "cirurgia") {
                  AppRouter.goToMutiraoCirurgia(mutiraoId: item.id);
                } else {
                  AppRouter.goToMutiraoGenerico(
                    mutiraoId: item.id,
                    nomeMutirao: item.municipio,
                    tipoMutirao: _capitalize(item.tipo),
                    periodoMutirao: formatDateRangeFromString(
                      item.dataInicio,
                      item.dataFinal,
                    ),
                  );
                }
              },
              columns: [
                TableColumnConfig(
                  label: 'Data',
                  getValue: (mutirao) => formatDateRangeFromString(
                    mutirao.dataInicio,
                    mutirao.dataFinal,
                  ),
                ),
                TableColumnConfig(
                  label: 'Tipo',
                  getValue: (mutirao) => _capitalize(mutirao.tipo),
                ),
                TableColumnConfig(
                  label: 'Município',
                  getValue: (mutirao) => mutirao.municipio,
                ),
                TableColumnConfig(
                  label: 'Local',
                  getValue: (mutirao) => mutirao.local,
                ),
              ],
              getSearchText: (mutirao) =>
                  '${mutirao.municipio} ${mutirao.local} ${mutirao.tipo} ${mutirao.dataInicio} ${mutirao.dataFinal}',
              rowActions: (item) => [
                TableRowAction(
                  enabled: item.syncStatus != SyncStatus.upToDate,
                  icon: switch (item.syncStatus) {
                    SyncStatus.upToDate => Icons.check_sharp,
                    _ => Icons.cached_sharp,
                  },
                  tooltip: 'Sincronizar (Ctrl+S)',
                  onPressed: _syncMutirao,
                ),
              ],
              menuActions: (item) => [
                TableRowMenuAction(
                  label: 'Gerar relatório',
                  icon: Icons.description,
                  onPressed: _generateReport,
                ),
                TableRowMenuAction(
                  label: 'Editar mutirão',
                  icon: Icons.edit,
                  onPressed: _editMutirao,
                ),
                TableRowMenuAction(
                  label: 'Gerenciar acesso',
                  icon: Icons.people,
                  onPressed: _managePermissions,
                ),
                TableRowMenuAction(
                  label: 'Apagar mutirão',
                  icon: Icons.delete,
                  onPressed: _deleteMutirao,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderSection() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isNarrow = constraints.maxWidth < 1200;
        final statsCards = Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            StatCard(
              title: 'Mutirões criados',
              value: mutiroes.length.toString(),
              icon: Icons.calendar_today_outlined,
            ),
            StatCard(
              title: 'Pacientes atendidos',
              value: _pacientesCount.toString(),
              icon: Icons.people_outline,
            ),
            StatCard(
              title: 'Cirurgias realizadas',
              value: _cirurgiasCount.toString(),
              icon: Icons.medical_services_outlined,
            ),
            StatCard(
              title: 'Prescrições de óculos realizadas',
              value: _prescricoesOculosCount.toString(),
              icon: Icons.visibility_outlined,
            ),
          ],
        );

        final titleSection = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Mutirões', style: AppTypography.pageTitle),
            Text('Lista de mutirões', style: AppTypography.pageSubtitle),
          ],
        );

        if (isNarrow) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [titleSection, const SizedBox(height: 24), statsCards],
          );
        }

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: titleSection),
            statsCards,
          ],
        );
      },
    );
  }
}
