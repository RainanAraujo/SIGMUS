import 'package:flutter/material.dart';
import 'package:sigmus/extensions/response_ext.dart';
import 'package:sigmus/generated/sigmus_api.swagger.dart';
import 'package:sigmus/models/procedimento_item.dart';
import 'package:sigmus/pages/mutirao_cirurgia/cirurgia_dialog.dart';
import 'package:sigmus/services/sigmus_api.dart';
import 'package:sigmus/theme/app_colors.dart';
import 'package:sigmus/theme/app_typography.dart';
import 'package:sigmus/widgets/app_alert.dart';
import 'package:sigmus/widgets/app_data_table.dart';
import 'package:sigmus/widgets/app_dropdown.dart';
import 'package:sigmus/widgets/app_toast.dart';
import 'package:sigmus/widgets/stat_card.dart';

class TableState {
  final List<ProcedimentoItem> procedimentos;
  final bool isLoading;

  const TableState({this.procedimentos = const [], this.isLoading = false});

  TableState copyWith({
    List<ProcedimentoItem>? procedimentos,
    bool? isLoading,
  }) {
    return TableState(
      procedimentos: procedimentos ?? this.procedimentos,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class MutiraoCirurgiaPage extends StatefulWidget {
  final int mutiraoId;

  const MutiraoCirurgiaPage({super.key, required this.mutiraoId});

  @override
  State<MutiraoCirurgiaPage> createState() => _MutiraoCirurgiaPageState();
}

class _MutiraoCirurgiaPageState extends State<MutiraoCirurgiaPage> {
  // ===== Dados do mutirão (carregados uma vez) =====
  MutiraoData? _mutiraoData;

  // ===== ValueNotifiers que disparam _loadData =====
  final _condutaFiltro = ValueNotifier<String?>(null);

  // Listener combinado
  late final Listenable _dataListener;

  // ===== Estado da tabela (só a tabela reconstrói) =====
  final _tableState = ValueNotifier<TableState>(const TableState());

  // ===== Cache dos dados brutos da API =====
  Map<String, Paciente> _pacientesMap = {};
  Map<String, Procedimento> _procedimentosMap = {};
  Map<String, Medico> _medicosMap = {};

  // ===== Contadores do header =====
  int get _pacientesCount => _tableState.value.procedimentos.length;
  int get _cirurgiasCatarataCount => _tableState.value.procedimentos
      .where(
        (p) => (p.procedimento.tipo ?? '').toLowerCase().contains('catarata'),
      )
      .length;
  int get _cirurgiasPterigioCount => _tableState.value.procedimentos
      .where(
        (p) => (p.procedimento.tipo ?? '').toLowerCase().contains('pterígio'),
      )
      .length;

  @override
  void initState() {
    super.initState();

    // Merge de todos os notifiers que disparam _loadData
    _dataListener = Listenable.merge([_condutaFiltro]);

    // Escuta mudanças - chama _filterData sem rebuild da página
    _dataListener.addListener(_filterData);

    _loadData();
  }

  @override
  void dispose() {
    _dataListener.removeListener(_filterData);
    _condutaFiltro.dispose();
    _tableState.dispose();
    super.dispose();
  }

  Future<void> _loadData() async {
    _tableState.value = _tableState.value.copyWith(isLoading: true);

    try {
      final res = await sigmusApi.getMutiraoMudancas(
        mutiraoID: widget.mutiraoId,
      );

      if (!res.isSuccessful) {
        throw res.errorMessage?.messagem ?? 'Erro Desconhecido';
      }

      final body = res.body;
      if (body == null) {
        throw 'Resposta vazia';
      }

      setState(() {
        _mutiraoData = body.mutirao;
      });

      _pacientesMap = {};
      body.mudancas?.pacientes?.forEach((key, value) {
        _pacientesMap[key] = Paciente.fromJson(value);
      });

      _procedimentosMap = {};
      body.mudancas?.procedimentos?.forEach((key, value) {
        _procedimentosMap[key] = Procedimento.fromJson(value);
      });

      // Parseia médicos
      _medicosMap = {};
      body.mudancas?.medicos?.forEach((key, value) {
        _medicosMap[key] = Medico.fromJson(value);
      });

      _filterData();

      AppToast.show(context, message: 'Dados carregados com sucesso');
    } catch (e) {
      _tableState.value = _tableState.value.copyWith(isLoading: false);
      AppToast.show(context, message: 'Erro: $e', isError: true);
    }
  }

  void _filterData() {
    final condutaFiltro = _condutaFiltro.value;

    final procedimentosFiltrados = _procedimentosMap.entries.where((entry) {
      final proc = entry.value;

      if (proc.status != 1) return false;

      final tipo = (proc.tipo ?? '').toLowerCase();
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

    final items = procedimentosFiltrados.map((entry) {
      final proc = entry.value;
      final paciente = _pacientesMap[proc.pacienteId.toString()];

      return ProcedimentoItem(
        paciente:
            paciente ??
            Paciente(
              atualizadoEm: 0,
              status: 0,
              nome: 'Paciente não encontrado',
            ),
        procedimento: proc,
        medico:
            _medicosMap[proc.medicoId.toString()] ??
            Medico(
              atualizadoEm: 0,
              status: 0,
              nome: 'Médico não encontrado',
              crm: '',
            ),
      );
    }).toList();

    _tableState.value = _tableState.value.copyWith(
      procedimentos: items,
      isLoading: false,
    );
  }

  List<String> _getDatasDisponiveis() {
    if (_mutiraoData == null) return [];

    final dataInicio = DateTime.tryParse(_mutiraoData!.dataInicio);
    final dataFinal = DateTime.tryParse(_mutiraoData!.dataFinal);

    if (dataInicio == null || dataFinal == null) return [];

    final datas = <String>[];
    var current = dataInicio;
    while (!current.isAfter(dataFinal)) {
      datas.add(current.toIso8601String().split('T').first);
      current = current.add(const Duration(days: 1));
    }
    return datas;
  }

  List<Medico> _getMedicosDisponiveis() {
    return _medicosMap.values.where((m) => m.status == 1).toList();
  }

  void _createProcedimento() {
    showDialog(
      context: context,
      builder: (context) => CirurgiaFormDialog(
        datasDisponiveis: _getDatasDisponiveis(),
        medicosDisponiveis: _getMedicosDisponiveis(),
        onSubmit: (item) {
          // TODO: Salvar via API
          _tableState.value = _tableState.value.copyWith(
            procedimentos: [..._tableState.value.procedimentos, item],
          );
          AppToast.show(context, message: 'Procedimento criado com sucesso');
        },
      ),
    );
  }

  void _editProcedimento(ProcedimentoItem item) {
    showDialog(
      context: context,
      builder: (context) => CirurgiaFormDialog(
        procedimento: item,
        datasDisponiveis: _getDatasDisponiveis(),
        medicosDisponiveis: _getMedicosDisponiveis(),
        onSubmit: (updatedItem) {
          // TODO: Salvar via API
          final procedimentos = [..._tableState.value.procedimentos];
          final index = procedimentos.indexWhere(
            (p) => p.procedimento.pacienteId == item.procedimento.pacienteId,
          );
          if (index != -1) {
            procedimentos[index] = updatedItem;
            _tableState.value = _tableState.value.copyWith(
              procedimentos: procedimentos,
            );
          }
          AppToast.show(
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
      // TODO: Implementar exclusão via API
      final procedimentos = [..._tableState.value.procedimentos];
      procedimentos.removeWhere(
        (p) => p.procedimento.pacienteId == item.procedimento.pacienteId,
      );
      _tableState.value = _tableState.value.copyWith(
        procedimentos: procedimentos,
      );
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

                  ValueListenableBuilder<TableState>(
                    valueListenable: _tableState,
                    builder: (context, state, _) {
                      return AppDataTable<ProcedimentoItem>(
                        items: state.procedimentos,
                        isLoading: state.isLoading,
                        searchHint: 'Filtrar',
                        emptyMessage: 'Nenhum paciente cadastrado',
                        emptySearchMessage: 'Nenhum resultado para',
                        actions: [
                          // Dropdown de filtro de conduta
                          SizedBox(
                            width: 150,
                            height: 40,
                            child: AppDropdown<String>(
                              value: _condutaFiltro.value,
                              label: 'Conduta',
                              hint: 'Todos',
                              items: const [
                                DropdownMenuItem(
                                  value: null,
                                  child: Text('Todos'),
                                ),
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
                            onPressed: state.isLoading
                                ? null
                                : _syncWithDatasus,
                            icon: const Icon(Icons.sync, size: 16),
                            label: const Text('Sinc. com o DATASUS'),
                          ),
                          const SizedBox(width: 8),
                          ElevatedButton.icon(
                            onPressed: state.isLoading
                                ? null
                                : _createProcedimento,
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
                            getValue: (p) => p.procedimento.tipo ?? '',
                          ),
                          TableColumnConfig(
                            label: 'Olho',
                            getValue: (p) => p.procedimento.olho ?? '',
                          ),
                        ],
                        getSearchText: (p) =>
                            '${p.paciente.nome ?? ''} ${p.paciente.cpf ?? ''} ${p.paciente.cns ?? ''} ${p.paciente.tel ?? ''} ${p.procedimento.tipo ?? ''}',
                        menuActions: [
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
                        ],
                      );
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
                  _mutiraoData?.municipio ?? 'Carregando...',
                  style: AppTypography.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  _mutiraoData != null
                      ? '${_mutiraoData!.tipo} (${_mutiraoData!.dataInicio})'
                      : '',
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

        final statsCards = ValueListenableBuilder<TableState>(
          valueListenable: _tableState,
          builder: (context, state, _) {
            return Wrap(
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
          },
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
