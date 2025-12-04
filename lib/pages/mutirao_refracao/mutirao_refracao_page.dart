import 'package:flutter/material.dart';
import 'package:sigmus/models/conduta_item.dart';
import 'package:sigmus/pages/mutirao_refracao/refracao_dialog.dart';
import 'package:sigmus/theme/app_colors.dart';
import 'package:sigmus/theme/app_typography.dart';
import 'package:sigmus/utils/formatters.dart';
import 'package:sigmus/widgets/app_alert.dart';
import 'package:sigmus/widgets/app_data_table.dart';
import 'package:sigmus/widgets/app_dropdown.dart';
import 'package:sigmus/widgets/stat_card.dart';

class MutiraoRefracaoPage extends StatefulWidget {
  final int mutiraoId;

  const MutiraoRefracaoPage({super.key, required this.mutiraoId});

  @override
  State<MutiraoRefracaoPage> createState() => _MutiraoRefracaoPageState();
}

class _MutiraoRefracaoPageState extends State<MutiraoRefracaoPage> {
  final _condutaFiltro = ValueNotifier<String?>(null);
  final _condutas = ValueNotifier<List<CondutaItem>>([]);

  @override
  void initState() {
    super.initState();
    _condutaFiltro.addListener(_onFiltroChanged);
  }

  @override
  void dispose() {
    _condutaFiltro.removeListener(_onFiltroChanged);
    _condutaFiltro.dispose();
    _condutas.dispose();
    super.dispose();
  }

  void _onFiltroChanged() {
    setState(() {});
  }

  List<CondutaItem> get _condutasFiltradas {
    final filtro = _condutaFiltro.value;
    if (filtro == null) return _condutas.value;

    return _condutas.value.where((c) {
      final tipo = (c.conduta.tipo ?? '').toLowerCase();
      return tipo.contains(filtro.toLowerCase());
    }).toList();
  }

  int get _pacientesCount => _condutas.value.length;

  int get _altasCount => _condutas.value
      .where((c) => (c.conduta.tipo ?? '').toLowerCase().contains('alta'))
      .length;

  int get _encaminhamentosCount => _condutas.value
      .where(
        (c) => (c.conduta.tipo ?? '').toLowerCase().contains('encaminhamento'),
      )
      .length;

  int get _prescricoesCount => _condutas.value
      .where(
        (c) =>
            (c.conduta.tipo ?? '').toLowerCase().contains('prescrição') ||
            (c.conduta.tipo ?? '').toLowerCase().contains('prescricao'),
      )
      .length;

  void _createConduta() {
    showDialog(
      context: context,
      builder: (context) => RefracaoFormDialog(
        datasDisponiveis: const [],
        medicosDisponiveis: const [],
        onSubmit: (item) {
          _condutas.value = [..._condutas.value, item];
          setState(() {});
        },
      ),
    );
  }

  void _editConduta(CondutaItem item) {
    showDialog(
      context: context,
      builder: (context) => RefracaoFormDialog(
        condutaItem: item,
        datasDisponiveis: const [],
        medicosDisponiveis: const [],
        onSubmit: (updatedItem) {
          final condutas = [..._condutas.value];
          final index = condutas.indexWhere(
            (c) => c.conduta.pacienteId == item.conduta.pacienteId,
          );
          if (index != -1) {
            condutas[index] = updatedItem;
            _condutas.value = condutas;
            setState(() {});
          }
        },
      ),
    );
  }

  void _syncDataSUS() {
    // TODO: Implementar sincronização com DATASUS
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

    if (confirmed == true) {
      final condutas = [..._condutas.value];
      condutas.removeWhere(
        (c) => c.conduta.pacienteId == item.conduta.pacienteId,
      );
      _condutas.value = condutas;
      setState(() {});
    }
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
                  "Cidade",
                  style: AppTypography.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'TIPO + DATA DO MUTIRÃO',
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
              value: "0",
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
      items: _condutasFiltradas,
      isLoading: false,
      searchHint: 'Filtrar',
      emptyMessage: 'Nenhum paciente cadastrado',
      emptySearchMessage: 'Nenhum resultado para',
      actions: [
        SizedBox(
          width: 200,
          height: 40,
          child: AppDropdown<String>(
            value: _condutaFiltro.value,
            label: 'Conduta',
            hint: 'Todos',
            items: const [
              DropdownMenuItem(value: null, child: Text('Todos')),
              DropdownMenuItem(
                value: 'prescrição',
                child: Text('Prescrição de óculos'),
              ),
              DropdownMenuItem(value: 'cirurgia', child: Text('Cirurgia')),
              DropdownMenuItem(
                value: 'encaminhamento',
                child: Text('Encaminhamento'),
              ),
              DropdownMenuItem(value: 'alta', child: Text('Alta')),
            ],
            onChanged: (value) {
              _condutaFiltro.value = value;
            },
          ),
        ),
        const SizedBox(width: 8),
        OutlinedButton.icon(
          onPressed: _syncDataSUS,
          icon: const Icon(Icons.sync, size: 16),
          label: const Text('Sinc. com o DATASUS'),
        ),
        const SizedBox(width: 8),
        ElevatedButton.icon(
          onPressed: _createConduta,
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
          getValue: (c) => formatCpf(c.paciente.cpf ?? ''),
        ),
        TableColumnConfig(
          label: 'CNS',
          getValue: (c) => formatCns(c.paciente.cns ?? ''),
        ),
        TableColumnConfig(
          label: 'Telefone',
          getValue: (c) => c.paciente.tel ?? '',
        ),
        TableColumnConfig(
          label: 'Conduta',
          getValue: (c) => c.conduta.tipo ?? '',
        ),
      ],
      getSearchText: (c) =>
          '${c.paciente.nome ?? ''} ${c.paciente.cpf ?? ''} ${c.paciente.cns ?? ''} ${c.paciente.tel ?? ''} ${c.conduta.tipo ?? ''}',
      menuActions: [
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
