import 'package:flutter/material.dart';
import 'package:sigmus/layouts/main_layout.dart';
import 'package:sigmus/models/mutirao_info.dart';
import 'package:sigmus/widgets/app_data_table.dart';
import 'package:sigmus/widgets/stat_card.dart';
import 'package:sigmus/pages/home/dialogs/mutirao_form_dialog.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<MutiraoInfo> mutiroes = [
    MutiraoInfo(
      id: 1,
      dataInicio: '2024-06-10',
      dataFinal: '2024-06-15',
      tipo: 'cirurgia',
      estado: 'SP',
      municipio: 'São Paulo',
      local: 'Clínica Central',
      demandante: 'Secretaria de Saúde',
      contratante: 'Prefeitura de São Paulo',
      permissions: [],
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
  ];
  bool isLoading = false;
  bool isOnline = true;
  int pacientesCount = 0;
  int cirurgiasCount = 0;
  int prescricoesOculosCount = 0;

  @override
  void initState() {
    super.initState();
    _loadData();
    _registerShortcuts();
  }

  void _registerShortcuts() {
    // Registrar atalhos de teclado
  }

  Future<void> _loadData() async {
    setState(() {
      isLoading = true;
    });

    // Carregar dados dos mutirões
    // TODO: Implementar carregamento real dos dados

    setState(() {
      isLoading = false;
    });
  }

  void _createMutirao() {
    showDialog(
      context: context,
      builder: (context) => MutiraoFormDialog(
        onSubmit: (mutirao) {
          setState(() {
            mutiroes.add(mutirao);
          });
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
          setState(() {
            final index = mutiroes.indexWhere((m) => m.id == mutirao.id);
            if (index != -1) {
              mutiroes[index] = updatedMutirao;
            }
          });
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Mutirão atualizado com sucesso!')),
          );
        },
      ),
    );
  }

  void _deleteMutirao(MutiraoInfo mutirao) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirmar exclusão'),
        content: Text(
          'Tem certeza que deseja excluir o mutirão de ${mutirao.municipio}?\n\nA exclusão é permanente e não pode ser desfeita.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          TextButton(
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            onPressed: () {
              Navigator.pop(context);
              // TODO: Implementar exclusão
            },
            child: const Text('Excluir Mutirão'),
          ),
        ],
      ),
    );
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

  String _formatDateRange(String inicio, String fim) {
    if (inicio == fim) {
      return inicio;
    }
    return '$inicio - $fim';
  }

  String _capitalize(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      isOnline: isOnline,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitleSection(),
            const SizedBox(height: 16),
            _buildStatsCards(),
            const SizedBox(height: 24),

            // Tabela de mutirões
            AppDataTable<MutiraoInfo>(
              items: mutiroes,
              isLoading: isLoading,
              searchHint: 'Buscar por município, local, tipo ou data...',
              emptyMessage: 'Nenhum mutirão encontrado',
              emptySearchMessage: 'Nenhum resultado para',
              actions: [
                OutlinedButton.icon(
                  onPressed: isLoading ? null : _loadData,
                  icon: const Icon(Icons.refresh),
                  label: const Text('Atualizar'),
                ),
                const SizedBox(width: 8),
                ElevatedButton.icon(
                  onPressed: isLoading ? null : _createMutirao,
                  icon: const Icon(Icons.add),
                  label: const Text('Criar mutirão'),
                ),
              ],
              columns: [
                TableColumnConfig(
                  label: 'Data',
                  getValue: (mutirao) =>
                      _formatDateRange(mutirao.dataInicio, mutirao.dataFinal),
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
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTitleSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Mutirões',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        Text(
          'Lista de mutirões',
          style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
        ),
      ],
    );
  }

  Widget _buildStatsCards() {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: [
        StatCard(
          title: 'Mutirões criados',
          value: mutiroes.length.toString(),
          icon: Icons.assignment,
        ),
        StatCard(
          title: 'Pacientes atendidos',
          value: pacientesCount.toString(),
          icon: Icons.people,
        ),
        StatCard(
          title: 'Cirurgias realizadas',
          value: cirurgiasCount.toString(),
          icon: Icons.business_center,
        ),
        StatCard(
          title: 'Prescrições de óculos realizadas',
          value: prescricoesOculosCount.toString(),
          icon: Icons.visibility,
        ),
      ],
    );
  }
}
