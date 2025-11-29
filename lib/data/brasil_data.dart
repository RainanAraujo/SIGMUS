import 'dart:convert';
import 'package:flutter/services.dart';

/// Dados de Estados e Municípios do Brasil
/// Carregados do JSON em lib/resources/json/estados-cidades.json
class BrasilData {
  BrasilData._();

  static List<Estado>? _estados;
  static bool _isLoaded = false;

  /// Lista de estados (carregada do JSON)
  static List<Estado> get estados {
    if (!_isLoaded) {
      throw StateError(
        'BrasilData não foi inicializado. Chame BrasilData.init() no main.dart',
      );
    }
    return _estados ?? [];
  }

  /// Inicializa os dados carregando do JSON
  /// Deve ser chamado uma vez no início do app (main.dart)
  static Future<void> init() async {
    if (_isLoaded) return;

    final jsonString = await rootBundle.loadString(
      'lib/resources/json/estados-cidades.json',
    );
    final jsonData = json.decode(jsonString) as Map<String, dynamic>;
    final estadosList = jsonData['estados'] as List<dynamic>;

    _estados = estadosList.map((e) => Estado.fromJson(e)).toList();
    _isLoaded = true;
  }

  /// Busca um estado pela sigla
  static Estado? getEstadoBySigla(String sigla) {
    try {
      return estados.firstWhere(
        (e) => e.sigla.toUpperCase() == sigla.toUpperCase(),
      );
    } catch (_) {
      return null;
    }
  }

  /// Busca um estado pelo nome
  static Estado? getEstadoByNome(String nome) {
    try {
      return estados.firstWhere(
        (e) => e.nome.toLowerCase() == nome.toLowerCase(),
      );
    } catch (_) {
      return null;
    }
  }

  /// Busca municípios de um estado pela sigla
  static List<String> getMunicipios(String siglaEstado) {
    final estado = getEstadoBySigla(siglaEstado);
    return estado?.cidades ?? [];
  }

  /// Lista apenas as siglas dos estados
  static List<String> get siglas => estados.map((e) => e.sigla).toList();

  /// Lista apenas os nomes dos estados
  static List<String> get nomes => estados.map((e) => e.nome).toList();
}

class Estado {
  final String sigla;
  final String nome;
  final List<String> cidades;

  const Estado({
    required this.sigla,
    required this.nome,
    required this.cidades,
  });

  factory Estado.fromJson(Map<String, dynamic> json) {
    return Estado(
      sigla: json['sigla'] as String,
      nome: json['nome'] as String,
      cidades: (json['cidades'] as List<dynamic>).cast<String>(),
    );
  }

  @override
  String toString() => '$nome ($sigla)';
}
