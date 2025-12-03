import 'package:flutter/material.dart';
import 'package:sigmus/generated/sigmus_api.swagger.dart';
import 'package:sigmus/models/procedimento_item.dart';
import 'package:sigmus/theme/app_colors.dart';
import 'package:sigmus/utils/date_utils.dart';
import 'package:sigmus/widgets/app_dialog.dart';
import 'package:sigmus/widgets/app_dropdown.dart';
import 'package:sigmus/widgets/app_toast.dart';
import 'package:sigmus/widgets/form_row.dart';
import 'package:sigmus/widgets/paciente_form_section.dart';

class CirurgiaFormDialog extends StatefulWidget {
  final ProcedimentoItem? procedimento;
  final List<String> datasDisponiveis;
  final List<Medico> medicosDisponiveis;
  final Function(ProcedimentoItem)? onSubmit;

  const CirurgiaFormDialog({
    super.key,
    this.procedimento,
    required this.datasDisponiveis,
    required this.medicosDisponiveis,
    this.onSubmit,
  });

  @override
  State<CirurgiaFormDialog> createState() => _CirurgiaFormDialogState();
}

class _CirurgiaFormDialogState extends State<CirurgiaFormDialog> {
  final _formKey = GlobalKey<FormState>();

  late final PacienteFormController _pacienteController;

  // Controllers para campos de texto
  late final TextEditingController _dioptriaController;
  late final TextEditingController _observacoesController;

  // ValueNotifiers para dropdowns (evita rebuild do form inteiro)
  late final ValueNotifier<String?> _dataSelecionada;
  late final ValueNotifier<String> _tipoProcedimento;
  late final ValueNotifier<String> _olhoOperado;
  late final ValueNotifier<int?> _medicoId;
  late final ValueNotifier<bool> _possuiIntercorrencia;

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    _pacienteController = PacienteFormController();

    // Inicializar controllers de texto
    _dioptriaController = TextEditingController();
    _observacoesController = TextEditingController();

    // Inicializar ValueNotifiers
    _dataSelecionada = ValueNotifier(null);
    _tipoProcedimento = ValueNotifier('Catarata');
    _olhoOperado = ValueNotifier('OE');
    _medicoId = ValueNotifier(null);
    _possuiIntercorrencia = ValueNotifier(false);

