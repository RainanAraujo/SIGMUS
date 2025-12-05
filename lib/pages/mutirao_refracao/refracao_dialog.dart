import 'package:flutter/material.dart';
import 'package:sigmus/generated/sigmus_api.swagger.dart';
import 'package:sigmus/models/conduta_item.dart';
import 'package:sigmus/theme/app_colors.dart';
import 'package:sigmus/utils/date_utils.dart';
import 'package:sigmus/widgets/app_dialog.dart';
import 'package:sigmus/widgets/app_dropdown.dart';
import 'package:sigmus/widgets/app_toast.dart';
import 'package:sigmus/widgets/form_row.dart';
import 'package:sigmus/widgets/paciente_form_section.dart';

class RefracaoFormDialog extends StatefulWidget {
  final CondutaItem? condutaItem;
  final List<String> datasDisponiveis;
  final List<Medico> medicosDisponiveis;
  final Function(CondutaItem)? onSubmit;

  const RefracaoFormDialog({
    super.key,
    this.condutaItem,
    required this.datasDisponiveis,
    required this.medicosDisponiveis,
    this.onSubmit,
  });

  @override
  State<RefracaoFormDialog> createState() => _RefracaoFormDialogState();
}

class _RefracaoFormDialogState extends State<RefracaoFormDialog> {
  final _formKey = GlobalKey<FormState>();

  late final PacienteFormController _pacienteController;

  // Controllers para campos de texto
  late final TextEditingController _esfericoDireitoController;
  late final TextEditingController _cilindricoDireitoController;
  late final TextEditingController _eixoDireitoController;
  late final TextEditingController _esfericoEsquerdoController;
  late final TextEditingController _cilindricoEsquerdoController;
  late final TextEditingController _eixoEsquerdoController;
  late final TextEditingController _adicaoController;
  late final TextEditingController _dpController;
  late final TextEditingController _observacoesController;
  late final TextEditingController _encaminhamentoController;
  late final TextEditingController _tipoEncaminhamentoController;

  // ValueNotifiers para dropdowns (evita rebuild do form inteiro)
  late final ValueNotifier<String?> _dataSelecionada;
  late final ValueNotifier<String> _conduta;
  late final ValueNotifier<int?> _medicoId;
  late final ValueNotifier<int?> _tipoCirurgia;
  late final ValueNotifier<String?> _olho;

  @override
  void initState() {
    super.initState();

    _pacienteController = PacienteFormController();

    // Inicializar controllers de texto
    _esfericoDireitoController = TextEditingController();
    _cilindricoDireitoController = TextEditingController();
    _eixoDireitoController = TextEditingController();
    _esfericoEsquerdoController = TextEditingController();
    _cilindricoEsquerdoController = TextEditingController();
    _eixoEsquerdoController = TextEditingController();
    _adicaoController = TextEditingController();
    _dpController = TextEditingController();
    _observacoesController = TextEditingController();
    _encaminhamentoController = TextEditingController();
    _tipoEncaminhamentoController = TextEditingController();

    // Inicializar ValueNotifiers
    _dataSelecionada = ValueNotifier(null);
    _conduta = ValueNotifier('Prescrição de óculos');
    _medicoId = ValueNotifier(null);
    _tipoCirurgia = ValueNotifier(null);
    _olho = ValueNotifier(null);

    if (widget.condutaItem != null) {
      _loadConduta(widget.condutaItem!);
    }
  }

  @override
  void dispose() {
    _esfericoDireitoController.dispose();
    _cilindricoDireitoController.dispose();
    _eixoDireitoController.dispose();
    _esfericoEsquerdoController.dispose();
    _cilindricoEsquerdoController.dispose();
    _eixoEsquerdoController.dispose();
    _adicaoController.dispose();
    _dpController.dispose();
    _observacoesController.dispose();
    _encaminhamentoController.dispose();
    _tipoEncaminhamentoController.dispose();
    _dataSelecionada.dispose();
    _conduta.dispose();
    _medicoId.dispose();
    _tipoCirurgia.dispose();
    _olho.dispose();
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
    _conduta.value = conduta.tipo ?? 'Prescrição de óculos';
    _medicoId.value = conduta.medicoId;

    // Parse dos dados da refração
    _parseDados(conduta.dados);
  }

