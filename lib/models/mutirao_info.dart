class MutiraoInfo {
  final dynamic id; // Pode ser int ou String
  final String dataInicio;
  final String dataFinal;
  final String tipo;
  final String municipio;
  final String local;
  final String? estado;
  final String? demandante;
  final String? contratante;
  final List<String> permissions;
  final DateTime createdAt;
  final DateTime updatedAt;

  MutiraoInfo({
    required this.id,
    required this.dataInicio,
    required this.dataFinal,
    required this.tipo,
    required this.municipio,
    required this.local,
    this.estado,
    this.demandante,
    this.contratante,
    required this.permissions,
    required this.createdAt,
    required this.updatedAt,
  });

  // Compatibilidade com formato antigo
  Map<String, List<String>> get permissoes => {};
  int get lastRemoteModTs => updatedAt.millisecondsSinceEpoch;
  int get lastLocalModTs => updatedAt.millisecondsSinceEpoch;
  Map<String, int> get lastSinc => {};
}
