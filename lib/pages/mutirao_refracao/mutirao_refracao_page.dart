import 'package:collection/collection.dart';
import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:sigmus/database/app_database.dart';
import 'package:sigmus/extensions/mutirao_item_ext.dart';
import 'package:sigmus/models/conduta_item.dart';
import 'package:sigmus/models/interfaces/model.dart';
import 'package:sigmus/models/mutirao_item.dart';
import 'package:sigmus/pages/mutirao_refracao/refracao_dialog.dart';
import 'package:sigmus/repositories/conduta_repository.dart';
import 'package:sigmus/repositories/medico_repository.dart';
import 'package:sigmus/repositories/paciente_repository.dart';
import 'package:sigmus/theme/app_colors.dart';
import 'package:sigmus/theme/app_typography.dart';
import 'package:sigmus/widgets/app_alert.dart';
import 'package:sigmus/widgets/app_data_table.dart';
import 'package:sigmus/widgets/app_dropdown.dart';
import 'package:sigmus/widgets/app_toast.dart';
import 'package:sigmus/widgets/stat_card.dart';

// prescOculos
// cirurgia
// encam
// alta

class MutiraoRefracaoPage extends StatefulWidget {
  final MutiraoItem mutirao;

  const MutiraoRefracaoPage({super.key, required this.mutirao});

  @override
  State<MutiraoRefracaoPage> createState() => _MutiraoRefracaoPageState();
}

class _MutiraoRefracaoPageState extends State<MutiraoRefracaoPage> {
  final _filter = ValueNotifier<String?>(null);
  late final Listenable _dataListener;

  List<CondutaItem> condutas = [];
  bool isLoading = false;

  List<Conduta> condutaList = [];
  List<Paciente> pacienteList = [];
  List<Medico> medicoList = [];

  int get _pacientesCount => condutaList.length;

  int get _altasCount =>
      condutaList.where((c) => c.tipo.contains('alta')).length;

  int get _encaminhamentosCount =>
      condutaList.where((c) => c.tipo.contains('encam')).length;

  int get _prescricoesCount =>
      condutaList.where((c) => c.tipo.contains('prescOculos')).length;

  int get _cirurgiasCount =>
      condutaList.where((c) => c.tipo.contains('cirurgia')).length;

  @override
  void initState() {
    super.initState();

    _dataListener = Listenable.merge([_filter]);
    _dataListener.addListener(_filterData);

    _loadData();
  }

  @override
  void dispose() {
    _dataListener.removeListener(_filterData);
    _filter.dispose();
    super.dispose();
  }

  Future<void> _loadData() async {
    isLoading = true;
    setState(() {});

    try {
      condutaList = await GetIt.I<CondutaRepository>().getAll(
        mutiraoId: widget.mutirao.id,
      );

      medicoList = await GetIt.I<MedicoRepository>().getAll(
        mutiraoId: widget.mutirao.id,
      );

      pacienteList = await GetIt.I<PacienteRepository>().getAll(
        ids: condutaList.map((c) => c.pacienteId).toList(),
      );

      _filterData();

      isLoading = false;
      setState(() {});
    } catch (e) {
      AppToast.error(context, message: 'Erro: $e');
      isLoading = false;
      setState(() {});
    }
  }

  void _filterData() {
    final filter = _filter.value;

    final items = condutaList
        .map((conduta) {
          final paciente = pacienteList.firstWhereOrNull(
            (p) => p.id == conduta.pacienteId,
          );
          final medico = medicoList.firstWhereOrNull(
            (m) => m.id == conduta.medicoId,
          );

          if (paciente == null) {
            return null;
          }

          return CondutaItem(
            paciente: paciente,
            conduta: conduta,
            medico: medico,
          );
        })
        .nonNulls
        .where(
          (item) => switch (filter) {
            'prescOculos' => item.conduta.tipo.contains('prescOculos'),
            'cirurgia' => item.conduta.tipo.contains('cirurgia'),
            'encam' => item.conduta.tipo.contains('encam'),
            'alta' => item.conduta.tipo.contains('alta'),
            'sem_cpf' => item.paciente.cpf?.isNotEmpty != true,
            'sem_cns' => item.paciente.cns?.isNotEmpty != true,
            'sem_tel' => item.paciente.tel?.isNotEmpty != true,
            _ => true,
          },
        )
        .toList();

    condutas = items;
    setState(() {});
  }

