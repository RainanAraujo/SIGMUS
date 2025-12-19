// coverage:ignore-file
// ignore_for_file: type=lint

import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';
import 'dart:convert';

import 'sigmus_api.enums.swagger.dart' as enums;

part 'sigmus_api.models.swagger.g.dart';

@JsonSerializable(explicitToJson: true)
class Colaborador {
  const Colaborador({
    required this.atualizadoEm,
    required this.funcao,
    required this.nome,
    required this.status,
  });

  factory Colaborador.fromJson(Map<String, dynamic> json) =>
      _$ColaboradorFromJson(json);

  static const toJsonFactory = _$ColaboradorToJson;
  Map<String, dynamic> toJson() => _$ColaboradorToJson(this);

  @JsonKey(name: 'atualizado_em')
  final int atualizadoEm;
  @JsonKey(name: 'funcao')
  final String funcao;
  @JsonKey(name: 'nome')
  final String nome;
  @JsonKey(name: 'status')
  final int status;
  static const fromJsonFactory = _$ColaboradorFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Colaborador &&
            (identical(other.atualizadoEm, atualizadoEm) ||
                const DeepCollectionEquality().equals(
                  other.atualizadoEm,
                  atualizadoEm,
                )) &&
            (identical(other.funcao, funcao) ||
                const DeepCollectionEquality().equals(other.funcao, funcao)) &&
            (identical(other.nome, nome) ||
                const DeepCollectionEquality().equals(other.nome, nome)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(atualizadoEm) ^
      const DeepCollectionEquality().hash(funcao) ^
      const DeepCollectionEquality().hash(nome) ^
      const DeepCollectionEquality().hash(status) ^
      runtimeType.hashCode;
}

extension $ColaboradorExtension on Colaborador {
  Colaborador copyWith({
    int? atualizadoEm,
    String? funcao,
    String? nome,
    int? status,
  }) {
    return Colaborador(
      atualizadoEm: atualizadoEm ?? this.atualizadoEm,
      funcao: funcao ?? this.funcao,
      nome: nome ?? this.nome,
      status: status ?? this.status,
    );
  }

  Colaborador copyWithWrapped({
    Wrapped<int>? atualizadoEm,
    Wrapped<String>? funcao,
    Wrapped<String>? nome,
    Wrapped<int>? status,
  }) {
    return Colaborador(
      atualizadoEm: (atualizadoEm != null
          ? atualizadoEm.value
          : this.atualizadoEm),
      funcao: (funcao != null ? funcao.value : this.funcao),
      nome: (nome != null ? nome.value : this.nome),
      status: (status != null ? status.value : this.status),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Conduta {
  const Conduta({
    required this.atualizadoEm,
    this.dados,
    this.data,
    this.medicoId,
    required this.pacienteId,
    required this.status,
    required this.tipo,
  });

  factory Conduta.fromJson(Map<String, dynamic> json) =>
      _$CondutaFromJson(json);

  static const toJsonFactory = _$CondutaToJson;
  Map<String, dynamic> toJson() => _$CondutaToJson(this);

  @JsonKey(name: 'atualizado_em')
  final int atualizadoEm;
  @JsonKey(name: 'dados')
  final Map<String, dynamic>? dados;
  @JsonKey(name: 'data')
  final String? data;
  @JsonKey(name: 'medicoId')
  final int? medicoId;
  @JsonKey(name: 'pacienteId')
  final int pacienteId;
  @JsonKey(name: 'status')
  final int status;
  @JsonKey(name: 'tipo')
  final String tipo;
  static const fromJsonFactory = _$CondutaFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Conduta &&
            (identical(other.atualizadoEm, atualizadoEm) ||
                const DeepCollectionEquality().equals(
                  other.atualizadoEm,
                  atualizadoEm,
                )) &&
            (identical(other.dados, dados) ||
                const DeepCollectionEquality().equals(other.dados, dados)) &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.medicoId, medicoId) ||
                const DeepCollectionEquality().equals(
                  other.medicoId,
                  medicoId,
                )) &&
            (identical(other.pacienteId, pacienteId) ||
                const DeepCollectionEquality().equals(
                  other.pacienteId,
                  pacienteId,
                )) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.tipo, tipo) ||
                const DeepCollectionEquality().equals(other.tipo, tipo)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(atualizadoEm) ^
      const DeepCollectionEquality().hash(dados) ^
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(medicoId) ^
      const DeepCollectionEquality().hash(pacienteId) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(tipo) ^
      runtimeType.hashCode;
}

extension $CondutaExtension on Conduta {
  Conduta copyWith({
    int? atualizadoEm,
    Map<String, dynamic>? dados,
    String? data,
    int? medicoId,
    int? pacienteId,
    int? status,
    String? tipo,
  }) {
    return Conduta(
      atualizadoEm: atualizadoEm ?? this.atualizadoEm,
      dados: dados ?? this.dados,
      data: data ?? this.data,
      medicoId: medicoId ?? this.medicoId,
      pacienteId: pacienteId ?? this.pacienteId,
      status: status ?? this.status,
      tipo: tipo ?? this.tipo,
    );
  }

  Conduta copyWithWrapped({
    Wrapped<int>? atualizadoEm,
    Wrapped<Map<String, dynamic>?>? dados,
    Wrapped<String?>? data,
    Wrapped<int?>? medicoId,
    Wrapped<int>? pacienteId,
    Wrapped<int>? status,
    Wrapped<String>? tipo,
  }) {
    return Conduta(
      atualizadoEm: (atualizadoEm != null
          ? atualizadoEm.value
          : this.atualizadoEm),
      dados: (dados != null ? dados.value : this.dados),
      data: (data != null ? data.value : this.data),
      medicoId: (medicoId != null ? medicoId.value : this.medicoId),
      pacienteId: (pacienteId != null ? pacienteId.value : this.pacienteId),
      status: (status != null ? status.value : this.status),
      tipo: (tipo != null ? tipo.value : this.tipo),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class CondutaGenerica {
  const CondutaGenerica({
    required this.atualizadoEm,
    this.conduta,
    this.data,
    this.medicoId,
    required this.pacienteId,
    required this.status,
  });

  factory CondutaGenerica.fromJson(Map<String, dynamic> json) =>
      _$CondutaGenericaFromJson(json);

  static const toJsonFactory = _$CondutaGenericaToJson;
  Map<String, dynamic> toJson() => _$CondutaGenericaToJson(this);

  @JsonKey(name: 'atualizado_em')
  final int atualizadoEm;
  @JsonKey(name: 'conduta')
  final String? conduta;
  @JsonKey(name: 'data')
  final String? data;
  @JsonKey(name: 'medicoId')
  final int? medicoId;
  @JsonKey(name: 'pacienteId')
  final int pacienteId;
  @JsonKey(name: 'status')
  final int status;
  static const fromJsonFactory = _$CondutaGenericaFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is CondutaGenerica &&
            (identical(other.atualizadoEm, atualizadoEm) ||
                const DeepCollectionEquality().equals(
                  other.atualizadoEm,
                  atualizadoEm,
                )) &&
            (identical(other.conduta, conduta) ||
                const DeepCollectionEquality().equals(
                  other.conduta,
                  conduta,
                )) &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.medicoId, medicoId) ||
                const DeepCollectionEquality().equals(
                  other.medicoId,
                  medicoId,
                )) &&
            (identical(other.pacienteId, pacienteId) ||
                const DeepCollectionEquality().equals(
                  other.pacienteId,
                  pacienteId,
                )) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(atualizadoEm) ^
      const DeepCollectionEquality().hash(conduta) ^
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(medicoId) ^
      const DeepCollectionEquality().hash(pacienteId) ^
      const DeepCollectionEquality().hash(status) ^
      runtimeType.hashCode;
}

extension $CondutaGenericaExtension on CondutaGenerica {
  CondutaGenerica copyWith({
    int? atualizadoEm,
    String? conduta,
    String? data,
    int? medicoId,
    int? pacienteId,
    int? status,
  }) {
    return CondutaGenerica(
      atualizadoEm: atualizadoEm ?? this.atualizadoEm,
      conduta: conduta ?? this.conduta,
      data: data ?? this.data,
      medicoId: medicoId ?? this.medicoId,
      pacienteId: pacienteId ?? this.pacienteId,
      status: status ?? this.status,
    );
  }

