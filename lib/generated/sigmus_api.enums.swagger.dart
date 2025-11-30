// coverage:ignore-file
// ignore_for_file: type=lint

import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';

enum Permissao {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('leitura')
  permissaoleitura('leitura'),
  @JsonValue('escrita')
  permissaoescrita('escrita'),
  @JsonValue('edicao')
  permissaoedicao('edicao');

  final String? value;

  const Permissao(this.value);
}