  void _createConduta() {
    showDialog(
      context: context,
      builder: (context) => RefracaoFormDialog(
        mutirao: widget.mutirao,
        datasDisponiveis: widget.mutirao.availableDates,
        medicosDisponiveis: medicoList,
        onSubmit: (item) async {
          final conduta = item.conduta.copyWith(mutiraoId: widget.mutirao.id);

          await GetIt.I<CondutaRepository>().upsert(conduta.toCompanion(true));
          await GetIt.I<PacienteRepository>().upsert(
            item.paciente.toCompanion(true),
          );
          _loadData();
          AppToast.success(context, message: 'Paciente criado com sucesso');
        },
      ),
    );
  }

  void _editConduta(CondutaItem item) {
    showDialog(
      context: context,
      builder: (context) => RefracaoFormDialog(
        condutaItem: item,
        mutirao: widget.mutirao,
        datasDisponiveis: widget.mutirao.availableDates,
        medicosDisponiveis: medicoList,
        onSubmit: (updatedItem) async {
          final conduta = updatedItem.conduta.copyWith(
            mutiraoId: widget.mutirao.id,
          );
          await GetIt.I<CondutaRepository>().upsert(conduta.toCompanion(true));
          await GetIt.I<PacienteRepository>().upsert(
            updatedItem.paciente.toCompanion(true),
          );
          _loadData();
          AppToast.success(context, message: 'Paciente atualizado com sucesso');
        },
      ),
    );
  }

  void _deleteConduta(CondutaItem item) async {
    final confirmed = await AppAlert.show(
      context: context,
      title: 'Confirmar exclusão',
      message:
          'Tem certeza que deseja excluir o paciente ${item.paciente.nome}?\n\nA exclusão é permanente e não pode ser desfeita.',
      cancelText: 'Cancelar',
      confirmText: 'Excluir Paciente',
      isDestructive: true,
    );

    final now = DateTime.now().millisecondsSinceEpoch;

    if (confirmed == true) {
      await GetIt.I<CondutaRepository>().update(
        item.conduta.id,
        CondutasCompanion(
          status: drift.Value(ModelStatus.deleted.index),
          atualizadoEm: drift.Value(now),
        ),
      );
      _loadData();
    }
  }

  void _syncWithDatasus() {
    // TODO: Implementar sincronização com DATASUS
  }

