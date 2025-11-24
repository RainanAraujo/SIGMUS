import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../models/mutirao_info.dart';
import '../../../widgets/app_dialog.dart';

class MutiraoFormDialog extends StatefulWidget {
  final MutiraoInfo? mutirao;
  final Function(MutiraoInfo)? onSubmit;

  const MutiraoFormDialog({super.key, this.mutirao, this.onSubmit});

  @override
  State<MutiraoFormDialog> createState() => _MutiraoFormDialogState();
}

class _MutiraoFormDialogState extends State<MutiraoFormDialog> {
  final _formKey = GlobalKey<FormState>();
  final _dateFormat = DateFormat('yyyy-MM-dd');

  // Form fields
  String _tipo = 'cirurgia';
  String _estado = '';
  String _municipio = '';
  String _local = '';
  DateTime? _dataInicio;
  DateTime? _dataFinal;
  String _demandante = '';
  String _contratante = '';
  final List<Colaborador> _equipe = [];
  final List<String> _condutas = [];
  final List<Medico> _medicos = [];

  // Temporary fields for adding items
  final _colaboradorNomeController = TextEditingController();
  final _colaboradorFuncaoController = TextEditingController();
  final _condutaController = TextEditingController();
  final _medicoNomeController = TextEditingController();
  final _medicoCRMController = TextEditingController();

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    if (widget.mutirao != null) {
      _loadMutirao(widget.mutirao!);
    }
  }

  void _loadMutirao(MutiraoInfo mutirao) {
    setState(() {
      _tipo = mutirao.tipo;
      _estado = mutirao.estado ?? '';
      _municipio = mutirao.municipio;
      _local = mutirao.local;
      _dataInicio = DateTime.tryParse(mutirao.dataInicio);
      _dataFinal = DateTime.tryParse(mutirao.dataFinal);
      _demandante = mutirao.demandante ?? '';
      _contratante = mutirao.contratante ?? '';
      // TODO: Carregar equipe, condutas e médicos
    });
  }

  @override
  void dispose() {
    _colaboradorNomeController.dispose();
    _colaboradorFuncaoController.dispose();
    _condutaController.dispose();
    _medicoNomeController.dispose();
    _medicoCRMController.dispose();
    super.dispose();
  }

  Future<void> _selectDateRange() async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      initialDateRange: _dataInicio != null && _dataFinal != null
          ? DateTimeRange(start: _dataInicio!, end: _dataFinal!)
          : null,
      locale: const Locale('pt', 'BR'),
      builder: (context, child) {
        return Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500, maxHeight: 500),
            child: Theme(data: Theme.of(context), child: child!),
          ),
        );
      },
    );

    if (picked != null) {
      setState(() {
        _dataInicio = picked.start;
        _dataFinal = picked.end;
      });
    }
  }

  void _handleSubmit() async {
    if (_formKey.currentState!.validate()) {
      if (_dataInicio == null || _dataFinal == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Selecione a data do mutirão')),
        );
        return;
      }

      setState(() {
        _isLoading = true;
      });

      final mutirao = MutiraoInfo(
        id: widget.mutirao?.id ?? '',
        tipo: _tipo,
        estado: _estado,
        municipio: _municipio,
        local: _local,
        dataInicio: _dateFormat.format(_dataInicio!),
        dataFinal: _dateFormat.format(_dataFinal!),
        demandante: _demandante,
        contratante: _contratante,
        permissions: widget.mutirao?.permissions ?? [],
        createdAt: widget.mutirao?.createdAt ?? DateTime.now(),
        updatedAt: DateTime.now(),
      );

      widget.onSubmit?.call(mutirao);

      setState(() {
        _isLoading = false;
      });

      if (mounted) {
        Navigator.of(context).pop();
      }
    }
  }

  void _addColaborador() {
    if (_colaboradorNomeController.text.isEmpty ||
        _colaboradorFuncaoController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Nome e função são obrigatórios')),
      );
      return;
    }

    setState(() {
      _equipe.add(
        Colaborador(
          nome: _colaboradorNomeController.text,
          funcao: _colaboradorFuncaoController.text,
        ),
      );
      _colaboradorNomeController.clear();
      _colaboradorFuncaoController.clear();
    });
  }

  void _removeColaborador(Colaborador colaborador) {
    setState(() {
      _equipe.remove(colaborador);
    });
  }

  void _addConduta() {
    if (_condutaController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Nome da conduta é obrigatório')),
      );
      return;
    }

    setState(() {
      _condutas.add(_condutaController.text);
      _condutaController.clear();
    });
  }

  void _removeConduta(String conduta) {
    setState(() {
      _condutas.remove(conduta);
    });
  }

  void _addMedico() {
    if (_medicoNomeController.text.isEmpty ||
        _medicoCRMController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Nome e número de registro são obrigatórios'),
        ),
      );
      return;
    }

    setState(() {
      _medicos.add(
        Medico(
          nome: _medicoNomeController.text,
          crm: _medicoCRMController.text,
        ),
      );
      _medicoNomeController.clear();
      _medicoCRMController.clear();
    });
  }

  void _removeMedico(Medico medico) {
    setState(() {
      _medicos.remove(medico);
    });
  }

  String _formatDateRange() {
    if (_dataInicio == null || _dataFinal == null) {
      return 'Selecione a data';
    }

    final format = DateFormat('dd \'de\' MMM \'de\' yy', 'pt_BR');
    if (_dataInicio == _dataFinal) {
      return format.format(_dataInicio!);
    }
    return '${format.format(_dataInicio!)} - ${format.format(_dataFinal!)}';
  }

  @override
  Widget build(BuildContext context) {
    return AppDialog(
      title: widget.mutirao != null ? 'Editar Mutirão' : 'Novo Mutirão',
      description: widget.mutirao != null
          ? 'Edite as informações do mutirão'
          : 'Preencha as informações do novo mutirão',
      maxHeight: 600,
      actions: [
        TextButton(
          onPressed: _isLoading ? null : () => Navigator.of(context).pop(),
          child: const Text('Cancelar'),
        ),
        ElevatedButton(
          onPressed: _isLoading ? null : _handleSubmit,
          child: _isLoading
              ? const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Text('Salvar'),
        ),
      ],
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tipo e Data
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: _tipo,
                    decoration: const InputDecoration(
                      labelText: 'Tipo de Mutirão *',
                    ),
                    items: const [
                      DropdownMenuItem(
                        value: 'cirurgia',
                        child: Text('Cirurgia'),
                      ),
                      DropdownMenuItem(
                        value: 'refracao',
                        child: Text('Refração'),
                      ),
                      DropdownMenuItem(
                        value: 'generico',
                        child: Text('Genérico'),
                      ),
                    ],
                    onChanged: widget.mutirao != null
                        ? null
                        : (value) {
                            setState(() {
                              _tipo = value!;
                            });
                          },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: InkWell(
                    onTap: _selectDateRange,
                    child: InputDecorator(
                      decoration: const InputDecoration(
                        labelText: 'Data *',
                        prefixIcon: Icon(Icons.calendar_today),
                      ),
                      child: Text(_formatDateRange()),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Estado
            DropdownButtonFormField<String>(
              value: _estado.isEmpty ? null : _estado,
              decoration: const InputDecoration(labelText: 'Estado *'),
              items: _getEstados(),
              onChanged: (value) {
                setState(() {
                  _estado = value!;
                  _municipio = '';
                });
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Selecione um estado';
                }
                return null;
              },
            ),

            const SizedBox(height: 16),

            // Município e Local
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: _municipio.isEmpty ? null : _municipio,
                    decoration: const InputDecoration(labelText: 'Município *'),
                    items: _getMunicipios(),
                    onChanged: _estado.isEmpty
                        ? null
                        : (value) {
                            setState(() {
                              _municipio = value!;
                            });
                          },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Selecione um município';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextFormField(
                    initialValue: _local,
                    decoration: const InputDecoration(
                      labelText: 'Local *',
                      hintText: 'Digite o local',
                    ),
                    onChanged: (value) => _local = value,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Digite o local';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Demandante e Contratante
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    initialValue: _demandante,
                    decoration: const InputDecoration(
                      labelText: 'Demandante *',
                      hintText: 'Digite o demandante',
                      helperText: 'Pessoa ou entidade que solicitou o mutirão',
                    ),
                    onChanged: (value) => _demandante = value,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Digite o demandante';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextFormField(
                    initialValue: _contratante,
                    decoration: const InputDecoration(
                      labelText: 'Contratante *',
                      hintText: 'Digite o contratante',
                      helperText: 'Pessoa ou entidade que contratou o mutirão',
                    ),
                    onChanged: (value) => _contratante = value,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Digite o contratante';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),

            // Condutas (apenas para tipo genérico)
            if (_tipo == 'generico') ...[
              const SizedBox(height: 24),
              const Divider(),
              const SizedBox(height: 16),
              Text('Condutas', style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _condutaController,
                      decoration: const InputDecoration(
                        labelText: 'Nome da conduta',
                        hintText: 'Digite a conduta',
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: _addConduta,
                    child: const Text('Adicionar'),
                  ),
                ],
              ),
              if (_condutas.isNotEmpty) ...[
                const SizedBox(height: 16),
                _buildCondutasTable(),
              ],
            ],

            // Equipe envolvida
            const SizedBox(height: 24),
            const Divider(),
            const SizedBox(height: 16),
            Text(
              'Equipe envolvida',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _colaboradorNomeController,
                    decoration: const InputDecoration(
                      labelText: 'Nome',
                      hintText: 'Digite o nome',
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: _colaboradorFuncaoController,
                    decoration: const InputDecoration(
                      labelText: 'Função',
                      hintText: 'Digite a função',
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _addColaborador,
                  child: const Text('Adicionar'),
                ),
              ],
            ),
            if (_equipe.isNotEmpty) ...[
              const SizedBox(height: 16),
              _buildEquipeTable(),
            ],

            // Profissionais de saúde
            const SizedBox(height: 24),
            const Divider(),
            const SizedBox(height: 16),
            Text(
              'Profissionais de saúde',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _medicoNomeController,
                    decoration: const InputDecoration(
                      labelText: 'Nome',
                      hintText: 'Digite o nome',
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: _medicoCRMController,
                    decoration: const InputDecoration(
                      labelText: 'Nº Registro',
                      hintText: 'Digite o número de registro',
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _addMedico,
                  child: const Text('Adicionar'),
                ),
              ],
            ),
            if (_medicos.isNotEmpty) ...[
              const SizedBox(height: 16),
              _buildMedicosTable(),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildCondutasTable() {
    return Card(
      child: Column(
        children: _condutas.map((conduta) {
          return ListTile(
            dense: true,
            title: Text(conduta),
            trailing: IconButton(
              icon: const Icon(Icons.delete_outline),
              onPressed: () => _removeConduta(conduta),
              tooltip: 'Remover',
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildEquipeTable() {
    return Card(
      child: Column(
        children: _equipe.map((colaborador) {
          return ListTile(
            dense: true,
            title: Text(colaborador.nome),
            subtitle: Text(colaborador.funcao),
            trailing: IconButton(
              icon: const Icon(Icons.delete_outline),
              onPressed: () => _removeColaborador(colaborador),
              tooltip: 'Remover',
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildMedicosTable() {
    return Card(
      child: Column(
        children: _medicos.map((medico) {
          return ListTile(
            dense: true,
            title: Text(medico.nome),
            subtitle: Text(medico.crm),
            trailing: IconButton(
              icon: const Icon(Icons.delete_outline),
              onPressed: () => _removeMedico(medico),
              tooltip: 'Remover',
            ),
          );
        }).toList(),
      ),
    );
  }

  List<DropdownMenuItem<String>> _getEstados() {
    // TODO: Carregar estados do arquivo JSON
    return const [
      DropdownMenuItem(value: 'SP', child: Text('São Paulo')),
      DropdownMenuItem(value: 'RJ', child: Text('Rio de Janeiro')),
      DropdownMenuItem(value: 'MG', child: Text('Minas Gerais')),
      DropdownMenuItem(value: 'BA', child: Text('Bahia')),
      DropdownMenuItem(value: 'PR', child: Text('Paraná')),
    ];
  }

  List<DropdownMenuItem<String>> _getMunicipios() {
    // TODO: Carregar municípios do estado selecionado do arquivo JSON
    if (_estado.isEmpty) return [];

    return const [
      DropdownMenuItem(value: 'São Paulo', child: Text('São Paulo')),
      DropdownMenuItem(value: 'Campinas', child: Text('Campinas')),
      DropdownMenuItem(value: 'Santos', child: Text('Santos')),
    ];
  }
}

// Classes auxiliares
class Colaborador {
  final String nome;
  final String funcao;

  Colaborador({required this.nome, required this.funcao});
}

class Medico {
  final String nome;
  final String crm;

  Medico({required this.nome, required this.crm});
}
