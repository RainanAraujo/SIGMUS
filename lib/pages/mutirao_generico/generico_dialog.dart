import 'package:flutter/material.dart';
import 'package:sigmus/generated/sigmus_api.swagger.dart';
import 'package:sigmus/models/conduta_item.dart';
import 'package:sigmus/utils/date_utils.dart';
import 'package:sigmus/widgets/app_dialog.dart';
import 'package:sigmus/widgets/app_dropdown.dart';
import 'package:sigmus/widgets/app_toast.dart';
import 'package:sigmus/widgets/paciente_form_section.dart';

class GenericoFormDialog extends StatefulWidget {
  final CondutaItem? condutaItem;
  final List<String> datasDisponiveis;
  final List<Medico> medicosDisponiveis;
  final Function(CondutaItem)? onSubmit;

  const GenericoFormDialog({
    super.key,
    this.condutaItem,
    required this.datasDisponiveis,
    required this.medicosDisponiveis,
    this.onSubmit,
  });

  @override
  State<GenericoFormDialog> createState() => _GenericoFormDialogState();
}

class _GenericoFormDialogState extends State<GenericoFormDialog> {
  final _formKey = GlobalKey<FormState>();

  late final PacienteFormController _pacienteController;

  // Controllers para campos de texto
  late final TextEditingController _observacoesController;

  // ValueNotifiers para dropdowns
  late final ValueNotifier<String?> _dataSelecionada;
  late final ValueNotifier<String?> _conduta;
  late final ValueNotifier<int?> _profissionalId;

  @override
  void initState() {
    super.initState();

    _pacienteController = PacienteFormController();

    _observacoesController = TextEditingController();

    _dataSelecionada = ValueNotifier(null);
    _conduta = ValueNotifier(null);
    _profissionalId = ValueNotifier(null);

    if (widget.condutaItem != null) {
      _loadConduta(widget.condutaItem!);
    }
  }

  @override
  void dispose() {
    _observacoesController.dispose();
    _dataSelecionada.dispose();
    _conduta.dispose();
    _profissionalId.dispose();
    super.dispose();
  }

  void _loadConduta(CondutaItem item) {
    final paciente = item.paciente;
    final conduta = item.conduta;

    // Carrega dados do paciente
    _pacienteController.cpf = paciente.cpf ?? '';
    _pacienteController.cns = paciente.cns ?? '';
    _pacienteController.nome = paciente.nome ?? '';
    _pacienteController.telefone = paciente.tel ?? '';
    _pacienteController.dataNascimento = paciente.dataNascimento != null
        ? DateTime.tryParse(paciente.dataNascimento!)
        : null;
    _pacienteController.nomeDaMae = paciente.nomeDaMae ?? '';
    _pacienteController.endereco = paciente.endereco ?? '';
    _pacienteController.estado = paciente.uf ?? '';
    _pacienteController.municipio = paciente.municipio ?? '';

    // Carrega dados da conduta
    _dataSelecionada.value = conduta.data;
    _conduta.value = conduta.tipo;
    _profissionalId.value = conduta.medicoId;

    // Parse dos dados
    _parseDados(conduta.dados);
  }

  void _parseDados(Map<String, dynamic>? dados) {
    if (dados == null) return;
    _observacoesController.text = dados['observacoes']?.toString() ?? '';
  }

  Map<String, dynamic> _buildDados() {
    return {
      'observacoes': _observacoesController.text.isNotEmpty
          ? _observacoesController.text
          : null,
    };
  }

