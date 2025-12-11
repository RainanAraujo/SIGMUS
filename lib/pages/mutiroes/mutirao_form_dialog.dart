import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:sigmus/data/brasil_data.dart';
import 'package:sigmus/models/mutirao_item.dart';
import 'package:sigmus/repositories/colaborador_repository.dart';
import 'package:sigmus/repositories/medico_repository.dart';
import 'package:sigmus/repositories/mutirao_repository.dart';
import 'package:sigmus/theme/app_colors.dart';
import 'package:sigmus/widgets/app_date_range_picker.dart';
import 'package:sigmus/widgets/app_dialog.dart';
import 'package:sigmus/widgets/app_dropdown.dart';
import 'package:sigmus/widgets/app_searchable_select.dart';
import 'package:sigmus/widgets/app_toast.dart';
import 'package:sigmus/widgets/form_row.dart';

class ColaboradorItem {
  final String nome;
  final String funcao;

  ColaboradorItem({required this.nome, required this.funcao});
}

class MedicoItem {
  final String nome;
  final String crm;

  MedicoItem({required this.nome, required this.crm});
}

class MutiraoFormDialog extends StatefulWidget {
  final MutiraoItem? mutirao;
  final Function(MutiraoItem)? onSubmit;

  const MutiraoFormDialog({super.key, this.mutirao, this.onSubmit});

  @override
  State<MutiraoFormDialog> createState() => _MutiraoFormDialogState();
}

class _MutiraoFormDialogState extends State<MutiraoFormDialog> {
  final _formKey = GlobalKey<FormState>();

  String _tipo = 'cirurgia';
  String _estado = '';
  String _municipio = '';
  String _local = '';
  DateTime? _dataInicio;
  DateTime? _dataFinal;
  String _demandante = '';
  String _contratante = '';
  List<ColaboradorItem> _colaboradores = [];
  List<MedicoItem> _medicos = [];
  List<String> _condutas = [];

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

