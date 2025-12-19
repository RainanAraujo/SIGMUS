import 'dart:isolate';

import 'package:collection/collection.dart';
import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:sigmus/database/app_database.dart';
import 'package:sigmus/extensions/mutirao_item_ext.dart';
import 'package:sigmus/models/interfaces/model.dart';
import 'package:sigmus/models/mutirao_item.dart';
import 'package:sigmus/models/procedimento_item.dart';
import 'package:sigmus/pages/mutirao_cirurgia/cirurgia_dialog.dart';
import 'package:sigmus/repositories/medico_repository.dart';
import 'package:sigmus/repositories/paciente_repository.dart';
import 'package:sigmus/repositories/procedimento_repository.dart';
import 'package:sigmus/theme/app_colors.dart';
import 'package:sigmus/theme/app_typography.dart';
import 'package:sigmus/widgets/app_alert.dart';
import 'package:sigmus/widgets/app_data_table.dart';
import 'package:sigmus/widgets/app_dropdown.dart';
import 'package:sigmus/widgets/app_toast.dart';
import 'package:sigmus/widgets/stat_card.dart';

class MutiraoCirurgiaPage extends StatefulWidget {
  final MutiraoItem mutirao;

  const MutiraoCirurgiaPage({super.key, required this.mutirao});

  @override
  State<MutiraoCirurgiaPage> createState() => _MutiraoCirurgiaPageState();
}

class _MutiraoCirurgiaPageState extends State<MutiraoCirurgiaPage> {
  final _filter = ValueNotifier<String?>(null);
  late final Listenable _dataListener;

  List<ProcedimentoItem> procedimentos = [];
  bool isLoading = false;

  List<Procedimento> procedimentoList = [];
  List<Paciente> pacienteList = [];
  List<Medico> medicoList = [];

  int get _pacientesCount => procedimentoList.length;
  int get _cirurgiasCatarataCount => procedimentoList
      .where((p) => (p.tipo).toLowerCase().contains('catarata'))
      .length;
  int get _cirurgiasPterigioCount => procedimentoList
      .where((p) => (p.tipo).toLowerCase().contains('pterigio'))
      .length;

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
      procedimentoList = await GetIt.I<ProcedimentoRepository>().getAll(
        mutiraoId: widget.mutirao.id,
      );

      medicoList = await GetIt.I<MedicoRepository>().getAll(
        mutiraoId: widget.mutirao.id,
      );

      pacienteList = await GetIt.I<PacienteRepository>().getAll(
        ids: procedimentoList.map((p) => p.pacienteId).toList(),
      );

      await _filterData();

