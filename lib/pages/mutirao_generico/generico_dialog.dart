import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:sigmus/database/app_database.dart';
import 'package:sigmus/models/conduta_generica_item.dart';
import 'package:sigmus/models/interfaces/model.dart';
import 'package:sigmus/models/mutirao_item.dart';
import 'package:sigmus/theme/app_colors.dart';
import 'package:sigmus/widgets/app_dialog.dart';
import 'package:sigmus/widgets/app_dropdown.dart';
import 'package:sigmus/widgets/app_toast.dart';
import 'package:sigmus/widgets/paciente_form_section.dart';

class GenericoFormDialog extends StatefulWidget {
  final MutiraoItem mutirao;
  final List<String> condutaOptions;
  final CondutaGenericaItem? condutaItem;
  final List<String> datasDisponiveis;
  final List<Medico> medicosDisponiveis;
  final Function(CondutaGenericaItem)? onSubmit;

  const GenericoFormDialog({
    super.key,
    required this.mutirao,
    required this.condutaOptions,
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

  late final TextEditingController _observacoesController;
  late final ValueNotifier<String?> _dataSelecionada;
  late final ValueNotifier<String?> _conduta;
  late final ValueNotifier<Medico?> _medico;

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    _pacienteController = PacienteFormController();
    _observacoesController = TextEditingController();
    _dataSelecionada = ValueNotifier(null);
    _conduta = ValueNotifier(null);
    _medico = ValueNotifier(null);

    if (widget.condutaItem != null) {
      _loadConduta(widget.condutaItem!);
    }
  }

  @override
  void dispose() {
    _observacoesController.dispose();
    _dataSelecionada.dispose();
    _conduta.dispose();
    _medico.dispose();
    super.dispose();
  }

  void _loadConduta(CondutaGenericaItem item) {
    final paciente = item.paciente;
    final conduta = item.conduta;

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

    _dataSelecionada.value = conduta.data;
    _conduta.value = conduta.conduta;
    _medico.value = widget.medicosDisponiveis.firstWhereOrNull(
      (medico) => medico.id == conduta.medicoId,
    );
    _observacoesController.text = conduta.observacao ?? '';
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
        id: widget.condutaItem?.paciente.id ?? now,
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
        status: ModelStatus.active.index,
        atualizadoEm: now,
      );

      final conduta = CondutaGenerica(
        id: widget.condutaItem?.conduta.id ?? now,
        mutiraoId: widget.mutirao.id,
        pacienteId: paciente.id,
        data: _dataSelecionada.value!,
        conduta: _conduta.value!,
        medicoId: _medico.value!.id,
        observacao: _observacoesController.text.isEmpty
            ? null
            : _observacoesController.text,
        status: ModelStatus.active.index,
        atualizadoEm: now,
      );

      widget.onSubmit?.call(
        CondutaGenericaItem(
          paciente: paciente,
          conduta: conduta,
          medico: _medico.value,
        ),
      );

      if (mounted) {
        Navigator.of(context).pop();
      }
    } catch (e) {
      AppToast.error(context, message: 'Erro: $e');
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppDialog(
      title: widget.condutaItem != null ? 'Editar Registro' : 'Novo Registro',
      description: widget.condutaItem != null
          ? 'Edite as informações do registro'
          : 'Adicione um novo registro.',
      maxWidth: 1200,
      maxHeight: 700,
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
            Expanded(flex: 1, child: _buildAtendimentoSection()),
          ],
        ),
      ),
    );
  }

  Widget _buildAtendimentoSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Informações do Atendimento',
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
              initialValue: data,
              label: 'Data',
              hint: 'Selecione',
              isRequired: true,
              enabled: !_isLoading,
              items: widget.datasDisponiveis.map((data) {
                return DropdownMenuItem(value: data, child: Text(data));
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

        ValueListenableBuilder<String?>(
          valueListenable: _conduta,
          builder: (context, conduta, _) {
            return AppDropdown<String>(
              initialValue: conduta,
              label: 'Conduta',
              hint: 'Selecione',
              isRequired: true,
              enabled: !_isLoading,
              items: widget.condutaOptions.map((conduta) {
                return DropdownMenuItem(value: conduta, child: Text(conduta));
              }).toList(),
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

        ValueListenableBuilder<Medico?>(
          valueListenable: _medico,
          builder: (context, medico, _) {
            return AppDropdown<Medico>(
              initialValue: medico,
              label: 'Nome do profissional responsável',
              hint: 'Selecione',
              isRequired: true,
              enabled: !_isLoading,
              items: widget.medicosDisponiveis.map((medico) {
                return DropdownMenuItem(
                  value: medico,
                  child: Text(medico.nome),
                );
              }).toList(),
              onChanged: (value) => _medico.value = value,
              validator: (value) {
                if (value == null) {
                  return 'Selecione um profissional';
                }
                return null;
              },
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
