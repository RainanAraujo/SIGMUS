import 'package:sigmus/generated/sigmus_api.swagger.dart';

class CondutaItem {
  final Paciente paciente;
  final Conduta conduta;
  final Medico? medico;

  CondutaItem({required this.paciente, required this.conduta, this.medico});
}