  void _handleSubmit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    try {
      final now = DateTime.now().millisecondsSinceEpoch;

      final paciente = Paciente(
        atualizadoEm: now,
        status: 1,
        cpf: _pacienteController.cpf.isEmpty ? null : _pacienteController.cpf,
        cns: _pacienteController.cns.isEmpty ? null : _pacienteController.cns,
        nome: _pacienteController.nome,
        tel: _pacienteController.telefone,
        dataNascimento: _pacienteController.dataNascimento?.toIso8601String(),
        nomeDaMae: _pacienteController.nomeDaMae.isEmpty
            ? null
            : _pacienteController.nomeDaMae,
        endereco: _pacienteController.endereco.isEmpty
            ? null
            : _pacienteController.endereco,
        uf: _pacienteController.estado.isEmpty
            ? null
            : _pacienteController.estado,
        municipio: _pacienteController.municipio.isEmpty
            ? null
            : _pacienteController.municipio,
      );

      final conduta = Conduta(
        atualizadoEm: now,
        status: 1,
        pacienteId: widget.condutaItem?.conduta.pacienteId ?? 0,
        data: _dataSelecionada.value,
        tipo: _conduta.value,
        medicoId: _profissionalId.value,
        dados: _buildDados(),
      );

      Medico? medico;
      if (_profissionalId.value != null) {
        medico = widget.medicosDisponiveis.firstWhere(
          (m) => m.crm.hashCode == _profissionalId.value,
          orElse: () => Medico(atualizadoEm: 0, status: 0, nome: '', crm: ''),
        );
      }

      widget.onSubmit?.call(
        CondutaItem(paciente: paciente, conduta: conduta, medico: medico),
      );

      if (mounted) {
        Navigator.of(context).pop();
      }
    } catch (e) {
      AppToast.error(context, message: 'Erro: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppDialog(
      title: widget.condutaItem != null ? 'Editar Registro' : 'Novo Registro',
      description: widget.condutaItem != null
          ? 'Edite as informações do registro'
          : 'Adicione um novo registro.',
      maxWidth: 1000,
      maxHeight: 600,
      actions: [
        OutlinedButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancelar'),
        ),
        ElevatedButton(onPressed: _handleSubmit, child: const Text('Salvar')),
      ],
      child: Form(
        key: _formKey,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: PacienteFormSection(controller: _pacienteController),
            ),
            const SizedBox(width: 32),
            Expanded(flex: 1, child: _buildAtendimentoSection()),
          ],
        ),
      ),
    );
  }

  Widget _buildAtendimentoSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'Informações do Atendimento',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 16),

        // Data
        ValueListenableBuilder<String?>(
          valueListenable: _dataSelecionada,
          builder: (context, data, _) {
            return AppDropdown<String>(
              initialValue: data,
              label: 'Data',
              hint: 'Selecione',
              items: widget.datasDisponiveis.map((data) {
                return DropdownMenuItem(
                  value: data,
                  child: Text(formatDateFromString(data)),
                );
              }).toList(),
              onChanged: (value) => _dataSelecionada.value = value,
            );
          },
        ),

        const SizedBox(height: 16),

        // Conduta
        ValueListenableBuilder<String?>(
          valueListenable: _conduta,
          builder: (context, conduta, _) {
            return AppDropdown<String>(
              initialValue: conduta,
              label: 'Conduta',
              hint: 'Selecione',
              isRequired: true,
              items: const [
                DropdownMenuItem(
                  value: 'APLICACAO DE FLUOR + KIT HIGIENE',
                  child: Text('Aplicação de Flúor + Kit Higiene'),
                ),
                DropdownMenuItem(
                  value: 'CONSULTA CLINICA',
                  child: Text('Consulta Clínica'),
                ),
                DropdownMenuItem(value: 'EXTRACAO', child: Text('Extração')),
                DropdownMenuItem(
                  value: 'PROFILAXIA',
                  child: Text('Profilaxia'),
                ),
                DropdownMenuItem(
                  value: 'PROTESE INFERIOR',
                  child: Text('Prótese Inferior'),
                ),
                DropdownMenuItem(
                  value: 'PROTESE SUPERIOR',
                  child: Text('Prótese Superior'),
                ),
                DropdownMenuItem(
                  value: 'RESTAURACAO',
                  child: Text('Restauração'),
                ),
              ],
              onChanged: (value) => _conduta.value = value,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Selecione a conduta';
                }
                return null;
              },
            );
          },
        ),

        const SizedBox(height: 16),

        // Nome do profissional responsável
        ValueListenableBuilder<int?>(
          valueListenable: _profissionalId,
          builder: (context, profissional, _) {
            return AppDropdown<int>(
              initialValue: profissional,
              label: 'Nome do profissional responsável',
              hint: 'Selecione',
              isRequired: true,
              items: widget.medicosDisponiveis.map((medico) {
                return DropdownMenuItem(
                  value: medico.crm.hashCode,
                  child: Text(medico.nome),
                );
              }).toList(),
              onChanged: (value) => _profissionalId.value = value,
              validator: (value) {
                if (value == null) {
                  return 'Selecione o profissional';
                }
                return null;
              },
            );
          },
        ),

        const SizedBox(height: 16),

        // Observação
        TextFormField(
          controller: _observacoesController,
          decoration: const InputDecoration(
            labelText: 'Observação',
            hintText: 'Observação',
          ),
          maxLines: 3,
        ),
      ],
    );
  }
}
