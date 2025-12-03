import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sigmus/extensions/response_ext.dart';
import 'package:sigmus/generated/sigmus_api.swagger.dart';
import 'package:sigmus/pages/home/dialogs/mutirao_form_dialog.dart';
import 'package:sigmus/routes/app_router.dart';
import 'package:sigmus/services/sigmus_api.dart';
import 'package:sigmus/theme/app_typography.dart';
import 'package:sigmus/utils/date_utils.dart';
import 'package:sigmus/widgets/app_alert.dart';
import 'package:sigmus/widgets/app_data_table.dart';
import 'package:sigmus/widgets/app_toast.dart';
import 'package:sigmus/widgets/stat_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class TableState {
  final List<MutiraoInfo> mutiroes;
  final bool isLoading;

  const TableState({this.mutiroes = const [], this.isLoading = false});

  TableState copyWith({List<MutiraoInfo>? mutiroes, bool? isLoading}) {
    return TableState(
      mutiroes: mutiroes ?? this.mutiroes,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class _HomePageState extends State<HomePage> {
  late final Listenable _dataListener;

  final _tableState = ValueNotifier<TableState>(const TableState());

  final int _pacientesCount = 0;
  final int _cirurgiasCount = 0;
  final int _prescricoesOculosCount = 0;

  @override
  void initState() {
    super.initState();

    _dataListener = Listenable.merge([sigmusApi.userData]);

    _dataListener.addListener(_loadData);

    _loadData();
  }

  @override
  void dispose() {
    _dataListener.removeListener(_loadData);
    _tableState.dispose();
    super.dispose();
  }

  Future<void> _loadData() async {
    _tableState.value = _tableState.value.copyWith(isLoading: true);

    final usuarioId = sigmusApi.userData.value?.id;

    print(usuarioId);

    if (usuarioId == null) {
      _tableState.value = _tableState.value.copyWith(
        mutiroes: [],
        isLoading: false,
      );
      return;
    }

    try {
      final res = await sigmusApi.getUsuarioMutiroes(usuarioID: usuarioId);
      if (!res.isSuccessful) {
        throw res.errorMessage?.messagem ?? 'Erro Desconhecido';
      }
      _tableState.value = _tableState.value.copyWith(
        mutiroes: res.body?.mutiroes ?? [],
        isLoading: false,
      );
      AppToast.show(context, message: 'Carregado com sucesso');
    } catch (e) {
      _tableState.value = _tableState.value.copyWith(isLoading: false);
      AppToast.show(context, message: 'Erro: $e', isError: true);
    }

    _tableState.value = _tableState.value.copyWith(isLoading: false);
  }

  void _createMutirao() {
    showDialog(
      context: context,
      builder: (context) => MutiraoFormDialog(
        onSubmit: (mutirao) {
          _tableState.value = _tableState.value.copyWith(
            mutiroes: [..._tableState.value.mutiroes, mutirao],
          );
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Mutirão criado com sucesso!')),
          );
        },
      ),
    );
  }

  void _editMutirao(MutiraoInfo mutirao) {
    showDialog(
      context: context,
      builder: (context) => MutiraoFormDialog(
        mutirao: mutirao,
        onSubmit: (updatedMutirao) {
          final mutiroes = [..._tableState.value.mutiroes];
          final index = mutiroes.indexWhere((m) => m.id == mutirao.id);
          if (index != -1) {
            mutiroes[index] = updatedMutirao;
            _tableState.value = _tableState.value.copyWith(mutiroes: mutiroes);
          }
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Mutirão atualizado com sucesso!')),
          );
        },
      ),
    );
  }

  void _deleteMutirao(MutiraoInfo mutirao) async {
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

  void _generateReport(MutiraoInfo mutirao) {
    // TODO: Abrir dialog de relatórios
  }

  void _managePermissions(MutiraoInfo mutirao) {
    // TODO: Abrir dialog de permissões
  }

  void _syncMutirao(MutiraoInfo mutirao) async {
    // TODO: Implementar sincronização
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
            // Apenas a tabela reconstrói quando _tableState muda
            ValueListenableBuilder<TableState>(
              valueListenable: _tableState,
              builder: (context, state, _) {
                return AppDataTable<MutiraoInfo>(
                  items: state.mutiroes,
                  isLoading: state.isLoading,
                  searchHint: 'Filtrar',
                  emptyMessage: 'Sem dados',
                  emptySearchMessage: 'Nenhum resultado para',
                  actions: [
                    OutlinedButton.icon(
                      onPressed: state.isLoading ? null : _loadData,
                      icon: const Icon(Icons.sync, size: 16),
                      label: const Text('Atualizar'),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton.icon(
                      onPressed: state.isLoading ? null : _createMutirao,
                      icon: const Icon(Icons.add, size: 16),
                      label: const Text('Criar mutirão'),
                    ),
                  ],
                  onRowTap: (item) {
                    if (item.tipo == "cirurgia") {
                      AppRouter.goToMutiraoCirurgia(mutiraoId: item.id);
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
                  rowActions: [
                    TableRowAction(
                      icon: Icons.sync,
                      tooltip: 'Sincronizar (Ctrl+S)',
                      onPressed: _syncMutirao,
                    ),
                  ],
                  menuActions: [
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
                );
              },
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

        // Stats cards reagem ao _tableState
        final statsCards = ValueListenableBuilder<TableState>(
          valueListenable: _tableState,
          builder: (context, state, _) {
            return Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                StatCard(
                  title: 'Mutirões criados',
                  value: state.mutiroes.length.toString(),
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
          },
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
