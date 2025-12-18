import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sigmus/data/brasil_data.dart';
import 'package:sigmus/theme/app_colors.dart';
import 'package:sigmus/utils/date_utils.dart' as date_utils;
import 'package:sigmus/utils/input_formatters.dart';
import 'package:sigmus/utils/validators.dart';
import 'package:sigmus/widgets/app_searchable_select.dart';
import 'package:sigmus/widgets/form_row.dart';

class PacienteFormController {
  String cpf = '';
  String cns = '';
  String nome = '';
  String telefone = '';
  DateTime? dataNascimento;
  String nomeDaMae = '';
  String endereco = '';
  String estado = '';
  String municipio = '';
  bool semCpfCns = false;

  bool get isValid {
    if (semCpfCns) {
      return nome.isNotEmpty && dataNascimento != null;
    }
    return (cpf.isNotEmpty || cns.isNotEmpty) &&
        nome.isNotEmpty &&
        telefone.isNotEmpty &&
        dataNascimento != null;
  }

  void clear() {
    cpf = '';
    cns = '';
    nome = '';
    telefone = '';
    dataNascimento = null;
    nomeDaMae = '';
    endereco = '';
    estado = '';
    municipio = '';
    semCpfCns = false;
  }
}

class PacienteFormSection extends StatefulWidget {
  final PacienteFormController controller;
  final VoidCallback? onChanged;
  final bool enabled;

  const PacienteFormSection({
    super.key,
    required this.controller,
    this.onChanged,
    this.enabled = true,
  });

  @override
  State<PacienteFormSection> createState() => _PacienteFormSectionState();
}

class _PacienteFormSectionState extends State<PacienteFormSection> {
  late final TextEditingController _cpfController;
  late final TextEditingController _cnsController;
  late final TextEditingController _nomeController;
  late final TextEditingController _telefoneController;
  late final TextEditingController _nascimentoController;
  late final TextEditingController _nomeDaMaeController;
  late final TextEditingController _enderecoController;

  final GlobalKey<FormFieldState> _cpfFieldKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> _cnsFieldKey = GlobalKey<FormFieldState>();
  @override
  void initState() {
    super.initState();
    _cpfController = TextEditingController(text: widget.controller.cpf);
    _cnsController = TextEditingController(text: widget.controller.cns);
    _nomeController = TextEditingController(text: widget.controller.nome);
    _telefoneController = TextEditingController(
      text: widget.controller.telefone,
    );
    _nascimentoController = TextEditingController(
      text: widget.controller.dataNascimento != null
          ? date_utils.formatDate(widget.controller.dataNascimento!)
          : '',
    );
    _nomeDaMaeController = TextEditingController(
      text: widget.controller.nomeDaMae,
    );
    _enderecoController = TextEditingController(
      text: widget.controller.endereco,
    );
  }

  @override
  void dispose() {
    _cpfController.dispose();
    _cnsController.dispose();
    _nomeController.dispose();
    _telefoneController.dispose();
    _nascimentoController.dispose();
    _nomeDaMaeController.dispose();
    _enderecoController.dispose();
    super.dispose();
  }

  void _notifyChange() {
    widget.onChanged?.call();
  }

  List<SelectOption<String>> _getEstadosOptions() {
    return BrasilData.estados.map((estado) {
      return SelectOption(value: estado.sigla, label: estado.nome);
    }).toList();
  }