  CondutaGenerica copyWithWrapped({
    Wrapped<int>? atualizadoEm,
    Wrapped<String?>? conduta,
    Wrapped<String?>? data,
    Wrapped<int?>? medicoId,
    Wrapped<int>? pacienteId,
    Wrapped<int>? status,
  }) {
    return CondutaGenerica(
      atualizadoEm: (atualizadoEm != null
          ? atualizadoEm.value
          : this.atualizadoEm),
      conduta: (conduta != null ? conduta.value : this.conduta),
      data: (data != null ? data.value : this.data),
      medicoId: (medicoId != null ? medicoId.value : this.medicoId),
      pacienteId: (pacienteId != null ? pacienteId.value : this.pacienteId),
      status: (status != null ? status.value : this.status),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class DelUserRes {
  const DelUserRes({required this.messagem});

  factory DelUserRes.fromJson(Map<String, dynamic> json) =>
      _$DelUserResFromJson(json);

  static const toJsonFactory = _$DelUserResToJson;
  Map<String, dynamic> toJson() => _$DelUserResToJson(this);

  @JsonKey(name: 'messagem')
  final String messagem;
  static const fromJsonFactory = _$DelUserResFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is DelUserRes &&
            (identical(other.messagem, messagem) ||
                const DeepCollectionEquality().equals(
                  other.messagem,
                  messagem,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(messagem) ^ runtimeType.hashCode;
}

extension $DelUserResExtension on DelUserRes {
  DelUserRes copyWith({String? messagem}) {
    return DelUserRes(messagem: messagem ?? this.messagem);
  }

  DelUserRes copyWithWrapped({Wrapped<String>? messagem}) {
    return DelUserRes(
      messagem: (messagem != null ? messagem.value : this.messagem),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class ErrorMessage {
  const ErrorMessage({required this.error, required this.messagem});

  factory ErrorMessage.fromJson(Map<String, dynamic> json) =>
      _$ErrorMessageFromJson(json);

  static const toJsonFactory = _$ErrorMessageToJson;
  Map<String, dynamic> toJson() => _$ErrorMessageToJson(this);

  @JsonKey(name: 'error')
  final String error;
  @JsonKey(name: 'messagem')
  final String messagem;
  static const fromJsonFactory = _$ErrorMessageFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is ErrorMessage &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)) &&
            (identical(other.messagem, messagem) ||
                const DeepCollectionEquality().equals(
                  other.messagem,
                  messagem,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(error) ^
      const DeepCollectionEquality().hash(messagem) ^
      runtimeType.hashCode;
}

extension $ErrorMessageExtension on ErrorMessage {
  ErrorMessage copyWith({String? error, String? messagem}) {
    return ErrorMessage(
      error: error ?? this.error,
      messagem: messagem ?? this.messagem,
    );
  }

  ErrorMessage copyWithWrapped({
    Wrapped<String>? error,
    Wrapped<String>? messagem,
  }) {
    return ErrorMessage(
      error: (error != null ? error.value : this.error),
      messagem: (messagem != null ? messagem.value : this.messagem),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class GetAtualizarTokenRes {
  const GetAtualizarTokenRes({
    required this.expiresIn,
    required this.messagem,
    required this.token,
  });

  factory GetAtualizarTokenRes.fromJson(Map<String, dynamic> json) =>
      _$GetAtualizarTokenResFromJson(json);

  static const toJsonFactory = _$GetAtualizarTokenResToJson;
  Map<String, dynamic> toJson() => _$GetAtualizarTokenResToJson(this);

  @JsonKey(name: 'expires_in')
  final int expiresIn;
  @JsonKey(name: 'messagem')
  final String messagem;
  @JsonKey(name: 'token')
  final String token;
  static const fromJsonFactory = _$GetAtualizarTokenResFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GetAtualizarTokenRes &&
            (identical(other.expiresIn, expiresIn) ||
                const DeepCollectionEquality().equals(
                  other.expiresIn,
                  expiresIn,
                )) &&
            (identical(other.messagem, messagem) ||
                const DeepCollectionEquality().equals(
                  other.messagem,
                  messagem,
                )) &&
            (identical(other.token, token) ||
                const DeepCollectionEquality().equals(other.token, token)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(expiresIn) ^
      const DeepCollectionEquality().hash(messagem) ^
      const DeepCollectionEquality().hash(token) ^
      runtimeType.hashCode;
}

extension $GetAtualizarTokenResExtension on GetAtualizarTokenRes {
  GetAtualizarTokenRes copyWith({
    int? expiresIn,
    String? messagem,
    String? token,
  }) {
    return GetAtualizarTokenRes(
      expiresIn: expiresIn ?? this.expiresIn,
      messagem: messagem ?? this.messagem,
      token: token ?? this.token,
    );
  }

  GetAtualizarTokenRes copyWithWrapped({
    Wrapped<int>? expiresIn,
    Wrapped<String>? messagem,
    Wrapped<String>? token,
  }) {
    return GetAtualizarTokenRes(
      expiresIn: (expiresIn != null ? expiresIn.value : this.expiresIn),
      messagem: (messagem != null ? messagem.value : this.messagem),
      token: (token != null ? token.value : this.token),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class GetMutiraoMudancasRes {
  const GetMutiraoMudancasRes({
    required this.messagem,
    this.mudancas,
    this.mutirao,
    required this.timestamp,
  });

  factory GetMutiraoMudancasRes.fromJson(Map<String, dynamic> json) =>
      _$GetMutiraoMudancasResFromJson(json);

  static const toJsonFactory = _$GetMutiraoMudancasResToJson;
  Map<String, dynamic> toJson() => _$GetMutiraoMudancasResToJson(this);

  @JsonKey(name: 'messagem')
  final String messagem;
  @JsonKey(name: 'mudancas')
  final MutiraoMudancas? mudancas;
  @JsonKey(name: 'mutirao')
  final MutiraoData? mutirao;
  @JsonKey(name: 'timestamp')
  final int timestamp;
  static const fromJsonFactory = _$GetMutiraoMudancasResFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GetMutiraoMudancasRes &&
            (identical(other.messagem, messagem) ||
                const DeepCollectionEquality().equals(
                  other.messagem,
                  messagem,
                )) &&
            (identical(other.mudancas, mudancas) ||
                const DeepCollectionEquality().equals(
                  other.mudancas,
                  mudancas,
                )) &&
            (identical(other.mutirao, mutirao) ||
                const DeepCollectionEquality().equals(
                  other.mutirao,
                  mutirao,
                )) &&
            (identical(other.timestamp, timestamp) ||
                const DeepCollectionEquality().equals(
                  other.timestamp,
                  timestamp,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(messagem) ^
      const DeepCollectionEquality().hash(mudancas) ^
      const DeepCollectionEquality().hash(mutirao) ^
      const DeepCollectionEquality().hash(timestamp) ^
      runtimeType.hashCode;
}

extension $GetMutiraoMudancasResExtension on GetMutiraoMudancasRes {
  GetMutiraoMudancasRes copyWith({
    String? messagem,
    MutiraoMudancas? mudancas,
    MutiraoData? mutirao,
    int? timestamp,
  }) {
    return GetMutiraoMudancasRes(
      messagem: messagem ?? this.messagem,
      mudancas: mudancas ?? this.mudancas,
      mutirao: mutirao ?? this.mutirao,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  GetMutiraoMudancasRes copyWithWrapped({
    Wrapped<String>? messagem,
    Wrapped<MutiraoMudancas?>? mudancas,
    Wrapped<MutiraoData?>? mutirao,
    Wrapped<int>? timestamp,
  }) {
    return GetMutiraoMudancasRes(
      messagem: (messagem != null ? messagem.value : this.messagem),
      mudancas: (mudancas != null ? mudancas.value : this.mudancas),
      mutirao: (mutirao != null ? mutirao.value : this.mutirao),
      timestamp: (timestamp != null ? timestamp.value : this.timestamp),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class GetUsuarioMutiroesRes {
  const GetUsuarioMutiroesRes({required this.messagem, required this.mutiroes});

  factory GetUsuarioMutiroesRes.fromJson(Map<String, dynamic> json) =>
      _$GetUsuarioMutiroesResFromJson(json);

  static const toJsonFactory = _$GetUsuarioMutiroesResToJson;
  Map<String, dynamic> toJson() => _$GetUsuarioMutiroesResToJson(this);

  @JsonKey(name: 'messagem')
  final String messagem;
  @JsonKey(name: 'mutiroes', defaultValue: <MutiraoInfo>[])
  final List<MutiraoInfo> mutiroes;
  static const fromJsonFactory = _$GetUsuarioMutiroesResFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GetUsuarioMutiroesRes &&
            (identical(other.messagem, messagem) ||
                const DeepCollectionEquality().equals(
                  other.messagem,
                  messagem,
                )) &&
            (identical(other.mutiroes, mutiroes) ||
                const DeepCollectionEquality().equals(
                  other.mutiroes,
                  mutiroes,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(messagem) ^
      const DeepCollectionEquality().hash(mutiroes) ^
      runtimeType.hashCode;
}

extension $GetUsuarioMutiroesResExtension on GetUsuarioMutiroesRes {
  GetUsuarioMutiroesRes copyWith({
    String? messagem,
    List<MutiraoInfo>? mutiroes,
  }) {
    return GetUsuarioMutiroesRes(
      messagem: messagem ?? this.messagem,
      mutiroes: mutiroes ?? this.mutiroes,
    );
  }

  GetUsuarioMutiroesRes copyWithWrapped({
    Wrapped<String>? messagem,
    Wrapped<List<MutiraoInfo>>? mutiroes,
  }) {
    return GetUsuarioMutiroesRes(
      messagem: (messagem != null ? messagem.value : this.messagem),
      mutiroes: (mutiroes != null ? mutiroes.value : this.mutiroes),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Medico {
  const Medico({
    required this.atualizadoEm,
    required this.crm,
    required this.nome,
    required this.status,
  });

  factory Medico.fromJson(Map<String, dynamic> json) => _$MedicoFromJson(json);

  static const toJsonFactory = _$MedicoToJson;
  Map<String, dynamic> toJson() => _$MedicoToJson(this);

  @JsonKey(name: 'atualizado_em')
  final int atualizadoEm;
  @JsonKey(name: 'crm')
  final String crm;
  @JsonKey(name: 'nome')
  final String nome;
  @JsonKey(name: 'status')
  final int status;
  static const fromJsonFactory = _$MedicoFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Medico &&
            (identical(other.atualizadoEm, atualizadoEm) ||
                const DeepCollectionEquality().equals(
                  other.atualizadoEm,
                  atualizadoEm,
                )) &&
            (identical(other.crm, crm) ||
                const DeepCollectionEquality().equals(other.crm, crm)) &&
            (identical(other.nome, nome) ||
                const DeepCollectionEquality().equals(other.nome, nome)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(atualizadoEm) ^
      const DeepCollectionEquality().hash(crm) ^
      const DeepCollectionEquality().hash(nome) ^
      const DeepCollectionEquality().hash(status) ^
      runtimeType.hashCode;
}

extension $MedicoExtension on Medico {
  Medico copyWith({int? atualizadoEm, String? crm, String? nome, int? status}) {
    return Medico(
      atualizadoEm: atualizadoEm ?? this.atualizadoEm,
      crm: crm ?? this.crm,
      nome: nome ?? this.nome,
      status: status ?? this.status,
    );
  }

  Medico copyWithWrapped({
    Wrapped<int>? atualizadoEm,
    Wrapped<String>? crm,
    Wrapped<String>? nome,
    Wrapped<int>? status,
  }) {
    return Medico(
      atualizadoEm: (atualizadoEm != null
          ? atualizadoEm.value
          : this.atualizadoEm),
      crm: (crm != null ? crm.value : this.crm),
      nome: (nome != null ? nome.value : this.nome),
      status: (status != null ? status.value : this.status),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class MutiraoData {
  const MutiraoData({
    required this.atualizadoEm,
    required this.contratante,
    required this.dataFinal,
    required this.dataInicio,
    required this.demandante,
    required this.estado,
    required this.id,
    required this.local,
    required this.municipio,
    required this.permissoes,
    required this.status,
    required this.tipo,
  });

  factory MutiraoData.fromJson(Map<String, dynamic> json) =>
      _$MutiraoDataFromJson(json);

  static const toJsonFactory = _$MutiraoDataToJson;
  Map<String, dynamic> toJson() => _$MutiraoDataToJson(this);

  @JsonKey(name: 'atualizado_em')
  final int atualizadoEm;
  @JsonKey(name: 'contratante')
  final String contratante;
  @JsonKey(name: 'data_final')
  final String dataFinal;
  @JsonKey(name: 'data_inicio')
  final String dataInicio;
  @JsonKey(name: 'demandante')
  final String demandante;
  @JsonKey(name: 'estado')
  final String estado;
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'local')
  final String local;
  @JsonKey(name: 'municipio')
  final String municipio;
  @JsonKey(name: 'permissoes')
  final Map<String, dynamic> permissoes;
  @JsonKey(name: 'status')
  final int status;
  @JsonKey(name: 'tipo')
  final String tipo;
  static const fromJsonFactory = _$MutiraoDataFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is MutiraoData &&
            (identical(other.atualizadoEm, atualizadoEm) ||
                const DeepCollectionEquality().equals(
                  other.atualizadoEm,
                  atualizadoEm,
                )) &&
            (identical(other.contratante, contratante) ||
                const DeepCollectionEquality().equals(
                  other.contratante,
                  contratante,
                )) &&
            (identical(other.dataFinal, dataFinal) ||
                const DeepCollectionEquality().equals(
                  other.dataFinal,
                  dataFinal,
                )) &&
            (identical(other.dataInicio, dataInicio) ||
                const DeepCollectionEquality().equals(
                  other.dataInicio,
                  dataInicio,
                )) &&
            (identical(other.demandante, demandante) ||
                const DeepCollectionEquality().equals(
                  other.demandante,
                  demandante,
                )) &&
            (identical(other.estado, estado) ||
                const DeepCollectionEquality().equals(other.estado, estado)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.local, local) ||
                const DeepCollectionEquality().equals(other.local, local)) &&
            (identical(other.municipio, municipio) ||
                const DeepCollectionEquality().equals(
                  other.municipio,
                  municipio,
                )) &&
            (identical(other.permissoes, permissoes) ||
                const DeepCollectionEquality().equals(
                  other.permissoes,
                  permissoes,
                )) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.tipo, tipo) ||
                const DeepCollectionEquality().equals(other.tipo, tipo)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(atualizadoEm) ^
      const DeepCollectionEquality().hash(contratante) ^
      const DeepCollectionEquality().hash(dataFinal) ^
      const DeepCollectionEquality().hash(dataInicio) ^
      const DeepCollectionEquality().hash(demandante) ^
      const DeepCollectionEquality().hash(estado) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(local) ^
      const DeepCollectionEquality().hash(municipio) ^
      const DeepCollectionEquality().hash(permissoes) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(tipo) ^
      runtimeType.hashCode;
}

extension $MutiraoDataExtension on MutiraoData {
  MutiraoData copyWith({
    int? atualizadoEm,
    String? contratante,
    String? dataFinal,
    String? dataInicio,
    String? demandante,
    String? estado,
    int? id,
    String? local,
    String? municipio,
    Map<String, dynamic>? permissoes,
    int? status,
    String? tipo,
  }) {
    return MutiraoData(
      atualizadoEm: atualizadoEm ?? this.atualizadoEm,
      contratante: contratante ?? this.contratante,
      dataFinal: dataFinal ?? this.dataFinal,
      dataInicio: dataInicio ?? this.dataInicio,
      demandante: demandante ?? this.demandante,
      estado: estado ?? this.estado,
      id: id ?? this.id,
      local: local ?? this.local,
      municipio: municipio ?? this.municipio,
      permissoes: permissoes ?? this.permissoes,
      status: status ?? this.status,
      tipo: tipo ?? this.tipo,
    );
  }

  MutiraoData copyWithWrapped({
    Wrapped<int>? atualizadoEm,
    Wrapped<String>? contratante,
    Wrapped<String>? dataFinal,
    Wrapped<String>? dataInicio,
    Wrapped<String>? demandante,
    Wrapped<String>? estado,
    Wrapped<int>? id,
    Wrapped<String>? local,
    Wrapped<String>? municipio,
    Wrapped<Map<String, dynamic>>? permissoes,
    Wrapped<int>? status,
    Wrapped<String>? tipo,
  }) {
    return MutiraoData(
      atualizadoEm: (atualizadoEm != null
          ? atualizadoEm.value
          : this.atualizadoEm),
      contratante: (contratante != null ? contratante.value : this.contratante),
      dataFinal: (dataFinal != null ? dataFinal.value : this.dataFinal),
      dataInicio: (dataInicio != null ? dataInicio.value : this.dataInicio),
      demandante: (demandante != null ? demandante.value : this.demandante),
      estado: (estado != null ? estado.value : this.estado),
      id: (id != null ? id.value : this.id),
      local: (local != null ? local.value : this.local),
      municipio: (municipio != null ? municipio.value : this.municipio),
      permissoes: (permissoes != null ? permissoes.value : this.permissoes),
      status: (status != null ? status.value : this.status),
      tipo: (tipo != null ? tipo.value : this.tipo),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class MutiraoInfo {
  const MutiraoInfo({
    required this.atualizadoEm,
    required this.contratante,
    required this.dataFinal,
    required this.dataInicio,
    required this.demandante,
    required this.estado,
    required this.id,
    required this.local,
    required this.municipio,
    required this.permissoes,
    required this.status,
    required this.tipo,
    required this.ultimaMudanca,
  });

  factory MutiraoInfo.fromJson(Map<String, dynamic> json) =>
      _$MutiraoInfoFromJson(json);

  static const toJsonFactory = _$MutiraoInfoToJson;
  Map<String, dynamic> toJson() => _$MutiraoInfoToJson(this);

  @JsonKey(name: 'atualizado_em')
  final int atualizadoEm;
  @JsonKey(name: 'contratante')
  final String contratante;
  @JsonKey(name: 'data_final')
  final String dataFinal;
  @JsonKey(name: 'data_inicio')
  final String dataInicio;
  @JsonKey(name: 'demandante')
  final String demandante;
  @JsonKey(name: 'estado')
  final String estado;
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'local')
  final String local;
  @JsonKey(name: 'municipio')
  final String municipio;
  @JsonKey(name: 'permissoes')
  final Map<String, dynamic> permissoes;
  @JsonKey(name: 'status')
  final int status;
  @JsonKey(name: 'tipo')
  final String tipo;
  @JsonKey(name: 'ultima_mudanca')
  final int ultimaMudanca;
  static const fromJsonFactory = _$MutiraoInfoFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is MutiraoInfo &&
            (identical(other.atualizadoEm, atualizadoEm) ||
                const DeepCollectionEquality().equals(
                  other.atualizadoEm,
                  atualizadoEm,
                )) &&
            (identical(other.contratante, contratante) ||
                const DeepCollectionEquality().equals(
                  other.contratante,
                  contratante,
                )) &&
            (identical(other.dataFinal, dataFinal) ||
                const DeepCollectionEquality().equals(
                  other.dataFinal,
                  dataFinal,
                )) &&
            (identical(other.dataInicio, dataInicio) ||
                const DeepCollectionEquality().equals(
                  other.dataInicio,
                  dataInicio,
                )) &&
            (identical(other.demandante, demandante) ||
                const DeepCollectionEquality().equals(
                  other.demandante,
                  demandante,
                )) &&
            (identical(other.estado, estado) ||
                const DeepCollectionEquality().equals(other.estado, estado)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.local, local) ||
                const DeepCollectionEquality().equals(other.local, local)) &&
            (identical(other.municipio, municipio) ||
                const DeepCollectionEquality().equals(
                  other.municipio,
                  municipio,
                )) &&
            (identical(other.permissoes, permissoes) ||
                const DeepCollectionEquality().equals(
                  other.permissoes,
                  permissoes,
                )) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.tipo, tipo) ||
                const DeepCollectionEquality().equals(other.tipo, tipo)) &&
            (identical(other.ultimaMudanca, ultimaMudanca) ||
                const DeepCollectionEquality().equals(
                  other.ultimaMudanca,
                  ultimaMudanca,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(atualizadoEm) ^
      const DeepCollectionEquality().hash(contratante) ^
      const DeepCollectionEquality().hash(dataFinal) ^
      const DeepCollectionEquality().hash(dataInicio) ^
      const DeepCollectionEquality().hash(demandante) ^
      const DeepCollectionEquality().hash(estado) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(local) ^
      const DeepCollectionEquality().hash(municipio) ^
      const DeepCollectionEquality().hash(permissoes) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(tipo) ^
      const DeepCollectionEquality().hash(ultimaMudanca) ^
      runtimeType.hashCode;
}

extension $MutiraoInfoExtension on MutiraoInfo {
  MutiraoInfo copyWith({
    int? atualizadoEm,
    String? contratante,
    String? dataFinal,
    String? dataInicio,
    String? demandante,
    String? estado,
    int? id,
    String? local,
    String? municipio,
    Map<String, dynamic>? permissoes,
    int? status,
    String? tipo,
    int? ultimaMudanca,
  }) {
    return MutiraoInfo(
      atualizadoEm: atualizadoEm ?? this.atualizadoEm,
      contratante: contratante ?? this.contratante,
      dataFinal: dataFinal ?? this.dataFinal,
      dataInicio: dataInicio ?? this.dataInicio,
      demandante: demandante ?? this.demandante,
      estado: estado ?? this.estado,
      id: id ?? this.id,
      local: local ?? this.local,
      municipio: municipio ?? this.municipio,
      permissoes: permissoes ?? this.permissoes,
      status: status ?? this.status,
      tipo: tipo ?? this.tipo,
      ultimaMudanca: ultimaMudanca ?? this.ultimaMudanca,
    );
  }

  MutiraoInfo copyWithWrapped({
    Wrapped<int>? atualizadoEm,
    Wrapped<String>? contratante,
    Wrapped<String>? dataFinal,
    Wrapped<String>? dataInicio,
    Wrapped<String>? demandante,
    Wrapped<String>? estado,
    Wrapped<int>? id,
    Wrapped<String>? local,
    Wrapped<String>? municipio,
    Wrapped<Map<String, dynamic>>? permissoes,
    Wrapped<int>? status,
    Wrapped<String>? tipo,
    Wrapped<int>? ultimaMudanca,
  }) {
    return MutiraoInfo(
      atualizadoEm: (atualizadoEm != null
          ? atualizadoEm.value
          : this.atualizadoEm),
      contratante: (contratante != null ? contratante.value : this.contratante),
      dataFinal: (dataFinal != null ? dataFinal.value : this.dataFinal),
      dataInicio: (dataInicio != null ? dataInicio.value : this.dataInicio),
      demandante: (demandante != null ? demandante.value : this.demandante),
      estado: (estado != null ? estado.value : this.estado),
      id: (id != null ? id.value : this.id),
      local: (local != null ? local.value : this.local),
      municipio: (municipio != null ? municipio.value : this.municipio),
      permissoes: (permissoes != null ? permissoes.value : this.permissoes),
      status: (status != null ? status.value : this.status),
      tipo: (tipo != null ? tipo.value : this.tipo),
      ultimaMudanca: (ultimaMudanca != null
          ? ultimaMudanca.value
          : this.ultimaMudanca),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class MutiraoMudancas {
  const MutiraoMudancas({
    this.colaboradores,
    this.condutas,
    this.condutasGenericas,
    this.medicos,
    this.mutiraoCondutas,
    this.pacientes,
    this.procedimentos,
  });

  factory MutiraoMudancas.fromJson(Map<String, dynamic> json) =>
      _$MutiraoMudancasFromJson(json);

  static const toJsonFactory = _$MutiraoMudancasToJson;
  Map<String, dynamic> toJson() => _$MutiraoMudancasToJson(this);

  @JsonKey(name: 'colaboradores')
  final Map<String, dynamic>? colaboradores;
  @JsonKey(name: 'condutas')
  final Map<String, dynamic>? condutas;
  @JsonKey(name: 'condutasGenericas')
  final Map<String, dynamic>? condutasGenericas;
  @JsonKey(name: 'medicos')
  final Map<String, dynamic>? medicos;
  @JsonKey(name: 'mutiraoCondutas', defaultValue: <String>[])
  final List<String>? mutiraoCondutas;
  @JsonKey(name: 'pacientes')
  final Map<String, dynamic>? pacientes;
  @JsonKey(name: 'procedimentos')
  final Map<String, dynamic>? procedimentos;
  static const fromJsonFactory = _$MutiraoMudancasFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is MutiraoMudancas &&
            (identical(other.colaboradores, colaboradores) ||
                const DeepCollectionEquality().equals(
                  other.colaboradores,
                  colaboradores,
                )) &&
            (identical(other.condutas, condutas) ||
                const DeepCollectionEquality().equals(
                  other.condutas,
                  condutas,
                )) &&
            (identical(other.condutasGenericas, condutasGenericas) ||
                const DeepCollectionEquality().equals(
                  other.condutasGenericas,
                  condutasGenericas,
                )) &&
            (identical(other.medicos, medicos) ||
                const DeepCollectionEquality().equals(
                  other.medicos,
                  medicos,
                )) &&
            (identical(other.mutiraoCondutas, mutiraoCondutas) ||
                const DeepCollectionEquality().equals(
                  other.mutiraoCondutas,
                  mutiraoCondutas,
                )) &&
            (identical(other.pacientes, pacientes) ||
                const DeepCollectionEquality().equals(
                  other.pacientes,
                  pacientes,
                )) &&
            (identical(other.procedimentos, procedimentos) ||
                const DeepCollectionEquality().equals(
                  other.procedimentos,
                  procedimentos,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(colaboradores) ^
      const DeepCollectionEquality().hash(condutas) ^
      const DeepCollectionEquality().hash(condutasGenericas) ^
      const DeepCollectionEquality().hash(medicos) ^
      const DeepCollectionEquality().hash(mutiraoCondutas) ^
      const DeepCollectionEquality().hash(pacientes) ^
      const DeepCollectionEquality().hash(procedimentos) ^
      runtimeType.hashCode;
}

extension $MutiraoMudancasExtension on MutiraoMudancas {
  MutiraoMudancas copyWith({
    Map<String, dynamic>? colaboradores,
    Map<String, dynamic>? condutas,
    Map<String, dynamic>? condutasGenericas,
    Map<String, dynamic>? medicos,
    List<String>? mutiraoCondutas,
    Map<String, dynamic>? pacientes,
    Map<String, dynamic>? procedimentos,
  }) {
    return MutiraoMudancas(
      colaboradores: colaboradores ?? this.colaboradores,
      condutas: condutas ?? this.condutas,
      condutasGenericas: condutasGenericas ?? this.condutasGenericas,
      medicos: medicos ?? this.medicos,
      mutiraoCondutas: mutiraoCondutas ?? this.mutiraoCondutas,
      pacientes: pacientes ?? this.pacientes,
      procedimentos: procedimentos ?? this.procedimentos,
    );
  }

  MutiraoMudancas copyWithWrapped({
    Wrapped<Map<String, dynamic>?>? colaboradores,
    Wrapped<Map<String, dynamic>?>? condutas,
    Wrapped<Map<String, dynamic>?>? condutasGenericas,
    Wrapped<Map<String, dynamic>?>? medicos,
    Wrapped<List<String>?>? mutiraoCondutas,
    Wrapped<Map<String, dynamic>?>? pacientes,
    Wrapped<Map<String, dynamic>?>? procedimentos,
  }) {
    return MutiraoMudancas(
      colaboradores: (colaboradores != null
          ? colaboradores.value
          : this.colaboradores),
      condutas: (condutas != null ? condutas.value : this.condutas),
      condutasGenericas: (condutasGenericas != null
          ? condutasGenericas.value
          : this.condutasGenericas),
      medicos: (medicos != null ? medicos.value : this.medicos),
      mutiraoCondutas: (mutiraoCondutas != null
          ? mutiraoCondutas.value
          : this.mutiraoCondutas),
      pacientes: (pacientes != null ? pacientes.value : this.pacientes),
      procedimentos: (procedimentos != null
          ? procedimentos.value
          : this.procedimentos),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Paciente {
  const Paciente({
    required this.atualizadoEm,
    this.cns,
    this.cpf,
    this.dataNascimento,
    this.endereco,
    this.municipio,
    this.nome,
    this.nomeDaMae,
    required this.status,
    this.tel,
    this.uf,
  });

  factory Paciente.fromJson(Map<String, dynamic> json) =>
      _$PacienteFromJson(json);

  static const toJsonFactory = _$PacienteToJson;
  Map<String, dynamic> toJson() => _$PacienteToJson(this);

  @JsonKey(name: 'atualizado_em')
  final int atualizadoEm;
  @JsonKey(name: 'cns')
  final String? cns;
  @JsonKey(name: 'cpf')
  final String? cpf;
  @JsonKey(name: 'dataNascimento')
  final String? dataNascimento;
  @JsonKey(name: 'endereco')
  final String? endereco;
  @JsonKey(name: 'municipio')
  final String? municipio;
  @JsonKey(name: 'nome')
  final String? nome;
  @JsonKey(name: 'nomeDaMae')
  final String? nomeDaMae;
  @JsonKey(name: 'status')
  final int status;
  @JsonKey(name: 'tel')
  final String? tel;
  @JsonKey(name: 'uf')
  final String? uf;
  static const fromJsonFactory = _$PacienteFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Paciente &&
            (identical(other.atualizadoEm, atualizadoEm) ||
                const DeepCollectionEquality().equals(
                  other.atualizadoEm,
                  atualizadoEm,
                )) &&
            (identical(other.cns, cns) ||
                const DeepCollectionEquality().equals(other.cns, cns)) &&
            (identical(other.cpf, cpf) ||
                const DeepCollectionEquality().equals(other.cpf, cpf)) &&
            (identical(other.dataNascimento, dataNascimento) ||
                const DeepCollectionEquality().equals(
                  other.dataNascimento,
                  dataNascimento,
                )) &&
            (identical(other.endereco, endereco) ||
                const DeepCollectionEquality().equals(
                  other.endereco,
                  endereco,
                )) &&
            (identical(other.municipio, municipio) ||
                const DeepCollectionEquality().equals(
                  other.municipio,
                  municipio,
                )) &&
            (identical(other.nome, nome) ||
                const DeepCollectionEquality().equals(other.nome, nome)) &&
            (identical(other.nomeDaMae, nomeDaMae) ||
                const DeepCollectionEquality().equals(
                  other.nomeDaMae,
                  nomeDaMae,
                )) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.tel, tel) ||
                const DeepCollectionEquality().equals(other.tel, tel)) &&
            (identical(other.uf, uf) ||
                const DeepCollectionEquality().equals(other.uf, uf)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(atualizadoEm) ^
      const DeepCollectionEquality().hash(cns) ^
      const DeepCollectionEquality().hash(cpf) ^
      const DeepCollectionEquality().hash(dataNascimento) ^
      const DeepCollectionEquality().hash(endereco) ^
      const DeepCollectionEquality().hash(municipio) ^
      const DeepCollectionEquality().hash(nome) ^
      const DeepCollectionEquality().hash(nomeDaMae) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(tel) ^
      const DeepCollectionEquality().hash(uf) ^
      runtimeType.hashCode;
}

extension $PacienteExtension on Paciente {
  Paciente copyWith({
    int? atualizadoEm,
    String? cns,
    String? cpf,
    String? dataNascimento,
    String? endereco,
    String? municipio,
    String? nome,
    String? nomeDaMae,
    int? status,
    String? tel,
    String? uf,
  }) {
    return Paciente(
      atualizadoEm: atualizadoEm ?? this.atualizadoEm,
      cns: cns ?? this.cns,
      cpf: cpf ?? this.cpf,
      dataNascimento: dataNascimento ?? this.dataNascimento,
      endereco: endereco ?? this.endereco,
      municipio: municipio ?? this.municipio,
      nome: nome ?? this.nome,
      nomeDaMae: nomeDaMae ?? this.nomeDaMae,
      status: status ?? this.status,
      tel: tel ?? this.tel,
      uf: uf ?? this.uf,
    );
  }

  Paciente copyWithWrapped({
    Wrapped<int>? atualizadoEm,
    Wrapped<String?>? cns,
    Wrapped<String?>? cpf,
    Wrapped<String?>? dataNascimento,
    Wrapped<String?>? endereco,
    Wrapped<String?>? municipio,
    Wrapped<String?>? nome,
    Wrapped<String?>? nomeDaMae,
    Wrapped<int>? status,
    Wrapped<String?>? tel,
    Wrapped<String?>? uf,
  }) {
    return Paciente(
      atualizadoEm: (atualizadoEm != null
          ? atualizadoEm.value
          : this.atualizadoEm),
      cns: (cns != null ? cns.value : this.cns),
      cpf: (cpf != null ? cpf.value : this.cpf),
      dataNascimento: (dataNascimento != null
          ? dataNascimento.value
          : this.dataNascimento),
      endereco: (endereco != null ? endereco.value : this.endereco),
      municipio: (municipio != null ? municipio.value : this.municipio),
      nome: (nome != null ? nome.value : this.nome),
      nomeDaMae: (nomeDaMae != null ? nomeDaMae.value : this.nomeDaMae),
      status: (status != null ? status.value : this.status),
      tel: (tel != null ? tel.value : this.tel),
      uf: (uf != null ? uf.value : this.uf),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class PersonData {
  const PersonData({
    required this.cns,
    required this.cpf,
    required this.dataNascimento,
    required this.endereco,
    required this.nome,
    required this.nomeMae,
    required this.tel,
  });

  factory PersonData.fromJson(Map<String, dynamic> json) =>
      _$PersonDataFromJson(json);

  static const toJsonFactory = _$PersonDataToJson;
  Map<String, dynamic> toJson() => _$PersonDataToJson(this);

  @JsonKey(name: 'cns')
  final String cns;
  @JsonKey(name: 'cpf')
  final String cpf;
  @JsonKey(name: 'dataNascimento')
  final String dataNascimento;
  @JsonKey(name: 'endereco')
  final String endereco;
  @JsonKey(name: 'nome')
  final String nome;
  @JsonKey(name: 'nomeMae')
  final String nomeMae;
  @JsonKey(name: 'tel')
  final String tel;
  static const fromJsonFactory = _$PersonDataFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is PersonData &&
            (identical(other.cns, cns) ||
                const DeepCollectionEquality().equals(other.cns, cns)) &&
            (identical(other.cpf, cpf) ||
                const DeepCollectionEquality().equals(other.cpf, cpf)) &&
            (identical(other.dataNascimento, dataNascimento) ||
                const DeepCollectionEquality().equals(
                  other.dataNascimento,
                  dataNascimento,
                )) &&
            (identical(other.endereco, endereco) ||
                const DeepCollectionEquality().equals(
                  other.endereco,
                  endereco,
                )) &&
            (identical(other.nome, nome) ||
                const DeepCollectionEquality().equals(other.nome, nome)) &&
            (identical(other.nomeMae, nomeMae) ||
                const DeepCollectionEquality().equals(
                  other.nomeMae,
                  nomeMae,
                )) &&
            (identical(other.tel, tel) ||
                const DeepCollectionEquality().equals(other.tel, tel)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(cns) ^
      const DeepCollectionEquality().hash(cpf) ^
      const DeepCollectionEquality().hash(dataNascimento) ^
      const DeepCollectionEquality().hash(endereco) ^
      const DeepCollectionEquality().hash(nome) ^
      const DeepCollectionEquality().hash(nomeMae) ^
      const DeepCollectionEquality().hash(tel) ^
      runtimeType.hashCode;
}

extension $PersonDataExtension on PersonData {
  PersonData copyWith({
    String? cns,
    String? cpf,
    String? dataNascimento,
    String? endereco,
    String? nome,
    String? nomeMae,
    String? tel,
  }) {
    return PersonData(
      cns: cns ?? this.cns,
      cpf: cpf ?? this.cpf,
      dataNascimento: dataNascimento ?? this.dataNascimento,
      endereco: endereco ?? this.endereco,
      nome: nome ?? this.nome,
      nomeMae: nomeMae ?? this.nomeMae,
      tel: tel ?? this.tel,
    );
  }

  PersonData copyWithWrapped({
    Wrapped<String>? cns,
    Wrapped<String>? cpf,
    Wrapped<String>? dataNascimento,
    Wrapped<String>? endereco,
    Wrapped<String>? nome,
    Wrapped<String>? nomeMae,
    Wrapped<String>? tel,
  }) {
    return PersonData(
      cns: (cns != null ? cns.value : this.cns),
      cpf: (cpf != null ? cpf.value : this.cpf),
      dataNascimento: (dataNascimento != null
          ? dataNascimento.value
          : this.dataNascimento),
      endereco: (endereco != null ? endereco.value : this.endereco),
      nome: (nome != null ? nome.value : this.nome),
      nomeMae: (nomeMae != null ? nomeMae.value : this.nomeMae),
      tel: (tel != null ? tel.value : this.tel),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class PostEntrarReq {
  const PostEntrarReq({required this.email, required this.senha});

  factory PostEntrarReq.fromJson(Map<String, dynamic> json) =>
      _$PostEntrarReqFromJson(json);

  static const toJsonFactory = _$PostEntrarReqToJson;
  Map<String, dynamic> toJson() => _$PostEntrarReqToJson(this);

  @JsonKey(name: 'email')
  final String email;
  @JsonKey(name: 'senha')
  final String senha;
  static const fromJsonFactory = _$PostEntrarReqFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is PostEntrarReq &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.senha, senha) ||
                const DeepCollectionEquality().equals(other.senha, senha)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(senha) ^
      runtimeType.hashCode;
}

extension $PostEntrarReqExtension on PostEntrarReq {
  PostEntrarReq copyWith({String? email, String? senha}) {
    return PostEntrarReq(
      email: email ?? this.email,
      senha: senha ?? this.senha,
    );
  }

  PostEntrarReq copyWithWrapped({
    Wrapped<String>? email,
    Wrapped<String>? senha,
  }) {
    return PostEntrarReq(
      email: (email != null ? email.value : this.email),
      senha: (senha != null ? senha.value : this.senha),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class PostEntrarRes {
  const PostEntrarRes({
    required this.expiresIn,
    required this.messagem,
    required this.token,
  });

  factory PostEntrarRes.fromJson(Map<String, dynamic> json) =>
      _$PostEntrarResFromJson(json);

  static const toJsonFactory = _$PostEntrarResToJson;
  Map<String, dynamic> toJson() => _$PostEntrarResToJson(this);

  @JsonKey(name: 'expires_in')
  final int expiresIn;
  @JsonKey(name: 'messagem')
  final String messagem;
  @JsonKey(name: 'token')
  final String token;
  static const fromJsonFactory = _$PostEntrarResFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is PostEntrarRes &&
            (identical(other.expiresIn, expiresIn) ||
                const DeepCollectionEquality().equals(
                  other.expiresIn,
                  expiresIn,
                )) &&
            (identical(other.messagem, messagem) ||
                const DeepCollectionEquality().equals(
                  other.messagem,
                  messagem,
                )) &&
            (identical(other.token, token) ||
                const DeepCollectionEquality().equals(other.token, token)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(expiresIn) ^
      const DeepCollectionEquality().hash(messagem) ^
      const DeepCollectionEquality().hash(token) ^
      runtimeType.hashCode;
}

extension $PostEntrarResExtension on PostEntrarRes {
  PostEntrarRes copyWith({int? expiresIn, String? messagem, String? token}) {
    return PostEntrarRes(
      expiresIn: expiresIn ?? this.expiresIn,
      messagem: messagem ?? this.messagem,
      token: token ?? this.token,
    );
  }

  PostEntrarRes copyWithWrapped({
    Wrapped<int>? expiresIn,
    Wrapped<String>? messagem,
    Wrapped<String>? token,
  }) {
    return PostEntrarRes(
      expiresIn: (expiresIn != null ? expiresIn.value : this.expiresIn),
      messagem: (messagem != null ? messagem.value : this.messagem),
      token: (token != null ? token.value : this.token),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class PostMutiraoMudancasReq {
  const PostMutiraoMudancasReq({
    this.colaboradores,
    this.condutas,
    this.condutasGenericas,
    this.medicos,
    this.mutirao,
    this.mutiraoCondutas,
    this.pacientes,
    this.procedimentos,
  });

  factory PostMutiraoMudancasReq.fromJson(Map<String, dynamic> json) =>
      _$PostMutiraoMudancasReqFromJson(json);

  static const toJsonFactory = _$PostMutiraoMudancasReqToJson;
  Map<String, dynamic> toJson() => _$PostMutiraoMudancasReqToJson(this);

  @JsonKey(name: 'colaboradores')
  final Map<String, dynamic>? colaboradores;
  @JsonKey(name: 'condutas')
  final Map<String, dynamic>? condutas;
  @JsonKey(name: 'condutasGenericas')
  final Map<String, dynamic>? condutasGenericas;
  @JsonKey(name: 'medicos')
  final Map<String, dynamic>? medicos;
  @JsonKey(name: 'mutirao')
  final MutiraoData? mutirao;
  @JsonKey(name: 'mutiraoCondutas', defaultValue: <String>[])
  final List<String>? mutiraoCondutas;
  @JsonKey(name: 'pacientes')
  final Map<String, dynamic>? pacientes;
  @JsonKey(name: 'procedimentos')
  final Map<String, dynamic>? procedimentos;
  static const fromJsonFactory = _$PostMutiraoMudancasReqFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is PostMutiraoMudancasReq &&
            (identical(other.colaboradores, colaboradores) ||
                const DeepCollectionEquality().equals(
                  other.colaboradores,
                  colaboradores,
                )) &&
            (identical(other.condutas, condutas) ||
                const DeepCollectionEquality().equals(
                  other.condutas,
                  condutas,
                )) &&
            (identical(other.condutasGenericas, condutasGenericas) ||
                const DeepCollectionEquality().equals(
                  other.condutasGenericas,
                  condutasGenericas,
                )) &&
            (identical(other.medicos, medicos) ||
                const DeepCollectionEquality().equals(
                  other.medicos,
                  medicos,
                )) &&
            (identical(other.mutirao, mutirao) ||
                const DeepCollectionEquality().equals(
                  other.mutirao,
                  mutirao,
                )) &&
            (identical(other.mutiraoCondutas, mutiraoCondutas) ||
                const DeepCollectionEquality().equals(
                  other.mutiraoCondutas,
                  mutiraoCondutas,
                )) &&
            (identical(other.pacientes, pacientes) ||
                const DeepCollectionEquality().equals(
                  other.pacientes,
                  pacientes,
                )) &&
            (identical(other.procedimentos, procedimentos) ||
                const DeepCollectionEquality().equals(
                  other.procedimentos,
                  procedimentos,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(colaboradores) ^
      const DeepCollectionEquality().hash(condutas) ^
      const DeepCollectionEquality().hash(condutasGenericas) ^
      const DeepCollectionEquality().hash(medicos) ^
      const DeepCollectionEquality().hash(mutirao) ^
      const DeepCollectionEquality().hash(mutiraoCondutas) ^
      const DeepCollectionEquality().hash(pacientes) ^
      const DeepCollectionEquality().hash(procedimentos) ^
      runtimeType.hashCode;
}

extension $PostMutiraoMudancasReqExtension on PostMutiraoMudancasReq {
  PostMutiraoMudancasReq copyWith({
    Map<String, dynamic>? colaboradores,
    Map<String, dynamic>? condutas,
    Map<String, dynamic>? condutasGenericas,
    Map<String, dynamic>? medicos,
    MutiraoData? mutirao,
    List<String>? mutiraoCondutas,
    Map<String, dynamic>? pacientes,
    Map<String, dynamic>? procedimentos,
  }) {
    return PostMutiraoMudancasReq(
      colaboradores: colaboradores ?? this.colaboradores,
      condutas: condutas ?? this.condutas,
      condutasGenericas: condutasGenericas ?? this.condutasGenericas,
      medicos: medicos ?? this.medicos,
      mutirao: mutirao ?? this.mutirao,
      mutiraoCondutas: mutiraoCondutas ?? this.mutiraoCondutas,
      pacientes: pacientes ?? this.pacientes,
      procedimentos: procedimentos ?? this.procedimentos,
    );
  }

  PostMutiraoMudancasReq copyWithWrapped({
    Wrapped<Map<String, dynamic>?>? colaboradores,
    Wrapped<Map<String, dynamic>?>? condutas,
    Wrapped<Map<String, dynamic>?>? condutasGenericas,
    Wrapped<Map<String, dynamic>?>? medicos,
    Wrapped<MutiraoData?>? mutirao,
    Wrapped<List<String>?>? mutiraoCondutas,
    Wrapped<Map<String, dynamic>?>? pacientes,
    Wrapped<Map<String, dynamic>?>? procedimentos,
  }) {
    return PostMutiraoMudancasReq(
      colaboradores: (colaboradores != null
          ? colaboradores.value
          : this.colaboradores),
      condutas: (condutas != null ? condutas.value : this.condutas),
      condutasGenericas: (condutasGenericas != null
          ? condutasGenericas.value
          : this.condutasGenericas),
      medicos: (medicos != null ? medicos.value : this.medicos),
      mutirao: (mutirao != null ? mutirao.value : this.mutirao),
      mutiraoCondutas: (mutiraoCondutas != null
          ? mutiraoCondutas.value
          : this.mutiraoCondutas),
      pacientes: (pacientes != null ? pacientes.value : this.pacientes),
      procedimentos: (procedimentos != null
          ? procedimentos.value
          : this.procedimentos),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class PostMutiraoMudancasRes {
  const PostMutiraoMudancasRes({
    required this.messagem,
    required this.timestamp,
  });

  factory PostMutiraoMudancasRes.fromJson(Map<String, dynamic> json) =>
      _$PostMutiraoMudancasResFromJson(json);

  static const toJsonFactory = _$PostMutiraoMudancasResToJson;
  Map<String, dynamic> toJson() => _$PostMutiraoMudancasResToJson(this);

  @JsonKey(name: 'messagem')
  final String messagem;
  @JsonKey(name: 'timestamp')
  final int timestamp;
  static const fromJsonFactory = _$PostMutiraoMudancasResFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is PostMutiraoMudancasRes &&
            (identical(other.messagem, messagem) ||
                const DeepCollectionEquality().equals(
                  other.messagem,
                  messagem,
                )) &&
            (identical(other.timestamp, timestamp) ||
                const DeepCollectionEquality().equals(
                  other.timestamp,
                  timestamp,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(messagem) ^
      const DeepCollectionEquality().hash(timestamp) ^
      runtimeType.hashCode;
}

extension $PostMutiraoMudancasResExtension on PostMutiraoMudancasRes {
  PostMutiraoMudancasRes copyWith({String? messagem, int? timestamp}) {
    return PostMutiraoMudancasRes(
      messagem: messagem ?? this.messagem,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  PostMutiraoMudancasRes copyWithWrapped({
    Wrapped<String>? messagem,
    Wrapped<int>? timestamp,
  }) {
    return PostMutiraoMudancasRes(
      messagem: (messagem != null ? messagem.value : this.messagem),
      timestamp: (timestamp != null ? timestamp.value : this.timestamp),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class PostRegistarReq {
  const PostRegistarReq({
    required this.email,
    required this.nome,
    required this.senha,
  });

  factory PostRegistarReq.fromJson(Map<String, dynamic> json) =>
      _$PostRegistarReqFromJson(json);

  static const toJsonFactory = _$PostRegistarReqToJson;
  Map<String, dynamic> toJson() => _$PostRegistarReqToJson(this);

  @JsonKey(name: 'email')
  final String email;
  @JsonKey(name: 'nome')
  final String nome;
  @JsonKey(name: 'senha')
  final String senha;
  static const fromJsonFactory = _$PostRegistarReqFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is PostRegistarReq &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.nome, nome) ||
                const DeepCollectionEquality().equals(other.nome, nome)) &&
            (identical(other.senha, senha) ||
                const DeepCollectionEquality().equals(other.senha, senha)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(nome) ^
      const DeepCollectionEquality().hash(senha) ^
      runtimeType.hashCode;
}

extension $PostRegistarReqExtension on PostRegistarReq {
  PostRegistarReq copyWith({String? email, String? nome, String? senha}) {
    return PostRegistarReq(
      email: email ?? this.email,
      nome: nome ?? this.nome,
      senha: senha ?? this.senha,
    );
  }

  PostRegistarReq copyWithWrapped({
    Wrapped<String>? email,
    Wrapped<String>? nome,
    Wrapped<String>? senha,
  }) {
    return PostRegistarReq(
      email: (email != null ? email.value : this.email),
      nome: (nome != null ? nome.value : this.nome),
      senha: (senha != null ? senha.value : this.senha),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class PostRegistarRes {
  const PostRegistarRes({required this.messagem, required this.usuarioID});

  factory PostRegistarRes.fromJson(Map<String, dynamic> json) =>
      _$PostRegistarResFromJson(json);

  static const toJsonFactory = _$PostRegistarResToJson;
  Map<String, dynamic> toJson() => _$PostRegistarResToJson(this);

  @JsonKey(name: 'messagem')
  final String messagem;
  @JsonKey(name: 'usuarioID')
  final int usuarioID;
  static const fromJsonFactory = _$PostRegistarResFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is PostRegistarRes &&
            (identical(other.messagem, messagem) ||
                const DeepCollectionEquality().equals(
                  other.messagem,
                  messagem,
                )) &&
            (identical(other.usuarioID, usuarioID) ||
                const DeepCollectionEquality().equals(
                  other.usuarioID,
                  usuarioID,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(messagem) ^
      const DeepCollectionEquality().hash(usuarioID) ^
      runtimeType.hashCode;
}

extension $PostRegistarResExtension on PostRegistarRes {
  PostRegistarRes copyWith({String? messagem, int? usuarioID}) {
    return PostRegistarRes(
      messagem: messagem ?? this.messagem,
      usuarioID: usuarioID ?? this.usuarioID,
    );
  }

  PostRegistarRes copyWithWrapped({
    Wrapped<String>? messagem,
    Wrapped<int>? usuarioID,
  }) {
    return PostRegistarRes(
      messagem: (messagem != null ? messagem.value : this.messagem),
      usuarioID: (usuarioID != null ? usuarioID.value : this.usuarioID),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Procedimento {
  const Procedimento({
    required this.atualizadoEm,
    this.data,
    this.dioptriaLente,
    this.intercorrencia,
    this.medicoId,
    this.observacao,
    this.olho,
    required this.pacienteId,
    required this.status,
    this.tipo,
  });

  factory Procedimento.fromJson(Map<String, dynamic> json) =>
      _$ProcedimentoFromJson(json);

  static const toJsonFactory = _$ProcedimentoToJson;
  Map<String, dynamic> toJson() => _$ProcedimentoToJson(this);

  @JsonKey(name: 'atualizado_em')
  final int atualizadoEm;
  @JsonKey(name: 'data')
  final String? data;
  @JsonKey(name: 'dioptriaLente')
  final String? dioptriaLente;
  @JsonKey(name: 'intercorrencia')
  final String? intercorrencia;
  @JsonKey(name: 'medicoId')
  final int? medicoId;
  @JsonKey(name: 'observacao')
  final String? observacao;
  @JsonKey(name: 'olho')
  final String? olho;
  @JsonKey(name: 'pacienteId')
  final int pacienteId;
  @JsonKey(name: 'status')
  final int status;
  @JsonKey(name: 'tipo')
  final String? tipo;
  static const fromJsonFactory = _$ProcedimentoFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Procedimento &&
            (identical(other.atualizadoEm, atualizadoEm) ||
                const DeepCollectionEquality().equals(
                  other.atualizadoEm,
                  atualizadoEm,
                )) &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.dioptriaLente, dioptriaLente) ||
                const DeepCollectionEquality().equals(
                  other.dioptriaLente,
                  dioptriaLente,
                )) &&
            (identical(other.intercorrencia, intercorrencia) ||
                const DeepCollectionEquality().equals(
                  other.intercorrencia,
                  intercorrencia,
                )) &&
            (identical(other.medicoId, medicoId) ||
                const DeepCollectionEquality().equals(
                  other.medicoId,
                  medicoId,
                )) &&
            (identical(other.observacao, observacao) ||
                const DeepCollectionEquality().equals(
                  other.observacao,
                  observacao,
                )) &&
            (identical(other.olho, olho) ||
                const DeepCollectionEquality().equals(other.olho, olho)) &&
            (identical(other.pacienteId, pacienteId) ||
                const DeepCollectionEquality().equals(
                  other.pacienteId,
                  pacienteId,
                )) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.tipo, tipo) ||
                const DeepCollectionEquality().equals(other.tipo, tipo)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(atualizadoEm) ^
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(dioptriaLente) ^
      const DeepCollectionEquality().hash(intercorrencia) ^
      const DeepCollectionEquality().hash(medicoId) ^
      const DeepCollectionEquality().hash(observacao) ^
      const DeepCollectionEquality().hash(olho) ^
      const DeepCollectionEquality().hash(pacienteId) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(tipo) ^
      runtimeType.hashCode;
}

extension $ProcedimentoExtension on Procedimento {
  Procedimento copyWith({
    int? atualizadoEm,
    String? data,
    String? dioptriaLente,
    String? intercorrencia,
    int? medicoId,
    String? observacao,
    String? olho,
    int? pacienteId,
    int? status,
    String? tipo,
  }) {
    return Procedimento(
      atualizadoEm: atualizadoEm ?? this.atualizadoEm,
      data: data ?? this.data,
      dioptriaLente: dioptriaLente ?? this.dioptriaLente,
      intercorrencia: intercorrencia ?? this.intercorrencia,
      medicoId: medicoId ?? this.medicoId,
      observacao: observacao ?? this.observacao,
      olho: olho ?? this.olho,
      pacienteId: pacienteId ?? this.pacienteId,
      status: status ?? this.status,
      tipo: tipo ?? this.tipo,
    );
  }

  Procedimento copyWithWrapped({
    Wrapped<int>? atualizadoEm,
    Wrapped<String?>? data,
    Wrapped<String?>? dioptriaLente,
    Wrapped<String?>? intercorrencia,
    Wrapped<int?>? medicoId,
    Wrapped<String?>? observacao,
    Wrapped<String?>? olho,
    Wrapped<int>? pacienteId,
    Wrapped<int>? status,
    Wrapped<String?>? tipo,
  }) {
    return Procedimento(
      atualizadoEm: (atualizadoEm != null
          ? atualizadoEm.value
          : this.atualizadoEm),
      data: (data != null ? data.value : this.data),
      dioptriaLente: (dioptriaLente != null
          ? dioptriaLente.value
          : this.dioptriaLente),
      intercorrencia: (intercorrencia != null
          ? intercorrencia.value
          : this.intercorrencia),
      medicoId: (medicoId != null ? medicoId.value : this.medicoId),
      observacao: (observacao != null ? observacao.value : this.observacao),
      olho: (olho != null ? olho.value : this.olho),
      pacienteId: (pacienteId != null ? pacienteId.value : this.pacienteId),
      status: (status != null ? status.value : this.status),
      tipo: (tipo != null ? tipo.value : this.tipo),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class PutMutiraoPermissoesReq {
  const PutMutiraoPermissoesReq();

  factory PutMutiraoPermissoesReq.fromJson(Map<String, dynamic> json) =>
      _$PutMutiraoPermissoesReqFromJson(json);

  static const toJsonFactory = _$PutMutiraoPermissoesReqToJson;
  Map<String, dynamic> toJson() => _$PutMutiraoPermissoesReqToJson(this);

  static const fromJsonFactory = _$PutMutiraoPermissoesReqFromJson;

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode => runtimeType.hashCode;
}

@JsonSerializable(explicitToJson: true)
class PutMutiraoPermissoesRes {
  const PutMutiraoPermissoesRes({
    required this.messagem,
    required this.timestamp,
  });

  factory PutMutiraoPermissoesRes.fromJson(Map<String, dynamic> json) =>
      _$PutMutiraoPermissoesResFromJson(json);

  static const toJsonFactory = _$PutMutiraoPermissoesResToJson;
  Map<String, dynamic> toJson() => _$PutMutiraoPermissoesResToJson(this);

  @JsonKey(name: 'messagem')
  final String messagem;
  @JsonKey(name: 'timestamp')
  final int timestamp;
  static const fromJsonFactory = _$PutMutiraoPermissoesResFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is PutMutiraoPermissoesRes &&
            (identical(other.messagem, messagem) ||
                const DeepCollectionEquality().equals(
                  other.messagem,
                  messagem,
                )) &&
            (identical(other.timestamp, timestamp) ||
                const DeepCollectionEquality().equals(
                  other.timestamp,
                  timestamp,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(messagem) ^
      const DeepCollectionEquality().hash(timestamp) ^
      runtimeType.hashCode;
}

extension $PutMutiraoPermissoesResExtension on PutMutiraoPermissoesRes {
  PutMutiraoPermissoesRes copyWith({String? messagem, int? timestamp}) {
    return PutMutiraoPermissoesRes(
      messagem: messagem ?? this.messagem,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  PutMutiraoPermissoesRes copyWithWrapped({
    Wrapped<String>? messagem,
    Wrapped<int>? timestamp,
  }) {
    return PutMutiraoPermissoesRes(
      messagem: (messagem != null ? messagem.value : this.messagem),
      timestamp: (timestamp != null ? timestamp.value : this.timestamp),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class SafeUsuario {
  const SafeUsuario({
    required this.email,
    required this.id,
    required this.nome,
  });

  factory SafeUsuario.fromJson(Map<String, dynamic> json) =>
      _$SafeUsuarioFromJson(json);

  static const toJsonFactory = _$SafeUsuarioToJson;
  Map<String, dynamic> toJson() => _$SafeUsuarioToJson(this);

  @JsonKey(name: 'email')
  final String email;
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'nome')
  final String nome;
  static const fromJsonFactory = _$SafeUsuarioFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is SafeUsuario &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.nome, nome) ||
                const DeepCollectionEquality().equals(other.nome, nome)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(nome) ^
      runtimeType.hashCode;
}

extension $SafeUsuarioExtension on SafeUsuario {
  SafeUsuario copyWith({String? email, int? id, String? nome}) {
    return SafeUsuario(
      email: email ?? this.email,
      id: id ?? this.id,
      nome: nome ?? this.nome,
    );
  }

  SafeUsuario copyWithWrapped({
    Wrapped<String>? email,
    Wrapped<int>? id,
    Wrapped<String>? nome,
  }) {
    return SafeUsuario(
      email: (email != null ? email.value : this.email),
      id: (id != null ? id.value : this.id),
      nome: (nome != null ? nome.value : this.nome),
    );
  }
}

String? permissaoNullableToJson(enums.Permissao? permissao) {
  return permissao?.value;
}

String? permissaoToJson(enums.Permissao permissao) {
  return permissao.value;
}

enums.Permissao permissaoFromJson(
  Object? permissao, [
  enums.Permissao? defaultValue,
]) {
  return enums.Permissao.values.firstWhereOrNull((e) => e.value == permissao) ??
      defaultValue ??
      enums.Permissao.swaggerGeneratedUnknown;
}

enums.Permissao? permissaoNullableFromJson(
  Object? permissao, [
  enums.Permissao? defaultValue,
]) {
  if (permissao == null) {
    return null;
  }
  return enums.Permissao.values.firstWhereOrNull((e) => e.value == permissao) ??
      defaultValue;
}

String permissaoExplodedListToJson(List<enums.Permissao>? permissao) {
  return permissao?.map((e) => e.value!).join(',') ?? '';
}

List<String> permissaoListToJson(List<enums.Permissao>? permissao) {
  if (permissao == null) {
    return [];
  }

  return permissao.map((e) => e.value!).toList();
}

List<enums.Permissao> permissaoListFromJson(
  List? permissao, [
  List<enums.Permissao>? defaultValue,
]) {
  if (permissao == null) {
    return defaultValue ?? [];
  }

  return permissao.map((e) => permissaoFromJson(e.toString())).toList();
}

List<enums.Permissao>? permissaoNullableListFromJson(
  List? permissao, [
  List<enums.Permissao>? defaultValue,
]) {
  if (permissao == null) {
    return defaultValue;
  }

  return permissao.map((e) => permissaoFromJson(e.toString())).toList();
}

// ignore: unused_element
String? _dateToJson(DateTime? date) {
  if (date == null) {
    return null;
  }

  final year = date.year.toString();
  final month = date.month < 10 ? '0${date.month}' : date.month.toString();
  final day = date.day < 10 ? '0${date.day}' : date.day.toString();

  return '$year-$month-$day';
}

class Wrapped<T> {
  final T value;
  const Wrapped.value(this.value);
}