  void _parseDados(Map<String, dynamic>? dados) {
    if (dados == null) return;

    // OD
    _esfericoDireitoController.text = dados['od_esferico']?.toString() ?? '';
    _cilindricoDireitoController.text =
        dados['od_cilindrico']?.toString() ?? '';
    _eixoDireitoController.text = dados['od_eixo']?.toString() ?? '';

    // OE
    _esfericoEsquerdoController.text = dados['oe_esferico']?.toString() ?? '';
    _cilindricoEsquerdoController.text =
        dados['oe_cilindrico']?.toString() ?? '';
    _eixoEsquerdoController.text = dados['oe_eixo']?.toString() ?? '';

    // Outros
    _adicaoController.text = dados['adicao']?.toString() ?? '';
    _dpController.text = dados['dp']?.toString() ?? '';
    _observacoesController.text = dados['observacoes']?.toString() ?? '';
    _encaminhamentoController.text = dados['encaminhamento']?.toString() ?? '';
    _tipoEncaminhamentoController.text =
        dados['tipo_encaminhamento']?.toString() ?? '';

    // Cirurgia
    _tipoCirurgia.value = dados['tipo_cirurgia'] as int?;
    _olho.value = dados['olho'] as String?;
  }

  Map<String, dynamic> _buildDados() {
    return {
      'od_esferico': _esfericoDireitoController.text.isNotEmpty
          ? _esfericoDireitoController.text
          : null,
      'od_cilindrico': _cilindricoDireitoController.text.isNotEmpty
          ? _cilindricoDireitoController.text
          : null,
      'od_eixo': _eixoDireitoController.text.isNotEmpty
          ? _eixoDireitoController.text
          : null,
      'oe_esferico': _esfericoEsquerdoController.text.isNotEmpty
          ? _esfericoEsquerdoController.text
          : null,
      'oe_cilindrico': _cilindricoEsquerdoController.text.isNotEmpty
          ? _cilindricoEsquerdoController.text
          : null,
      'oe_eixo': _eixoEsquerdoController.text.isNotEmpty
          ? _eixoEsquerdoController.text
          : null,
      'adicao': _adicaoController.text.isNotEmpty
          ? _adicaoController.text
          : null,
      'dp': _dpController.text.isNotEmpty ? _dpController.text : null,
      'observacoes': _observacoesController.text.isNotEmpty
          ? _observacoesController.text
          : null,
      'encaminhamento': _encaminhamentoController.text.isNotEmpty
          ? _encaminhamentoController.text
          : null,
      'tipo_encaminhamento': _tipoEncaminhamentoController.text.isNotEmpty
          ? _tipoEncaminhamentoController.text
          : null,
      'tipo_cirurgia': _tipoCirurgia.value,
      'olho': _olho.value,
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
        medicoId: _medicoId.value,
        dados: _buildDados(),
      );

      Medico? medico;
      if (_medicoId.value != null) {
        medico = widget.medicosDisponiveis.firstWhere(
          (m) => m.crm.hashCode == _medicoId.value,
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
      title: widget.condutaItem != null
          ? 'Editar Atendimento'
          : 'Novo Atendimento',
      description: widget.condutaItem != null
          ? 'Edite as informações do atendimento'
          : 'Adicione um novo atendimento de refração.',
      maxWidth: 1200,
      maxHeight: 750,
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
            Container(width: 1, height: 500, color: AppColors.border),
            const SizedBox(width: 32),
            Expanded(flex: 1, child: _buildRefracaoSection()),
          ],
        ),
      ),
    );
  }

  Widget _buildRefracaoSection() {
    return ValueListenableBuilder<String>(
      valueListenable: _conduta,
      builder: (context, conduta, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Informações da Refração',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.foreground,
              ),
            ),
            const SizedBox(height: 16),

            FormRow(
              children: [
                ValueListenableBuilder<String?>(
                  valueListenable: _dataSelecionada,
                  builder: (context, data, _) {
                    return AppDropdown<String>(
                      value: data,
                      label: 'Data',
                      hint: 'Selecione',
                      isRequired: true,

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
                AppDropdown<String>(
                  value: conduta,
                  label: 'Conduta',
                  isRequired: true,

                  items: const [
                    DropdownMenuItem(
                      value: 'Prescrição de óculos',
                      child: Text('Prescrição de óculos'),
                    ),
                    DropdownMenuItem(
                      value: "Cirurgia",
                      child: Text('Cirurgia'),
                    ),
                    DropdownMenuItem(
                      value: 'Encaminhamento',
                      child: Text('Encaminhamento'),
                    ),
                    DropdownMenuItem(value: 'Alta', child: Text('Alta')),
                  ],
                  onChanged: (value) => _conduta.value = value!,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Selecione a conduta';
                    }
                    return null;
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            ValueListenableBuilder<int?>(
              valueListenable: _medicoId,
              builder: (context, medico, _) {
                return AppDropdown<int>(
                  value: medico,
                  label: 'Nome do Médico',
                  hint: 'Selecione (opcional)',

                  items: widget.medicosDisponiveis.map((medico) {
                    return DropdownMenuItem(
                      value: medico.crm.hashCode,
                      child: Text(medico.nome),
                    );
                  }).toList(),
                  onChanged: (value) => _medicoId.value = value,
                );
              },
            ),
            if (conduta == 'Prescrição de óculos') ...[
              const SizedBox(height: 24),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 50,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 24),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 6),
                          child: Text(
                            'Longe',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: AppColors.mutedForeground,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Headers
                        const Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Esférico',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.mutedForeground,
                                ),
                              ),
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                'Cilíndrico',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.mutedForeground,
                                ),
                              ),
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                'Eixo',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.mutedForeground,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),

                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: _esfericoDireitoController,

                                decoration: const InputDecoration(
                                  hintText: 'OD',
                                ),
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                      decimal: true,
                                      signed: true,
                                    ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: TextFormField(
                                controller: _cilindricoDireitoController,

                                decoration: const InputDecoration(
                                  hintText: 'OD',
                                ),
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                      decimal: true,
                                      signed: true,
                                    ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: TextFormField(
                                controller: _eixoDireitoController,

                                decoration: const InputDecoration(
                                  hintText: 'OD',
                                ),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),

                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: _esfericoEsquerdoController,

                                decoration: const InputDecoration(
                                  hintText: 'OE',
                                ),
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                      decimal: true,
                                      signed: true,
                                    ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: TextFormField(
                                controller: _cilindricoEsquerdoController,

                                decoration: const InputDecoration(
                                  hintText: 'OE',
                                ),
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                      decimal: true,
                                      signed: true,
                                    ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: TextFormField(
                                controller: _eixoEsquerdoController,

                                decoration: const InputDecoration(
                                  hintText: 'OE',
                                ),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),

                  SizedBox(
                    width: 80,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'DP',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: AppColors.mutedForeground,
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: _dpController,

                          decoration: const InputDecoration(hintText: 'DP'),
                          keyboardType: TextInputType.number,
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              TextFormField(
                controller: _adicaoController,

                decoration: const InputDecoration(
                  labelText: "ADD",
                  hintText: 'Digite o ADD',
                ),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                  signed: true,
                ),
              ),
            ],

            if (conduta == 'Prescrição de óculos' || conduta == 'Alta') ...[
              const SizedBox(height: 16),
              TextFormField(
                controller: _observacoesController,

                decoration: const InputDecoration(
                  labelText: 'Observações',
                  hintText: 'Digite as observações',
                ),
              ),
            ],

            if (conduta == 'Cirurgia') ...[
              const SizedBox(height: 16),
              FormRow(
                children: [
                  ValueListenableBuilder<int?>(
                    valueListenable: _tipoCirurgia,
                    builder: (context, tipo, _) {
                      return AppDropdown<int>(
                        value: tipo,
                        label: 'Tipo de Cirurgia',
                        hint: 'Selecione',

                        items: const [
                          DropdownMenuItem(value: 1, child: Text('Catarata')),
                          DropdownMenuItem(value: 2, child: Text('Pterígio')),
                        ],
                        onChanged: (value) => _tipoCirurgia.value = value,
                      );
                    },
                  ),
                  ValueListenableBuilder<String?>(
                    valueListenable: _olho,
                    builder: (context, olho, _) {
                      return AppDropdown<String>(
                        value: olho,
                        label: 'Olho',
                        hint: 'Selecione',

                        items: const [
                          DropdownMenuItem(
                            value: "OD",
                            child: Text('OD Direito'),
                          ),
                          DropdownMenuItem(
                            value: "OE",
                            child: Text('OE Esquerdo'),
                          ),
                          DropdownMenuItem(
                            value: "AO",
                            child: Text('AO Ambos'),
                          ),
                        ],
                        onChanged: (value) => _olho.value = value,
                      );
                    },
                  ),
                ],
              ),
            ],
            if (conduta == 'Prescrição de óculos') ...[
              const SizedBox(height: 16),
              TextFormField(
                controller: _encaminhamentoController,

                decoration: const InputDecoration(
                  labelText: 'Encaminhamento (se houver)',
                  hintText: 'Digite o encaminhamento',
                ),
              ),
            ],
            if (conduta == 'Encaminhamento') ...[
              const SizedBox(height: 16),
              TextFormField(
                controller: _tipoEncaminhamentoController,

                decoration: const InputDecoration(
                  labelText: 'Tipo de Encaminhamento',
                  hintText: 'Digite o tipo de encaminhamento',
                ),
              ),
            ],
          ],
        );
      },
    );
  }
}
