import 'package:sigmus/generated/sigmus_api.swagger.dart';

class ProcedimentoItem {
  final Paciente paciente;
  final Procedimento procedimento;
  final Medico medico;
  ProcedimentoItem({
    required this.paciente,
    required this.procedimento,
    required this.medico,
  });
}