      isLoading = false;
      setState(() {});
    } catch (e) {
      if (mounted) {
        AppToast.error(context, message: 'Erro: $e');
      }
      isLoading = false;
      setState(() {});
    }
  }

  Future<void> _filterData() async {
    final filter = _filter.value;
    final procs = List<Procedimento>.from(procedimentoList);
    final pacs = List<Paciente>.from(pacienteList);
    final meds = List<Medico>.from(medicoList);

    final items = await Isolate.run(
      () => _processItems(procs, pacs, meds, filter),
    );

    if (mounted) {
      procedimentos = items;
      setState(() {});
    }
  }

  static List<ProcedimentoItem> _processItems(
    List<Procedimento> procs,
    List<Paciente> pacs,
    List<Medico> meds,
    String? filter,
  ) {
    return procs
        .map((proc) {
          final paciente = pacs.firstWhereOrNull(
            (p) => p.id == proc.pacienteId,
          );
          final medico = meds.firstWhereOrNull((m) => m.id == proc.medicoId);

          if (paciente == null || medico == null) {
            return null;
          }

          return ProcedimentoItem(
            paciente: paciente,
            procedimento: proc,
            medico: medico,
          );
        })
        .nonNulls
        .where(
          (item) => switch (filter) {
            'catarata' => item.procedimento.tipo.contains('catarata'),
            'pterigio' => item.procedimento.tipo.contains('pterigio'),
            'sem_cpf' => item.paciente.cpf?.isNotEmpty != true,
            'sem_cns' => item.paciente.cns?.isNotEmpty != true,
            'sem_tel' => item.paciente.tel?.isNotEmpty != true,
            _ => true,
          },
        )
        .toList();
  }

  void _createProcedimento() {
    showDialog(
      context: context,
      builder: (context) => CirurgiaFormDialog(
        mutirao: widget.mutirao,
        datasDisponiveis: widget.mutirao.availableDates,
        medicosDisponiveis: medicoList,
        onSubmit: (procedimento, paciente) async {
          await GetIt.I<ProcedimentoRepository>().upsert(
            procedimento.toCompanion(true),
          );
          await GetIt.I<PacienteRepository>().upsert(
            paciente.toCompanion(true),
          );
          _loadData();
          AppToast.success(context, message: 'Procedimento criado com sucesso');
        },
      ),
    );
  }

  void _editProcedimento(ProcedimentoItem item) {
    showDialog(
      context: context,
      builder: (context) => CirurgiaFormDialog(
        mutirao: widget.mutirao,
        procedimento: item,
        datasDisponiveis: widget.mutirao.availableDates,
        medicosDisponiveis: medicoList,
        onSubmit: (procedimento, paciente) async {
          await GetIt.I<ProcedimentoRepository>().upsert(
            procedimento.toCompanion(true),
          );
          await GetIt.I<PacienteRepository>().upsert(
            paciente.toCompanion(true),
          );
          _loadData();
          AppToast.success(
            context,
            message: 'Procedimento atualizado com sucesso',
          );
        },
      ),
    );
  }

  void _deleteProcedimento(ProcedimentoItem item) async {
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
      await GetIt.I<ProcedimentoRepository>().update(
        item.procedimento.id,
        ProcedimentosCompanion(
          status: drift.Value(ModelStatus.deleted.index),
          atualizadoEm: drift.Value(now),
        ),
      );
      _loadData();
    }
  }

  void _syncWithDatasus() {}

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
                  AppDataTable<ProcedimentoItem>(
                    items: procedimentos,
                    isLoading: isLoading,
                    searchHint: 'Filtrar',
                    emptyMessage: 'Nenhum paciente cadastrado',
                    emptySearchMessage: 'Nenhum resultado para',
                    actions: [
                      SizedBox(
                        width: 150,
                        height: 40,
                        child: AppDropdown<String>(
                          initialValue: _filter.value,
                          label: 'Conduta',
                          hint: 'Todos',
                          items: const [
                            DropdownMenuItem(value: null, child: Text('Todos')),
                            DropdownMenuItem(
                              value: 'catarata',
                              child: Text('Catarata'),
                            ),
                            DropdownMenuItem(
                              value: 'pterigio',
                              child: Text('Pterígio'),
                            ),
                            DropdownMenuItem(
                              value: 'sem_cpf',
                              child: Text('Sem CPF'),
                            ),
                            DropdownMenuItem(
                              value: 'sem_cns',
                              child: Text('Sem CNS'),
                            ),
                            DropdownMenuItem(
                              value: 'sem_tel',
                              child: Text('Sem Telefone'),
                            ),
                          ],
                          onChanged: (value) {
                            _filter.value = value;
                          },
                        ),
                      ),
                      const SizedBox(width: 12),
                      OutlinedButton.icon(
                        onPressed: isLoading ? null : _syncWithDatasus,
                        icon: const Icon(Icons.sync, size: 16),
                        label: const Text('Sinc. com o DATASUS'),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton.icon(
                        onPressed: isLoading ? null : _createProcedimento,
                        icon: const Icon(Icons.add, size: 16),
                        label: const Text('Novo atendimento'),
                      ),
                    ],
                    columns: [
                      TableColumnConfig(
                        label: 'CPF',
                        getValue: (p) => _formatCpf(p.paciente.cpf ?? ''),
                      ),
                      TableColumnConfig(
                        label: 'CNS',
                        getValue: (p) => p.paciente.cns ?? '',
                      ),
                      TableColumnConfig(
                        label: 'Nome',
                        getValue: (p) => p.paciente.nome ?? '',
                      ),
                      TableColumnConfig(
                        label: 'Telefone',
                        getValue: (p) => p.paciente.tel ?? '',
                      ),
                      TableColumnConfig(
                        label: 'Tipo',
                        getValue: (p) => p.procedimento.tipo,
                      ),
                      TableColumnConfig(
                        label: 'Olho',
                        getValue: (p) => p.procedimento.olho,
                      ),
                    ],
                    getSearchText: (p) =>
                        '${p.paciente.nome ?? ''} ${p.paciente.cpf ?? ''} ${p.paciente.cns ?? ''} ${p.paciente.tel ?? ''} ${p.procedimento.tipo ?? ''}',
                    menuActions: (item) {
                      return [
                        TableRowMenuAction(
                          label: 'Editar paciente',
                          icon: Icons.edit,
                          onPressed: _editProcedimento,
                        ),
                        TableRowMenuAction(
                          label: 'Apagar paciente',
                          icon: Icons.delete,
                          onPressed: _deleteProcedimento,
                        ),
                      ];
                    },
                  ),
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
                  'Mutirão de Cirurgia - ${widget.mutirao.dataInicio == widget.mutirao.dataFinal ? widget.mutirao.dataInicio : "${widget.mutirao.dataInicio} a ${widget.mutirao.dataFinal}"}',
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
              title: 'Pacientes atendidos',
              value: _pacientesCount.toString(),
              icon: Icons.people_outline,
            ),
            StatCard(
              title: 'Cirurgias de catarata',
              value: _cirurgiasCatarataCount.toString(),
              icon: Icons.medical_services_outlined,
            ),
            StatCard(
              title: 'Cirurgias de pterígio',
              value: _cirurgiasPterigioCount.toString(),
              icon: Icons.medical_services_outlined,
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
}