  List<SelectOption<String>> _getMunicipiosOptions() {
    if (widget.controller.estado.isEmpty) return [];

    final municipios = BrasilData.getMunicipios(widget.controller.estado);
    return municipios.map((m) {
      return SelectOption(value: m, label: m);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return FocusTraversalGroup(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Informações do Paciente',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.foreground,
                ),
              ),
              Row(
                children: [
                  Checkbox(
                    value: widget.controller.semCpfCns,
                    onChanged: widget.enabled
                        ? (value) {
                            setState(() {
                              widget.controller.semCpfCns = value ?? false;
                              _cpfFieldKey.currentState?.reset();
                              _cnsFieldKey.currentState?.reset();
                              _cpfController.clear();
                              _cnsController.clear();
                              widget.controller.cpf = '';
                              widget.controller.cns = '';
                            });
                            _notifyChange();
                          }
                        : null,
                  ),
                  const Text(
                    'Não possui CPF e CNS',
                    style: TextStyle(
                      fontSize: 13,
                      color: AppColors.mutedForeground,
                    ),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 16),

          FormRow(
            children: [
              TextFormField(
                key: _cpfFieldKey,
                controller: _cpfController,
                enabled: widget.enabled && !widget.controller.semCpfCns,
                decoration: InputDecoration(
                  labelText: 'CPF ${widget.controller.semCpfCns ? '' : '*'}',
                  hintText: 'Digite o CPF',
                ),
                focusNode: FocusNode()..requestFocus(),
                keyboardType: TextInputType.number,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  CpfInputFormatter(),
                ],
                onChanged: (value) {
                  widget.controller.cpf = value;
                  _notifyChange();
                },
                validator: (value) {
                  if (widget.controller.semCpfCns) return null;
                  if (value == null ||
                      value.isEmpty && widget.controller.cns.isEmpty) {
                    return 'Preencha o CPF ou CNS';
                  }
                  if (value.isNotEmpty) {
                    return validateCpf(value);
                  }
                  return null;
                },
              ),
              TextFormField(
                key: _cnsFieldKey,
                controller: _cnsController,
                enabled: widget.enabled && !widget.controller.semCpfCns,
                decoration: InputDecoration(
                  labelText:
                      'Número do cartão SUS ${widget.controller.semCpfCns ? '' : '*'}',
                  hintText: 'Digite o Número do SUS',
                ),
                keyboardType: TextInputType.number,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  CnsInputFormatter(),
                ],
                onChanged: (value) {
                  widget.controller.cns = value;
                  _notifyChange();
                },
                validator: (value) {
                  if (widget.controller.semCpfCns) return null;
                  if (value == null ||
                      value.isEmpty && widget.controller.cpf.isEmpty) {
                    return 'Preencha o CNS ou CPF';
                  }
                  if (value.isNotEmpty) {
                    return validateCns(value);
                  }
                  return null;
                },
              ),
            ],
          ),

          const SizedBox(height: 16),

          FormRow(
            children: [
              TextFormField(
                controller: _nomeController,
                enabled: widget.enabled,
                decoration: const InputDecoration(
                  labelText: 'Nome do paciente *',
                  hintText: 'Digite o nome',
                ),
                textCapitalization: TextCapitalization.words,
                onChanged: (value) {
                  widget.controller.nome = value;
                  _notifyChange();
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nome obrigatório';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _telefoneController,
                enabled: widget.enabled,
                decoration: const InputDecoration(
                  labelText: 'Telefone para contato',
                  hintText: 'Digite o telefone',
                ),
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  PhoneInputFormatter(),
                ],
                onChanged: (value) {
                  widget.controller.telefone = value;
                  _notifyChange();
                },
              ),
            ],
          ),

          const SizedBox(height: 16),

          FormRow(
            children: [
              TextFormField(
                controller: _nascimentoController,
                enabled: widget.enabled,
                decoration: const InputDecoration(
                  labelText: 'Nascimento',
                  hintText: 'DD/MM/AAAA',
                ),
                keyboardType: TextInputType.datetime,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  DateInputFormatter(),
                ],
                onChanged: (value) {
                  widget.controller.dataNascimento = date_utils.parseDate(
                    value,
                  );
                  _notifyChange();
                },
              ),
              TextFormField(
                controller: _nomeDaMaeController,
                enabled: widget.enabled,
                decoration: const InputDecoration(
                  labelText: 'Nome da Mãe',
                  hintText: 'Digite o nome da mãe',
                ),
                textCapitalization: TextCapitalization.words,
                onChanged: (value) {
                  widget.controller.nomeDaMae = value;
                  _notifyChange();
                },
              ),
            ],
          ),

          const SizedBox(height: 16),

          FormRow(
            children: [
              TextFormField(
                controller: _enderecoController,
                enabled: widget.enabled,
                decoration: const InputDecoration(
                  labelText: 'Endereço',
                  hintText: 'Digite o endereço completo',
                ),
                onChanged: (value) {
                  widget.controller.endereco = value;
                  _notifyChange();
                },
              ),
            ],
          ),
          const SizedBox(height: 16),
          FormRow(
            children: [
              AppSearchableSelect<String>(
                label: 'Estado',
                value: widget.controller.estado.isEmpty
                    ? null
                    : widget.controller.estado,
                options: _getEstadosOptions(),
                enabled: widget.enabled,
                searchHint: 'Buscar estado...',
                onChanged: (value) {
                  setState(() {
                    widget.controller.estado = value ?? '';
                    widget.controller.municipio = '';
                  });
                  _notifyChange();
                },
              ),
              AppSearchableSelect<String>(
                label: 'Município',
                value: widget.controller.municipio.isEmpty
                    ? null
                    : widget.controller.municipio,
                options: _getMunicipiosOptions(),
                enabled: widget.enabled && widget.controller.estado.isNotEmpty,
                searchHint: 'Buscar município...',
                onChanged: (value) {
                  setState(() {
                    widget.controller.municipio = value ?? '';
                  });
                  _notifyChange();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
