import 'package:sigmus/database/app_database.dart';

class CondutaGenericaItem {
  final Paciente paciente;
  final CondutaGenerica conduta;
  final Medico? medico;

  CondutaGenericaItem({
    required this.paciente,
    required this.conduta,
    this.medico,
  });
}
