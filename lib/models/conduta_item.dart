import 'package:sigmus/database/app_database.dart';

class CondutaItem {
  final Paciente paciente;
  final Conduta conduta;
  final Medico? medico;

  CondutaItem({required this.paciente, required this.conduta, this.medico});
}
