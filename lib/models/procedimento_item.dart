import 'package:sigmus/generated/sigmus_api.swagger.dart';

class ProcedimentoItem {
  final PacienteUpdate paciente;
  final ProcedimentoUpdate procedimento;
  ProcedimentoItem({required this.paciente, required this.procedimento});
}
