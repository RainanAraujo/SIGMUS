import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:sigmus/database/app_database.dart';
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
  final _condutaFiltro = ValueNotifier<String?>(null);
  late final Listenable _dataListener;

  List<ProcedimentoItem> procedimentos = [];
  bool isLoading = false;

  List<Procedimento> procedimentoList = [];
  List<Paciente> pacienteList = [];
  List<Medico> medicoList = [];

  int get _pacientesCount => procedimentos.length;
  int get _cirurgiasCatarataCount => procedimentos
      .where((p) => (p.procedimento.tipo).toLowerCase().contains('catarata'))
      .length;
  int get _cirurgiasPterigioCount => procedimentos
      .where((p) => (p.procedimento.tipo).toLowerCase().contains('pterígio'))
      .length;

  @override
  void initState() {
    super.initState();

    _dataListener = Listenable.merge([_condutaFiltro]);
    _dataListener.addListener(_filterData);

    _loadData();
  }

  @override
  void dispose() {
    _dataListener.removeListener(_filterData);
    _condutaFiltro.dispose();
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
        mutiraoId: widget.mutirao.id,
      );

      print(medicoList);

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
    final condutaFiltro = _condutaFiltro.value;

    final procedimentosFiltrados = procedimentoList.where((proc) {
      final tipo = (proc.tipo).toLowerCase();
      if (!tipo.contains('catarata') && !tipo.contains('pterígio')) {
        return false;
      }

      if (condutaFiltro != null) {
        if (!tipo.contains(condutaFiltro.toLowerCase())) {
          return false;
        }
      }

      return true;
    }).toList();

    final items = procedimentosFiltrados
        .map((proc) {
          final paciente = pacienteList.firstWhereOrNull(
            (p) => p.id == proc.pacienteId,
          );
          final medico = medicoList.firstWhereOrNull(
            (m) => m.id == proc.medicoId,
          );

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
        .toList();

    procedimentos = items;
    isLoading = false;
  }

  List<String> _getDatasDisponiveis() {
    final dataInicio = DateTime.tryParse(widget.mutirao.dataInicio);
    final dataFinal = DateTime.tryParse(widget.mutirao.dataFinal);

    if (dataInicio == null || dataFinal == null) return [];

    final datas = <String>[];
    var current = dataInicio;
    while (!current.isAfter(dataFinal)) {
      datas.add(current.toIso8601String().split('T').first);
      current = current.add(const Duration(days: 1));
    }
    return datas;
  }

  void _createProcedimento() {
    showDialog(
      context: context,
      builder: (context) => CirurgiaFormDialog(
        mutirao: widget.mutirao,
        datasDisponiveis: _getDatasDisponiveis(),
        medicosDisponiveis: medicoList,
        onSubmit: (item) {
          procedimentos = [...procedimentos, item];
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
        datasDisponiveis: _getDatasDisponiveis(),
        medicosDisponiveis: medicoList,
        onSubmit: (updatedItem) {
          final index = procedimentos.indexWhere(
            (p) => p.procedimento.pacienteId == item.procedimento.pacienteId,
          );
          if (index != -1) {
            procedimentos[index] = updatedItem;
          }
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

    if (confirmed == true) {
      procedimentos.removeWhere(
        (p) => p.procedimento.pacienteId == item.procedimento.pacienteId,
      );
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
                          value: _condutaFiltro.value,
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
                          ],
                          onChanged: (value) {
                            _condutaFiltro.value = value;
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
                        label: 'Nome',
                        getValue: (p) => p.paciente.nome ?? '',
                      ),
                      TableColumnConfig(
                        label: 'CPF',
                        getValue: (p) => _formatCpf(p.paciente.cpf ?? ''),
                      ),
                      TableColumnConfig(
                        label: 'CNS',
                        getValue: (p) => p.paciente.cns ?? '',
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
                  widget.mutirao.tipo,
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