  void _loadMutirao(MutiraoItem mutirao) async {
    _tipo = mutirao.tipo;
    _estado = mutirao.estado;
    _municipio = mutirao.municipio;
    _local = mutirao.local;
    _dataInicio = DateTime.tryParse(mutirao.dataInicio);
    _dataFinal = DateTime.tryParse(mutirao.dataFinal);
    _demandante = mutirao.demandante;
    _contratante = mutirao.contratante;
    final colaboradorList = await GetIt.I<ColaboradorRepository>().getAll(
      mutiraoId: mutirao.id,
    );
    _colaboradores = colaboradorList
        .map(
          (colaborador) => ColaboradorItem(
            nome: colaborador.nome,
            funcao: colaborador.funcao,
          ),
        )
        .toList();
    _condutas = await GetIt.I<MutiraoRepository>().getCondutas(
      mutiraoId: mutirao.id,
    );

    final medicoList = await GetIt.I<MedicoRepository>().getAll(
      mutiraoId: mutirao.id,
    );

    _medicos = medicoList
        .map((medico) => MedicoItem(nome: medico.nome, crm: medico.crm))
        .toList();

    setState(() {});
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

  void _handleSubmit() async {
    if (_formKey.currentState!.validate()) {
      if (_dataInicio == null || _dataFinal == null) {
        AppToast.error(context, message: 'Selecione a data do mutirão');
        return;
      }

      setState(() {
        _isLoading = true;
      });

      final mutirao = widget.mutirao;

      widget.onSubmit?.call(mutirao!);

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
      AppToast.error(context, message: 'Nome e função são obrigatórios');
      return;
    }

    setState(() {
      _colaboradores.add(
        ColaboradorItem(
          nome: _colaboradorNomeController.text,
          funcao: _colaboradorFuncaoController.text,
        ),
      );
      _colaboradorNomeController.clear();
      _colaboradorFuncaoController.clear();
    });
  }

  void _removeColaborador(ColaboradorItem colaborador) {
    setState(() {
      _colaboradores.remove(colaborador);
    });
  }

  void _addConduta() {
    if (_condutaController.text.isEmpty) {
      AppToast.error(context, message: 'Nome da conduta é obrigatório');
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
      AppToast.error(
        context,
        message: 'Nome e número de registro são obrigatórios',
      );
      return;
    }

    setState(() {
      _medicos.add(
        MedicoItem(
          nome: _medicoNomeController.text,
          crm: _medicoCRMController.text,
        ),
      );
      _medicoNomeController.clear();
      _medicoCRMController.clear();
    });
  }

  void _removeMedico(MedicoItem medico) {
    setState(() {
      _medicos.remove(medico);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppDialog(
      title: widget.mutirao != null ? 'Editar Mutirão' : 'Novo Mutirão',
      description: widget.mutirao != null
          ? 'Edite as informações do mutirão'
          : 'Preencha as informações do novo mutirão',

      actions: [
        OutlinedButton(
          onPressed: _isLoading ? null : () => Navigator.of(context).pop(),
          child: const Text('Cancelar'),
        ),
        ElevatedButton(
          onPressed: _isLoading ? null : _handleSubmit,
          child: _isLoading
              ? const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: AppColors.primaryForeground,
                  ),
                )
              : const Text('Salvar'),
        ),
      ],
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FormRow(
              children: [
                AppDropdown<String>(
                  value: _tipo,
                  label: 'Tipo de Mutirão',
                  isRequired: true,
                  enabled: widget.mutirao == null,
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
                  onChanged: (value) => setState(() => _tipo = value!),
                ),
                AppDateRangePicker(
                  label: 'Data',
                  isRequired: true,
                  startDate: _dataInicio,
                  endDate: _dataFinal,
                  firstDate: DateTime(2025),
                  lastDate: DateTime(2030),
                  onChanged: (range) {
                    if (range != null) {
                      setState(() {
                        _dataInicio = range.start;
                        _dataFinal = range.end;
                      });
                    }
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            AppSearchableSelect<String>(
              key: const ValueKey('estado'),
              label: 'Estado',
              isRequired: true,
              value: _estado.isEmpty ? null : _estado,
              options: _getEstadosOptions(),
              searchHint: 'Buscar estado...',
              onChanged: (value) => setState(() {
                _estado = value ?? '';
                _municipio = '';
              }),
              validator: (value) {
                if (value == null || value.isEmpty)
                  return 'Selecione um estado';
                return null;
              },
            ),
            const SizedBox(height: 16),
            FormRow(
              children: [
                AppSearchableSelect<String>(
                  key: const ValueKey('municipio'),
                  label: 'Município',
                  isRequired: true,
                  value: _municipio.isEmpty ? null : _municipio,
                  options: _getMunicipiosOptions(),
                  enabled: _estado.isNotEmpty,
                  searchHint: 'Buscar município...',
                  onChanged: (value) =>
                      setState(() => _municipio = value ?? ''),
                  validator: (value) {
                    if (value == null || value.isEmpty)
                      return 'Selecione um município';
                    return null;
                  },
                ),
                TextFormField(
                  initialValue: _local,
                  decoration: const InputDecoration(
                    labelText: 'Local *',
                    hintText: 'Digite o local',
                  ),
                  onChanged: (value) => _local = value,
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'Digite o local';
                    return null;
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            FormRow(
              children: [
                TextFormField(
                  initialValue: _demandante,
                  decoration: const InputDecoration(
                    labelText: 'Demandante *',
                    hintText: 'Digite o demandante',
                    helperText: 'Pessoa ou entidade que solicitou o mutirão',
                  ),
                  onChanged: (value) => _demandante = value,
                  validator: (value) {
                    if (value == null || value.isEmpty)
                      return 'Digite o demandante';
                    return null;
                  },
                ),
                TextFormField(
                  initialValue: _contratante,
                  decoration: const InputDecoration(
                    labelText: 'Contratante *',
                    hintText: 'Digite o contratante',
                    helperText: 'Pessoa ou entidade que contratou o mutirão',
                  ),
                  onChanged: (value) => _contratante = value,
                  validator: (value) {
                    if (value == null || value.isEmpty)
                      return 'Digite o contratante';
                    return null;
                  },
                ),
              ],
            ),
            if (_tipo == 'generico') ...[
              const SizedBox(height: 24),
              Container(
                margin: const EdgeInsets.only(bottom: 16),
                height: 1,
                color: AppColors.border,
              ),
              const Text(
                'Condutas',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.foreground,
                ),
              ),
              const SizedBox(height: 16),
              FormRow(
                suffix: ElevatedButton(
                  onPressed: _addConduta,
                  child: const Text('Adicionar'),
                ),
                children: [
                  TextField(
                    controller: _condutaController,
                    decoration: const InputDecoration(
                      labelText: 'Nome da conduta',
                      hintText: 'Digite a conduta',
                    ),
                  ),
                ],
              ),
              if (_condutas.isNotEmpty) ...[
                const SizedBox(height: 16),
                _buildCondutasTable(),
              ],
            ],
            const SizedBox(height: 24),
            Container(
              margin: const EdgeInsets.only(bottom: 16),
              height: 1,
              color: AppColors.border,
            ),
            const Text(
              'Equipe envolvida',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.foreground,
              ),
            ),
            const SizedBox(height: 16),
            FormRow(
              suffix: ElevatedButton(
                onPressed: _addColaborador,
                child: const Text('Adicionar'),
              ),
              children: [
                TextField(
                  controller: _colaboradorNomeController,
                  decoration: const InputDecoration(
                    labelText: 'Nome',
                    hintText: 'Digite o nome',
                  ),
                ),
                TextField(
                  controller: _colaboradorFuncaoController,
                  decoration: const InputDecoration(
                    labelText: 'Função',
                    hintText: 'Digite a função',
                  ),
                ),
              ],
            ),
            if (_colaboradores.isNotEmpty) ...[
              const SizedBox(height: 16),
              _buildEquipeTable(),
            ],
            const SizedBox(height: 24),
            Container(
              margin: const EdgeInsets.only(bottom: 16),
              height: 1,
              color: AppColors.border,
            ),
            const Text(
              'Profissionais de saúde',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.foreground,
              ),
            ),
            const SizedBox(height: 16),
            FormRow(
              suffix: ElevatedButton(
                onPressed: _addMedico,
                child: const Text('Adicionar'),
              ),
              children: [
                TextField(
                  controller: _medicoNomeController,
                  decoration: const InputDecoration(
                    labelText: 'Nome',
                    hintText: 'Digite o nome',
                  ),
                ),
                TextField(
                  controller: _medicoCRMController,
                  decoration: const InputDecoration(
                    labelText: 'Nº Registro',
                    hintText: 'Digite o número de registro',
                  ),
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
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: _condutas.asMap().entries.map((entry) {
          final index = entry.key;
          final conduta = entry.value;
          return Container(
            decoration: BoxDecoration(
              border: index > 0
                  ? const Border(top: BorderSide(color: AppColors.border))
                  : null,
            ),
            child: ListTile(
              dense: true,
              title: Text(
                conduta,
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.foreground,
                ),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete_outline, size: 16),
                color: AppColors.mutedForeground,
                onPressed: () => _removeConduta(conduta),
                tooltip: 'Remover',
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildEquipeTable() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: _colaboradores.asMap().entries.map((entry) {
          final index = entry.key;
          final colaborador = entry.value;
          return Container(
            decoration: BoxDecoration(
              border: index > 0
                  ? const Border(top: BorderSide(color: AppColors.border))
                  : null,
            ),
            child: ListTile(
              dense: true,
              title: Text(
                colaborador.nome,
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.foreground,
                ),
              ),
              subtitle: Text(
                colaborador.funcao,
                style: const TextStyle(
                  fontSize: 12,
                  color: AppColors.mutedForeground,
                ),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete_outline, size: 16),
                color: AppColors.mutedForeground,
                onPressed: () => _removeColaborador(colaborador),
                tooltip: 'Remover',
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildMedicosTable() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: _medicos.asMap().entries.map((entry) {
          final index = entry.key;
          final medico = entry.value;
          return Container(
            decoration: BoxDecoration(
              border: index > 0
                  ? const Border(top: BorderSide(color: AppColors.border))
                  : null,
            ),
            child: ListTile(
              dense: true,
              title: Text(
                medico.nome,
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.foreground,
                ),
              ),
              subtitle: Text(
                medico.crm,
                style: const TextStyle(
                  fontSize: 12,
                  color: AppColors.mutedForeground,
                ),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete_outline, size: 16),
                color: AppColors.mutedForeground,
                onPressed: () => _removeMedico(medico),
                tooltip: 'Remover',
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  List<SelectOption<String>> _getEstadosOptions() {
    return BrasilData.estados
        .map((e) => SelectOption(value: e.sigla, label: e.nome))
        .toList();
  }

  List<SelectOption<String>> _getMunicipiosOptions() {
    if (_estado.isEmpty) return [];

    return BrasilData.getMunicipios(
      _estado,
    ).map((cidade) => SelectOption(value: cidade, label: cidade)).toList();
  }
}