  String _formatCpf(String cpf) {
    final digits = cpf.replaceAll(RegExp(r'\D'), '');
    if (digits.length != 11) return cpf;
    return '${digits.substring(0, 3)}.${digits.substring(3, 6)}.${digits.substring(6, 9)}-${digits.substring(9)}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildPageHeader(),
                  _buildHeaderSection(),
                  const SizedBox(height: 32),
                  _buildTable(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPageHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.arrow_back),
            tooltip: 'Voltar',
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.mutirao.municipio,
                  style: AppTypography.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'Mutirão de Refração - ${widget.mutirao.dataInicio == widget.mutirao.dataFinal ? widget.mutirao.dataInicio : "${widget.mutirao.dataInicio} a ${widget.mutirao.dataFinal}"}',
                  style: AppTypography.textTheme.bodySmall?.copyWith(
                    color: AppColors.mutedForeground,
                  ),
                ),
              ],
            ),
          ),
        ],
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
              title: 'Pacientes',
              value: _pacientesCount.toString(),
              icon: Icons.people_outline,
            ),
            StatCard(
              title: "Cirurgias",
              value: _cirurgiasCount.toString(),
              icon: Icons.medical_services_outlined,
            ),
            StatCard(
              title: 'Altas',
              value: _altasCount.toString(),
              icon: Icons.check_circle_outline,
            ),
            StatCard(
              title: 'Encaminhamentos',
              value: _encaminhamentosCount.toString(),
              icon: Icons.arrow_forward,
            ),
            StatCard(
              title: 'Prescrições de óculos',
              value: _prescricoesCount.toString(),
              icon: Icons.visibility_outlined,
            ),
          ],
        );

        final titleSection = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Pacientes', style: AppTypography.pageTitle),
            Text(
              'Lista de pacientes atendidos',
              style: AppTypography.pageSubtitle,
            ),
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

  Widget _buildTable() {
    return AppDataTable<CondutaItem>(
      items: condutas,
      isLoading: isLoading,
      searchHint: 'Filtrar',
      emptyMessage: 'Nenhum paciente cadastrado',
      emptySearchMessage: 'Nenhum resultado para',
      actions: [
        SizedBox(
          width: 200,
          height: 40,
          child: AppDropdown<String>(
            initialValue: _filter.value,
            label: 'Conduta',
            hint: 'Todos',
            items: const [
              DropdownMenuItem(value: null, child: Text('Todos')),
              DropdownMenuItem(
                value: 'prescOculos',
                child: Text('Prescrição de óculos'),
              ),
              DropdownMenuItem(value: 'cirurgia', child: Text('Cirurgia')),
              DropdownMenuItem(value: 'encam', child: Text('Encaminhamento')),
              DropdownMenuItem(value: 'alta', child: Text('Alta')),
              DropdownMenuItem(value: 'sem_cpf', child: Text('Sem CPF')),
              DropdownMenuItem(value: 'sem_cns', child: Text('Sem CNS')),
              DropdownMenuItem(value: 'sem_tel', child: Text('Sem Telefone')),
            ],
            onChanged: (value) {
              _filter.value = value;
            },
          ),
        ),
        const SizedBox(width: 8),
        OutlinedButton.icon(
          onPressed: isLoading ? null : _syncWithDatasus,
          icon: const Icon(Icons.sync, size: 16),
          label: const Text('Sinc. com o DATASUS'),
        ),
        const SizedBox(width: 8),
        ElevatedButton.icon(
          onPressed: isLoading ? null : _createConduta,
          icon: const Icon(Icons.add, size: 16),
          label: const Text('Novo atendimento'),
        ),
      ],
      columns: [
        TableColumnConfig(
          label: 'Nome',
          getValue: (c) => c.paciente.nome ?? '',
        ),
        TableColumnConfig(
          label: 'CPF',
          getValue: (c) => _formatCpf(c.paciente.cpf ?? ''),
        ),
        TableColumnConfig(label: 'CNS', getValue: (c) => c.paciente.cns ?? ''),
        TableColumnConfig(
          label: 'Telefone',
          getValue: (c) => c.paciente.tel ?? '',
        ),
        TableColumnConfig(
          label: 'Conduta',
          getValue: (c) => switch (c.conduta.tipo) {
            'prescOculos' => 'Prescrição de óculos',
            'cirurgia' => 'Cirurgia',
            'encam' => 'Encaminhamento',
            'alta' => 'Alta',
            _ => c.conduta.tipo,
          },
        ),
      ],
      getSearchText: (c) =>
          '${c.paciente.nome ?? ''} ${c.paciente.cpf ?? ''} ${c.paciente.cns ?? ''} ${c.paciente.tel ?? ''} ${c.conduta.tipo ?? ''}',
      menuActions: (item) => [
        TableRowMenuAction(
          label: 'Editar paciente',
          icon: Icons.edit,
          onPressed: _editConduta,
        ),
        TableRowMenuAction(
          label: 'Apagar paciente',
          icon: Icons.delete,
          onPressed: _deleteConduta,
        ),
      ],
    );
  }
}