    if (widget.procedimento != null) {
      _loadProcedimento(widget.procedimento!);
    }
  }

  @override
  void dispose() {
    _dioptriaController.dispose();
    _observacoesController.dispose();
    _dataSelecionada.dispose();
    _tipoProcedimento.dispose();
    _olhoOperado.dispose();
    _medicoId.dispose();
    _possuiIntercorrencia.dispose();
    super.dispose();
  }

  void _loadProcedimento(ProcedimentoItem item) {
    final paciente = item.paciente;
    final procedimento = item.procedimento;

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

    // Carrega dados do procedimento
    _dataSelecionada.value = procedimento.data;
    _tipoProcedimento.value = procedimento.tipo ?? 'Catarata';
    _olhoOperado.value = procedimento.olho ?? 'OE';
    _dioptriaController.text = procedimento.dioptriaLente ?? '';
    _medicoId.value = procedimento.medicoId;
    _possuiIntercorrencia.value =
        procedimento.intercorrencia?.isNotEmpty ?? false;
    _observacoesController.text = procedimento.observacao ?? '';
  }

  void _handleSubmit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

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

      final procedimento = Procedimento(
        atualizadoEm: now,
        status: 1,
        pacienteId: widget.procedimento?.procedimento.pacienteId ?? 0,
        data: _dataSelecionada.value,
        tipo: _tipoProcedimento.value,
        olho: _olhoOperado.value,
        dioptriaLente: _dioptriaController.text.isEmpty
            ? null
            : _dioptriaController.text,
        medicoId: _medicoId.value,
        intercorrencia: _possuiIntercorrencia.value ? 'Sim' : null,
        observacao: _observacoesController.text.isEmpty
            ? null
            : _observacoesController.text,
      );

      widget.onSubmit?.call(
        ProcedimentoItem(
          paciente: paciente,
          procedimento: procedimento,
          medico: widget.medicosDisponiveis.firstWhere(
            (medico) => medico.crm.hashCode == _medicoId.value,
          ),
        ),
      );

      if (mounted) {
        Navigator.of(context).pop();
      }
    } catch (e) {
      AppToast.show(context, message: 'Erro: $e', isError: true);
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppDialog(
      title: widget.procedimento != null
          ? 'Editar Procedimento'
          : 'Novo Procedimento',
      description: widget.procedimento != null
          ? 'Edite as informações do procedimento'
          : 'Adicione um novo procedimento.',
      maxWidth: 1200,
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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: PacienteFormSection(
                controller: _pacienteController,
                enabled: !_isLoading,
              ),
            ),
            const SizedBox(width: 32),
            Container(width: 1, height: 450, color: AppColors.border),
            const SizedBox(width: 32),
            Expanded(flex: 1, child: _buildCirurgiaSection()),
          ],
        ),
      ),
    );
  }

  Widget _buildCirurgiaSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Informações da Cirurgia',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppColors.foreground,
          ),
        ),

        const SizedBox(height: 16),

        ValueListenableBuilder<String?>(
          valueListenable: _dataSelecionada,
          builder: (context, data, _) {
            return AppDropdown<String>(
              value: data,
              label: 'Data',
              hint: 'Selecione',
              isRequired: true,
              enabled: !_isLoading,
              items: widget.datasDisponiveis.map((data) {
                return DropdownMenuItem(
                  value: data,
                  child: Text(formatDateFromString(data)),
                );
              }).toList(),
              onChanged: (value) => _dataSelecionada.value = value,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Selecione uma data';
                }
                return null;
              },
            );
          },
        ),

        const SizedBox(height: 16),

        ValueListenableBuilder<String>(
          valueListenable: _tipoProcedimento,
          builder: (context, tipo, _) {
            return AppDropdown<String>(
              value: tipo,
              label: 'Tipo de procedimento',
              isRequired: true,
              enabled: !_isLoading,
              items: const [
                DropdownMenuItem(value: 'Catarata', child: Text('Catarata')),
                DropdownMenuItem(value: 'Pterígio', child: Text('Pterígio')),
              ],
              onChanged: (value) => _tipoProcedimento.value = value!,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Selecione o tipo de procedimento';
                }
                return null;
              },
            );
          },
        ),

        const SizedBox(height: 16),

        ValueListenableBuilder<String>(
          valueListenable: _tipoProcedimento,
          builder: (context, tipo, _) {
            return FormRow(
              children: [
                ValueListenableBuilder<String>(
                  valueListenable: _olhoOperado,
                  builder: (context, olho, _) {
                    return AppDropdown<String>(
                      value: olho,
                      label: 'Olho operado',
                      isRequired: true,
                      enabled: !_isLoading,
                      items: const [
                        DropdownMenuItem(
                          value: 'OE',
                          child: Text('OE (Olho Esquerdo)'),
                        ),
                        DropdownMenuItem(
                          value: 'OD',
                          child: Text('OD (Olho Direito)'),
                        ),
                        DropdownMenuItem(
                          value: 'AO',
                          child: Text('AO (Ambos os Olhos)'),
                        ),
                      ],
                      onChanged: (value) => _olhoOperado.value = value!,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Selecione o olho operado';
                        }
                        return null;
                      },
                    );
                  },
                ),
                if (tipo == 'Catarata')
                  TextFormField(
                    controller: _dioptriaController,
                    enabled: !_isLoading,
                    decoration: const InputDecoration(
                      labelText: 'Dioptria da Lente *',
                      hintText: 'Digite a dioptria da lente',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Digite a dioptria da lente';
                      }
                      return null;
                    },
                  ),
              ],
            );
          },
        ),

        const SizedBox(height: 16),

        ValueListenableBuilder<int?>(
          valueListenable: _medicoId,
          builder: (context, medico, _) {
            return AppDropdown<int>(
              value: medico,
              label: 'Nome do Médico',
              hint: 'Selecione',
              isRequired: true,
              enabled: !_isLoading,
              items: widget.medicosDisponiveis.map((medico) {
                return DropdownMenuItem(
                  value: medico.crm.hashCode, // TODO: usar ID real do médico
                  child: Text(medico.nome),
                );
              }).toList(),
              onChanged: (value) => _medicoId.value = value,
              validator: (value) {
                if (value == null) {
                  return 'Selecione um médico';
                }
                return null;
              },
            );
          },
        ),

        const SizedBox(height: 16),

        ValueListenableBuilder<bool>(
          valueListenable: _possuiIntercorrencia,
          builder: (context, intercorrencia, _) {
            return AppDropdown<bool>(
              value: intercorrencia,
              label: 'Possui intercorrência?',
              enabled: !_isLoading,
              items: const [
                DropdownMenuItem(value: false, child: Text('Não')),
                DropdownMenuItem(value: true, child: Text('Sim')),
              ],
              onChanged: (value) =>
                  _possuiIntercorrencia.value = value ?? false,
            );
          },
        ),

        const SizedBox(height: 16),

        TextFormField(
          controller: _observacoesController,
          enabled: !_isLoading,
          decoration: const InputDecoration(
            labelText: 'Observações',
            hintText: 'Digite as observações',
          ),
          maxLines: 3,
        ),
      ],
    );
  }
}
