// coverage:ignore-file
// ignore_for_file: type=lint

import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';
import 'dart:convert';

import 'sigmus_api.enums.swagger.dart' as enums;

part 'sigmus_api.models.swagger.g.dart';

@JsonSerializable(explicitToJson: true)
class EntitysColaboradorUpdate {
  const EntitysColaboradorUpdate({
    this.atualizadoEm,
    this.funcao,
    this.nome,
    this.status,
  });

  factory EntitysColaboradorUpdate.fromJson(Map<String, dynamic> json) =>
      _$EntitysColaboradorUpdateFromJson(json);

  static const toJsonFactory = _$EntitysColaboradorUpdateToJson;
  Map<String, dynamic> toJson() => _$EntitysColaboradorUpdateToJson(this);

  @JsonKey(name: 'atualizado_em')
  final int? atualizadoEm;
  @JsonKey(name: 'funcao')
  final String? funcao;
  @JsonKey(name: 'nome')
  final String? nome;
  @JsonKey(name: 'status')
  final int? status;
  static const fromJsonFactory = _$EntitysColaboradorUpdateFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is EntitysColaboradorUpdate &&
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

extension $EntitysColaboradorUpdateExtension on EntitysColaboradorUpdate {
  EntitysColaboradorUpdate copyWith({
    int? atualizadoEm,
    String? funcao,
    String? nome,
    int? status,
  }) {
    return EntitysColaboradorUpdate(
      atualizadoEm: atualizadoEm ?? this.atualizadoEm,
      funcao: funcao ?? this.funcao,
      nome: nome ?? this.nome,
      status: status ?? this.status,
    );
  }

  EntitysColaboradorUpdate copyWithWrapped({
    Wrapped<int?>? atualizadoEm,
    Wrapped<String?>? funcao,
    Wrapped<String?>? nome,
    Wrapped<int?>? status,
  }) {
    return EntitysColaboradorUpdate(
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
class EntitysCondutaGenericaUpdate {
  const EntitysCondutaGenericaUpdate({
    this.atualizadoEm,
    this.conduta,
    this.data,
    this.medicoId,
    this.pacienteId,
    this.status,
  });

  factory EntitysCondutaGenericaUpdate.fromJson(Map<String, dynamic> json) =>
      _$EntitysCondutaGenericaUpdateFromJson(json);

  static const toJsonFactory = _$EntitysCondutaGenericaUpdateToJson;
  Map<String, dynamic> toJson() => _$EntitysCondutaGenericaUpdateToJson(this);

  @JsonKey(name: 'atualizado_em')
  final int? atualizadoEm;
  @JsonKey(name: 'conduta')
  final String? conduta;
  @JsonKey(name: 'data')
  final String? data;
  @JsonKey(name: 'medicoId')
  final int? medicoId;
  @JsonKey(name: 'pacienteId')
  final int? pacienteId;
  @JsonKey(name: 'status')
  final int? status;
  static const fromJsonFactory = _$EntitysCondutaGenericaUpdateFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is EntitysCondutaGenericaUpdate &&
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

extension $EntitysCondutaGenericaUpdateExtension
    on EntitysCondutaGenericaUpdate {
  EntitysCondutaGenericaUpdate copyWith({
    int? atualizadoEm,
    String? conduta,
    String? data,
    int? medicoId,
    int? pacienteId,
    int? status,
  }) {
    return EntitysCondutaGenericaUpdate(
      atualizadoEm: atualizadoEm ?? this.atualizadoEm,
      conduta: conduta ?? this.conduta,
      data: data ?? this.data,
      medicoId: medicoId ?? this.medicoId,
      pacienteId: pacienteId ?? this.pacienteId,
      status: status ?? this.status,
    );
  }

  EntitysCondutaGenericaUpdate copyWithWrapped({
    Wrapped<int?>? atualizadoEm,
    Wrapped<String?>? conduta,
    Wrapped<String?>? data,
    Wrapped<int?>? medicoId,
    Wrapped<int?>? pacienteId,
    Wrapped<int?>? status,
  }) {
    return EntitysCondutaGenericaUpdate(
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
class EntitysCondutaUpdate {
  const EntitysCondutaUpdate({
    this.atualizadoEm,
    this.dados,
    this.data,
    this.medicoId,
    this.pacienteId,
    this.status,
    this.tipo,
  });

  factory EntitysCondutaUpdate.fromJson(Map<String, dynamic> json) =>
      _$EntitysCondutaUpdateFromJson(json);

  static const toJsonFactory = _$EntitysCondutaUpdateToJson;
  Map<String, dynamic> toJson() => _$EntitysCondutaUpdateToJson(this);

  @JsonKey(name: 'atualizado_em')
  final int? atualizadoEm;
  @JsonKey(name: 'dados')
  final Map<String, dynamic>? dados;
  @JsonKey(name: 'data')
  final String? data;
  @JsonKey(name: 'medicoId')
  final int? medicoId;
  @JsonKey(name: 'pacienteId')
  final int? pacienteId;
  @JsonKey(name: 'status')
  final int? status;
  @JsonKey(name: 'tipo')
  final String? tipo;
  static const fromJsonFactory = _$EntitysCondutaUpdateFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is EntitysCondutaUpdate &&
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

extension $EntitysCondutaUpdateExtension on EntitysCondutaUpdate {
  EntitysCondutaUpdate copyWith({
    int? atualizadoEm,
    Map<String, dynamic>? dados,
    String? data,
    int? medicoId,
    int? pacienteId,
    int? status,
    String? tipo,
  }) {
    return EntitysCondutaUpdate(
      atualizadoEm: atualizadoEm ?? this.atualizadoEm,
      dados: dados ?? this.dados,
      data: data ?? this.data,
      medicoId: medicoId ?? this.medicoId,
      pacienteId: pacienteId ?? this.pacienteId,
      status: status ?? this.status,
      tipo: tipo ?? this.tipo,
    );
  }

  EntitysCondutaUpdate copyWithWrapped({
    Wrapped<int?>? atualizadoEm,
    Wrapped<Map<String, dynamic>?>? dados,
    Wrapped<String?>? data,
    Wrapped<int?>? medicoId,
    Wrapped<int?>? pacienteId,
    Wrapped<int?>? status,
    Wrapped<String?>? tipo,
  }) {
    return EntitysCondutaUpdate(
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
class EntitysErrorMessage {
  const EntitysErrorMessage({this.error, this.messagem});

  factory EntitysErrorMessage.fromJson(Map<String, dynamic> json) =>
      _$EntitysErrorMessageFromJson(json);

  static const toJsonFactory = _$EntitysErrorMessageToJson;
  Map<String, dynamic> toJson() => _$EntitysErrorMessageToJson(this);

  @JsonKey(name: 'error')
  final String? error;
  @JsonKey(name: 'messagem')
  final String? messagem;
  static const fromJsonFactory = _$EntitysErrorMessageFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is EntitysErrorMessage &&
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

extension $EntitysErrorMessageExtension on EntitysErrorMessage {
  EntitysErrorMessage copyWith({String? error, String? messagem}) {
    return EntitysErrorMessage(
      error: error ?? this.error,
      messagem: messagem ?? this.messagem,
    );
  }

  EntitysErrorMessage copyWithWrapped({
    Wrapped<String?>? error,
    Wrapped<String?>? messagem,
  }) {
    return EntitysErrorMessage(
      error: (error != null ? error.value : this.error),
      messagem: (messagem != null ? messagem.value : this.messagem),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class EntitysMedicoUpdate {
  const EntitysMedicoUpdate({
    this.atualizadoEm,
    this.crm,
    this.nome,
    this.status,
  });

  factory EntitysMedicoUpdate.fromJson(Map<String, dynamic> json) =>
      _$EntitysMedicoUpdateFromJson(json);

  static const toJsonFactory = _$EntitysMedicoUpdateToJson;
  Map<String, dynamic> toJson() => _$EntitysMedicoUpdateToJson(this);

  @JsonKey(name: 'atualizado_em')
  final int? atualizadoEm;
  @JsonKey(name: 'crm')
  final String? crm;
  @JsonKey(name: 'nome')
  final String? nome;
  @JsonKey(name: 'status')
  final int? status;
  static const fromJsonFactory = _$EntitysMedicoUpdateFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is EntitysMedicoUpdate &&
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

extension $EntitysMedicoUpdateExtension on EntitysMedicoUpdate {
  EntitysMedicoUpdate copyWith({
    int? atualizadoEm,
    String? crm,
    String? nome,
    int? status,
  }) {
    return EntitysMedicoUpdate(
      atualizadoEm: atualizadoEm ?? this.atualizadoEm,
      crm: crm ?? this.crm,
      nome: nome ?? this.nome,
      status: status ?? this.status,
    );
  }

  EntitysMedicoUpdate copyWithWrapped({
    Wrapped<int?>? atualizadoEm,
    Wrapped<String?>? crm,
    Wrapped<String?>? nome,
    Wrapped<int?>? status,
  }) {
    return EntitysMedicoUpdate(
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
class EntitysMutiraoData {
  const EntitysMutiraoData({
    this.atualizadoEm,
    this.contratante,
    this.dataFinal,
    this.dataInicio,
    this.demandante,
    this.estado,
    this.id,
    this.local,
    this.municipio,
    this.permissoes,
    this.status,
    this.tipo,
  });

  factory EntitysMutiraoData.fromJson(Map<String, dynamic> json) =>
      _$EntitysMutiraoDataFromJson(json);

  static const toJsonFactory = _$EntitysMutiraoDataToJson;
  Map<String, dynamic> toJson() => _$EntitysMutiraoDataToJson(this);

  @JsonKey(name: 'atualizado_em')
  final int? atualizadoEm;
  @JsonKey(name: 'contratante')
  final String? contratante;
  @JsonKey(name: 'data_final')
  final String? dataFinal;
  @JsonKey(name: 'data_inicio')
  final String? dataInicio;
  @JsonKey(name: 'demandante')
  final String? demandante;
  @JsonKey(name: 'estado')
  final String? estado;
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'local')
  final String? local;
  @JsonKey(name: 'municipio')
  final String? municipio;
  @JsonKey(name: 'permissoes')
  final Map<String, dynamic>? permissoes;
  @JsonKey(name: 'status')
  final int? status;
  @JsonKey(name: 'tipo')
  final String? tipo;
  static const fromJsonFactory = _$EntitysMutiraoDataFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is EntitysMutiraoData &&
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

extension $EntitysMutiraoDataExtension on EntitysMutiraoData {
  EntitysMutiraoData copyWith({
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
    return EntitysMutiraoData(
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

  EntitysMutiraoData copyWithWrapped({
    Wrapped<int?>? atualizadoEm,
    Wrapped<String?>? contratante,
    Wrapped<String?>? dataFinal,
    Wrapped<String?>? dataInicio,
    Wrapped<String?>? demandante,
    Wrapped<String?>? estado,
    Wrapped<int?>? id,
    Wrapped<String?>? local,
    Wrapped<String?>? municipio,
    Wrapped<Map<String, dynamic>?>? permissoes,
    Wrapped<int?>? status,
    Wrapped<String?>? tipo,
  }) {
    return EntitysMutiraoData(
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
class EntitysMutiraoMudancas {
  const EntitysMutiraoMudancas({
    this.colaboradores,
    this.condutas,
    this.condutasGenericas,
    this.medicos,
    this.mutiraoCondutas,
    this.pacientes,
    this.procedimentos,
  });

  factory EntitysMutiraoMudancas.fromJson(Map<String, dynamic> json) =>
      _$EntitysMutiraoMudancasFromJson(json);

  static const toJsonFactory = _$EntitysMutiraoMudancasToJson;
  Map<String, dynamic> toJson() => _$EntitysMutiraoMudancasToJson(this);

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
  static const fromJsonFactory = _$EntitysMutiraoMudancasFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is EntitysMutiraoMudancas &&
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

extension $EntitysMutiraoMudancasExtension on EntitysMutiraoMudancas {
  EntitysMutiraoMudancas copyWith({
    Map<String, dynamic>? colaboradores,
    Map<String, dynamic>? condutas,
    Map<String, dynamic>? condutasGenericas,
    Map<String, dynamic>? medicos,
    List<String>? mutiraoCondutas,
    Map<String, dynamic>? pacientes,
    Map<String, dynamic>? procedimentos,
  }) {
    return EntitysMutiraoMudancas(
      colaboradores: colaboradores ?? this.colaboradores,
      condutas: condutas ?? this.condutas,
      condutasGenericas: condutasGenericas ?? this.condutasGenericas,
      medicos: medicos ?? this.medicos,
      mutiraoCondutas: mutiraoCondutas ?? this.mutiraoCondutas,
      pacientes: pacientes ?? this.pacientes,
      procedimentos: procedimentos ?? this.procedimentos,
    );
  }

  EntitysMutiraoMudancas copyWithWrapped({
    Wrapped<Map<String, dynamic>?>? colaboradores,
    Wrapped<Map<String, dynamic>?>? condutas,
    Wrapped<Map<String, dynamic>?>? condutasGenericas,
    Wrapped<Map<String, dynamic>?>? medicos,
    Wrapped<List<String>?>? mutiraoCondutas,
    Wrapped<Map<String, dynamic>?>? pacientes,
    Wrapped<Map<String, dynamic>?>? procedimentos,
  }) {
    return EntitysMutiraoMudancas(
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
class EntitysPacienteUpdate {
  const EntitysPacienteUpdate({
    this.atualizadoEm,
    this.cns,
    this.cpf,
    this.dataNascimento,
    this.endereco,
    this.municipio,
    this.nome,
    this.nomeDaMae,
    this.status,
    this.tel,
    this.uf,
  });

  factory EntitysPacienteUpdate.fromJson(Map<String, dynamic> json) =>
      _$EntitysPacienteUpdateFromJson(json);

  static const toJsonFactory = _$EntitysPacienteUpdateToJson;
  Map<String, dynamic> toJson() => _$EntitysPacienteUpdateToJson(this);

  @JsonKey(name: 'atualizado_em')
  final int? atualizadoEm;
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
  final int? status;
  @JsonKey(name: 'tel')
  final String? tel;
  @JsonKey(name: 'uf')
  final String? uf;
  static const fromJsonFactory = _$EntitysPacienteUpdateFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is EntitysPacienteUpdate &&
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

extension $EntitysPacienteUpdateExtension on EntitysPacienteUpdate {
  EntitysPacienteUpdate copyWith({
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
    return EntitysPacienteUpdate(
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

  EntitysPacienteUpdate copyWithWrapped({
    Wrapped<int?>? atualizadoEm,
    Wrapped<String?>? cns,
    Wrapped<String?>? cpf,
    Wrapped<String?>? dataNascimento,
    Wrapped<String?>? endereco,
    Wrapped<String?>? municipio,
    Wrapped<String?>? nome,
    Wrapped<String?>? nomeDaMae,
    Wrapped<int?>? status,
    Wrapped<String?>? tel,
    Wrapped<String?>? uf,
  }) {
    return EntitysPacienteUpdate(
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
class EntitysPersonData {
  const EntitysPersonData({
    this.cns,
    this.cpf,
    this.dataNascimento,
    this.endereco,
    this.nome,
    this.nomeMae,
    this.tel,
  });

  factory EntitysPersonData.fromJson(Map<String, dynamic> json) =>
      _$EntitysPersonDataFromJson(json);

  static const toJsonFactory = _$EntitysPersonDataToJson;
  Map<String, dynamic> toJson() => _$EntitysPersonDataToJson(this);

  @JsonKey(name: 'cns')
  final String? cns;
  @JsonKey(name: 'cpf')
  final String? cpf;
  @JsonKey(name: 'dataNascimento')
  final String? dataNascimento;
  @JsonKey(name: 'endereco')
  final String? endereco;
  @JsonKey(name: 'nome')
  final String? nome;
  @JsonKey(name: 'nomeMae')
  final String? nomeMae;
  @JsonKey(name: 'tel')
  final String? tel;
  static const fromJsonFactory = _$EntitysPersonDataFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is EntitysPersonData &&
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

extension $EntitysPersonDataExtension on EntitysPersonData {
  EntitysPersonData copyWith({
    String? cns,
    String? cpf,
    String? dataNascimento,
    String? endereco,
    String? nome,
    String? nomeMae,
    String? tel,
  }) {
    return EntitysPersonData(
      cns: cns ?? this.cns,
      cpf: cpf ?? this.cpf,
      dataNascimento: dataNascimento ?? this.dataNascimento,
      endereco: endereco ?? this.endereco,
      nome: nome ?? this.nome,
      nomeMae: nomeMae ?? this.nomeMae,
      tel: tel ?? this.tel,
    );
  }

  EntitysPersonData copyWithWrapped({
    Wrapped<String?>? cns,
    Wrapped<String?>? cpf,
    Wrapped<String?>? dataNascimento,
    Wrapped<String?>? endereco,
    Wrapped<String?>? nome,
    Wrapped<String?>? nomeMae,
    Wrapped<String?>? tel,
  }) {
    return EntitysPersonData(
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
class EntitysProcedimentoUpdate {
  const EntitysProcedimentoUpdate({
    this.atualizadoEm,
    this.data,
    this.dioptriaLente,
    this.intercorrencia,
    this.medicoId,
    this.observacao,
    this.olho,
    this.pacienteId,
    this.status,
    this.tipo,
  });

  factory EntitysProcedimentoUpdate.fromJson(Map<String, dynamic> json) =>
      _$EntitysProcedimentoUpdateFromJson(json);

  static const toJsonFactory = _$EntitysProcedimentoUpdateToJson;
  Map<String, dynamic> toJson() => _$EntitysProcedimentoUpdateToJson(this);

  @JsonKey(name: 'atualizado_em')
  final int? atualizadoEm;
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
  final int? pacienteId;
  @JsonKey(name: 'status')
  final int? status;
  @JsonKey(name: 'tipo')
  final String? tipo;
  static const fromJsonFactory = _$EntitysProcedimentoUpdateFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is EntitysProcedimentoUpdate &&
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

extension $EntitysProcedimentoUpdateExtension on EntitysProcedimentoUpdate {
  EntitysProcedimentoUpdate copyWith({
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
    return EntitysProcedimentoUpdate(
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

  EntitysProcedimentoUpdate copyWithWrapped({
    Wrapped<int?>? atualizadoEm,
    Wrapped<String?>? data,
    Wrapped<String?>? dioptriaLente,
    Wrapped<String?>? intercorrencia,
    Wrapped<int?>? medicoId,
    Wrapped<String?>? observacao,
    Wrapped<String?>? olho,
    Wrapped<int?>? pacienteId,
    Wrapped<int?>? status,
    Wrapped<String?>? tipo,
  }) {
    return EntitysProcedimentoUpdate(
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
class HandlersDelUserRes {
  const HandlersDelUserRes({this.messagem});

  factory HandlersDelUserRes.fromJson(Map<String, dynamic> json) =>
      _$HandlersDelUserResFromJson(json);

  static const toJsonFactory = _$HandlersDelUserResToJson;
  Map<String, dynamic> toJson() => _$HandlersDelUserResToJson(this);

  @JsonKey(name: 'messagem')
  final String? messagem;
  static const fromJsonFactory = _$HandlersDelUserResFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is HandlersDelUserRes &&
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

extension $HandlersDelUserResExtension on HandlersDelUserRes {
  HandlersDelUserRes copyWith({String? messagem}) {
    return HandlersDelUserRes(messagem: messagem ?? this.messagem);
  }

  HandlersDelUserRes copyWithWrapped({Wrapped<String?>? messagem}) {
    return HandlersDelUserRes(
      messagem: (messagem != null ? messagem.value : this.messagem),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class HandlersGetAtualizarTokenRes {
  const HandlersGetAtualizarTokenRes({
    this.expiresIn,
    this.messagem,
    this.token,
  });

  factory HandlersGetAtualizarTokenRes.fromJson(Map<String, dynamic> json) =>
      _$HandlersGetAtualizarTokenResFromJson(json);

  static const toJsonFactory = _$HandlersGetAtualizarTokenResToJson;
  Map<String, dynamic> toJson() => _$HandlersGetAtualizarTokenResToJson(this);

  @JsonKey(name: 'expires_in')
  final int? expiresIn;
  @JsonKey(name: 'messagem')
  final String? messagem;
  @JsonKey(name: 'token')
  final String? token;
  static const fromJsonFactory = _$HandlersGetAtualizarTokenResFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is HandlersGetAtualizarTokenRes &&
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

extension $HandlersGetAtualizarTokenResExtension
    on HandlersGetAtualizarTokenRes {
  HandlersGetAtualizarTokenRes copyWith({
    int? expiresIn,
    String? messagem,
    String? token,
  }) {
    return HandlersGetAtualizarTokenRes(
      expiresIn: expiresIn ?? this.expiresIn,
      messagem: messagem ?? this.messagem,
      token: token ?? this.token,
    );
  }

  HandlersGetAtualizarTokenRes copyWithWrapped({
    Wrapped<int?>? expiresIn,
    Wrapped<String?>? messagem,
    Wrapped<String?>? token,
  }) {
    return HandlersGetAtualizarTokenRes(
      expiresIn: (expiresIn != null ? expiresIn.value : this.expiresIn),
      messagem: (messagem != null ? messagem.value : this.messagem),
      token: (token != null ? token.value : this.token),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class HandlersGetMutiraoMudancasRes {
  const HandlersGetMutiraoMudancasRes({
    this.messagem,
    this.mudancas,
    this.mutirao,
    this.timestamp,
  });

  factory HandlersGetMutiraoMudancasRes.fromJson(Map<String, dynamic> json) =>
      _$HandlersGetMutiraoMudancasResFromJson(json);

  static const toJsonFactory = _$HandlersGetMutiraoMudancasResToJson;
  Map<String, dynamic> toJson() => _$HandlersGetMutiraoMudancasResToJson(this);

  @JsonKey(name: 'messagem')
  final String? messagem;
  @JsonKey(name: 'mudancas')
  final EntitysMutiraoMudancas? mudancas;
  @JsonKey(name: 'mutirao')
  final EntitysMutiraoData? mutirao;
  @JsonKey(name: 'timestamp')
  final int? timestamp;
  static const fromJsonFactory = _$HandlersGetMutiraoMudancasResFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is HandlersGetMutiraoMudancasRes &&
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

extension $HandlersGetMutiraoMudancasResExtension
    on HandlersGetMutiraoMudancasRes {
  HandlersGetMutiraoMudancasRes copyWith({
    String? messagem,
    EntitysMutiraoMudancas? mudancas,
    EntitysMutiraoData? mutirao,
    int? timestamp,
  }) {
    return HandlersGetMutiraoMudancasRes(
      messagem: messagem ?? this.messagem,
      mudancas: mudancas ?? this.mudancas,
      mutirao: mutirao ?? this.mutirao,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  HandlersGetMutiraoMudancasRes copyWithWrapped({
    Wrapped<String?>? messagem,
    Wrapped<EntitysMutiraoMudancas?>? mudancas,
    Wrapped<EntitysMutiraoData?>? mutirao,
    Wrapped<int?>? timestamp,
  }) {
    return HandlersGetMutiraoMudancasRes(
      messagem: (messagem != null ? messagem.value : this.messagem),
      mudancas: (mudancas != null ? mudancas.value : this.mudancas),
      mutirao: (mutirao != null ? mutirao.value : this.mutirao),
      timestamp: (timestamp != null ? timestamp.value : this.timestamp),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class HandlersGetUsuarioMutiroesRes {
  const HandlersGetUsuarioMutiroesRes({this.messagem, this.mutiroes});

  factory HandlersGetUsuarioMutiroesRes.fromJson(Map<String, dynamic> json) =>
      _$HandlersGetUsuarioMutiroesResFromJson(json);

  static const toJsonFactory = _$HandlersGetUsuarioMutiroesResToJson;
  Map<String, dynamic> toJson() => _$HandlersGetUsuarioMutiroesResToJson(this);

  @JsonKey(name: 'messagem')
  final String? messagem;
  @JsonKey(name: 'mutiroes', defaultValue: <HandlersMutiraoInfo>[])
  final List<HandlersMutiraoInfo>? mutiroes;
  static const fromJsonFactory = _$HandlersGetUsuarioMutiroesResFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is HandlersGetUsuarioMutiroesRes &&
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

extension $HandlersGetUsuarioMutiroesResExtension
    on HandlersGetUsuarioMutiroesRes {
  HandlersGetUsuarioMutiroesRes copyWith({
    String? messagem,
    List<HandlersMutiraoInfo>? mutiroes,
  }) {
    return HandlersGetUsuarioMutiroesRes(
      messagem: messagem ?? this.messagem,
      mutiroes: mutiroes ?? this.mutiroes,
    );
  }

  HandlersGetUsuarioMutiroesRes copyWithWrapped({
    Wrapped<String?>? messagem,
    Wrapped<List<HandlersMutiraoInfo>?>? mutiroes,
  }) {
    return HandlersGetUsuarioMutiroesRes(
      messagem: (messagem != null ? messagem.value : this.messagem),
      mutiroes: (mutiroes != null ? mutiroes.value : this.mutiroes),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class HandlersMutiraoInfo {
  const HandlersMutiraoInfo({
    this.atualizadoEm,
    this.contratante,
    this.dataFinal,
    this.dataInicio,
    this.demandante,
    this.estado,
    this.id,
    this.local,
    this.municipio,
    this.permissoes,
    this.status,
    this.tipo,
    this.ultimaMudanca,
  });

  factory HandlersMutiraoInfo.fromJson(Map<String, dynamic> json) =>
      _$HandlersMutiraoInfoFromJson(json);

  static const toJsonFactory = _$HandlersMutiraoInfoToJson;
  Map<String, dynamic> toJson() => _$HandlersMutiraoInfoToJson(this);

  @JsonKey(name: 'atualizado_em')
  final int? atualizadoEm;
  @JsonKey(name: 'contratante')
  final String? contratante;
  @JsonKey(name: 'data_final')
  final String? dataFinal;
  @JsonKey(name: 'data_inicio')
  final String? dataInicio;
  @JsonKey(name: 'demandante')
  final String? demandante;
  @JsonKey(name: 'estado')
  final String? estado;
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'local')
  final String? local;
  @JsonKey(name: 'municipio')
  final String? municipio;
  @JsonKey(name: 'permissoes')
  final Map<String, dynamic>? permissoes;
  @JsonKey(name: 'status')
  final int? status;
  @JsonKey(name: 'tipo')
  final String? tipo;
  @JsonKey(name: 'ultima_mudanca')
  final int? ultimaMudanca;
  static const fromJsonFactory = _$HandlersMutiraoInfoFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is HandlersMutiraoInfo &&
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

extension $HandlersMutiraoInfoExtension on HandlersMutiraoInfo {
  HandlersMutiraoInfo copyWith({
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
    return HandlersMutiraoInfo(
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

  HandlersMutiraoInfo copyWithWrapped({
    Wrapped<int?>? atualizadoEm,
    Wrapped<String?>? contratante,
    Wrapped<String?>? dataFinal,
    Wrapped<String?>? dataInicio,
    Wrapped<String?>? demandante,
    Wrapped<String?>? estado,
    Wrapped<int?>? id,
    Wrapped<String?>? local,
    Wrapped<String?>? municipio,
    Wrapped<Map<String, dynamic>?>? permissoes,
    Wrapped<int?>? status,
    Wrapped<String?>? tipo,
    Wrapped<int?>? ultimaMudanca,
  }) {
    return HandlersMutiraoInfo(
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
class HandlersPostEntrarReq {
  const HandlersPostEntrarReq({this.email, this.senha});

  factory HandlersPostEntrarReq.fromJson(Map<String, dynamic> json) =>
      _$HandlersPostEntrarReqFromJson(json);

  static const toJsonFactory = _$HandlersPostEntrarReqToJson;
  Map<String, dynamic> toJson() => _$HandlersPostEntrarReqToJson(this);

  @JsonKey(name: 'email')
  final String? email;
  @JsonKey(name: 'senha')
  final String? senha;
  static const fromJsonFactory = _$HandlersPostEntrarReqFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is HandlersPostEntrarReq &&
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

extension $HandlersPostEntrarReqExtension on HandlersPostEntrarReq {
  HandlersPostEntrarReq copyWith({String? email, String? senha}) {
    return HandlersPostEntrarReq(
      email: email ?? this.email,
      senha: senha ?? this.senha,
    );
  }

  HandlersPostEntrarReq copyWithWrapped({
    Wrapped<String?>? email,
    Wrapped<String?>? senha,
  }) {
    return HandlersPostEntrarReq(
      email: (email != null ? email.value : this.email),
      senha: (senha != null ? senha.value : this.senha),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class HandlersPostEntrarRes {
  const HandlersPostEntrarRes({this.expiresIn, this.messagem, this.token});

  factory HandlersPostEntrarRes.fromJson(Map<String, dynamic> json) =>
      _$HandlersPostEntrarResFromJson(json);

  static const toJsonFactory = _$HandlersPostEntrarResToJson;
  Map<String, dynamic> toJson() => _$HandlersPostEntrarResToJson(this);

  @JsonKey(name: 'expires_in')
  final int? expiresIn;
  @JsonKey(name: 'messagem')
  final String? messagem;
  @JsonKey(name: 'token')
  final String? token;
  static const fromJsonFactory = _$HandlersPostEntrarResFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is HandlersPostEntrarRes &&
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

extension $HandlersPostEntrarResExtension on HandlersPostEntrarRes {
  HandlersPostEntrarRes copyWith({
    int? expiresIn,
    String? messagem,
    String? token,
  }) {
    return HandlersPostEntrarRes(
      expiresIn: expiresIn ?? this.expiresIn,
      messagem: messagem ?? this.messagem,
      token: token ?? this.token,
    );
  }

  HandlersPostEntrarRes copyWithWrapped({
    Wrapped<int?>? expiresIn,
    Wrapped<String?>? messagem,
    Wrapped<String?>? token,
  }) {
    return HandlersPostEntrarRes(
      expiresIn: (expiresIn != null ? expiresIn.value : this.expiresIn),
      messagem: (messagem != null ? messagem.value : this.messagem),
      token: (token != null ? token.value : this.token),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class HandlersPostMutiraoMudancasReq {
  const HandlersPostMutiraoMudancasReq({
    this.colaboradores,
    this.condutas,
    this.condutasGenericas,
    this.medicos,
    this.mutirao,
    this.mutiraoCondutas,
    this.pacientes,
    this.procedimentos,
  });

  factory HandlersPostMutiraoMudancasReq.fromJson(Map<String, dynamic> json) =>
      _$HandlersPostMutiraoMudancasReqFromJson(json);

  static const toJsonFactory = _$HandlersPostMutiraoMudancasReqToJson;
  Map<String, dynamic> toJson() => _$HandlersPostMutiraoMudancasReqToJson(this);

  @JsonKey(name: 'colaboradores')
  final Map<String, dynamic>? colaboradores;
  @JsonKey(name: 'condutas')
  final Map<String, dynamic>? condutas;
  @JsonKey(name: 'condutasGenericas')
  final Map<String, dynamic>? condutasGenericas;
  @JsonKey(name: 'medicos')
  final Map<String, dynamic>? medicos;
  @JsonKey(name: 'mutirao')
  final EntitysMutiraoData? mutirao;
  @JsonKey(name: 'mutiraoCondutas', defaultValue: <String>[])
  final List<String>? mutiraoCondutas;
  @JsonKey(name: 'pacientes')
  final Map<String, dynamic>? pacientes;
  @JsonKey(name: 'procedimentos')
  final Map<String, dynamic>? procedimentos;
  static const fromJsonFactory = _$HandlersPostMutiraoMudancasReqFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is HandlersPostMutiraoMudancasReq &&
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

extension $HandlersPostMutiraoMudancasReqExtension
    on HandlersPostMutiraoMudancasReq {
  HandlersPostMutiraoMudancasReq copyWith({
    Map<String, dynamic>? colaboradores,
    Map<String, dynamic>? condutas,
    Map<String, dynamic>? condutasGenericas,
    Map<String, dynamic>? medicos,
    EntitysMutiraoData? mutirao,
    List<String>? mutiraoCondutas,
    Map<String, dynamic>? pacientes,
    Map<String, dynamic>? procedimentos,
  }) {
    return HandlersPostMutiraoMudancasReq(
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

  HandlersPostMutiraoMudancasReq copyWithWrapped({
    Wrapped<Map<String, dynamic>?>? colaboradores,
    Wrapped<Map<String, dynamic>?>? condutas,
    Wrapped<Map<String, dynamic>?>? condutasGenericas,
    Wrapped<Map<String, dynamic>?>? medicos,
    Wrapped<EntitysMutiraoData?>? mutirao,
    Wrapped<List<String>?>? mutiraoCondutas,
    Wrapped<Map<String, dynamic>?>? pacientes,
    Wrapped<Map<String, dynamic>?>? procedimentos,
  }) {
    return HandlersPostMutiraoMudancasReq(
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
class HandlersPostMutiraoMudancasRes {
  const HandlersPostMutiraoMudancasRes({this.messagem, this.timestamp});

  factory HandlersPostMutiraoMudancasRes.fromJson(Map<String, dynamic> json) =>
      _$HandlersPostMutiraoMudancasResFromJson(json);

  static const toJsonFactory = _$HandlersPostMutiraoMudancasResToJson;
  Map<String, dynamic> toJson() => _$HandlersPostMutiraoMudancasResToJson(this);

  @JsonKey(name: 'messagem')
  final String? messagem;
  @JsonKey(name: 'timestamp')
  final int? timestamp;
  static const fromJsonFactory = _$HandlersPostMutiraoMudancasResFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is HandlersPostMutiraoMudancasRes &&
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

extension $HandlersPostMutiraoMudancasResExtension
    on HandlersPostMutiraoMudancasRes {
  HandlersPostMutiraoMudancasRes copyWith({String? messagem, int? timestamp}) {
    return HandlersPostMutiraoMudancasRes(
      messagem: messagem ?? this.messagem,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  HandlersPostMutiraoMudancasRes copyWithWrapped({
    Wrapped<String?>? messagem,
    Wrapped<int?>? timestamp,
  }) {
    return HandlersPostMutiraoMudancasRes(
      messagem: (messagem != null ? messagem.value : this.messagem),
      timestamp: (timestamp != null ? timestamp.value : this.timestamp),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class HandlersPostRegistarReq {
  const HandlersPostRegistarReq({this.email, this.nome, this.senha});

  factory HandlersPostRegistarReq.fromJson(Map<String, dynamic> json) =>
      _$HandlersPostRegistarReqFromJson(json);

  static const toJsonFactory = _$HandlersPostRegistarReqToJson;
  Map<String, dynamic> toJson() => _$HandlersPostRegistarReqToJson(this);

  @JsonKey(name: 'email')
  final String? email;
  @JsonKey(name: 'nome')
  final String? nome;
  @JsonKey(name: 'senha')
  final String? senha;
  static const fromJsonFactory = _$HandlersPostRegistarReqFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is HandlersPostRegistarReq &&
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

extension $HandlersPostRegistarReqExtension on HandlersPostRegistarReq {
  HandlersPostRegistarReq copyWith({
    String? email,
    String? nome,
    String? senha,
  }) {
    return HandlersPostRegistarReq(
      email: email ?? this.email,
      nome: nome ?? this.nome,
      senha: senha ?? this.senha,
    );
  }

  HandlersPostRegistarReq copyWithWrapped({
    Wrapped<String?>? email,
    Wrapped<String?>? nome,
    Wrapped<String?>? senha,
  }) {
    return HandlersPostRegistarReq(
      email: (email != null ? email.value : this.email),
      nome: (nome != null ? nome.value : this.nome),
      senha: (senha != null ? senha.value : this.senha),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class HandlersPostRegistarRes {
  const HandlersPostRegistarRes({this.messagem, this.usuarioID});

  factory HandlersPostRegistarRes.fromJson(Map<String, dynamic> json) =>
      _$HandlersPostRegistarResFromJson(json);

  static const toJsonFactory = _$HandlersPostRegistarResToJson;
  Map<String, dynamic> toJson() => _$HandlersPostRegistarResToJson(this);

  @JsonKey(name: 'messagem')
  final String? messagem;
  @JsonKey(name: 'usuarioID')
  final int? usuarioID;
  static const fromJsonFactory = _$HandlersPostRegistarResFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is HandlersPostRegistarRes &&
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

extension $HandlersPostRegistarResExtension on HandlersPostRegistarRes {
  HandlersPostRegistarRes copyWith({String? messagem, int? usuarioID}) {
    return HandlersPostRegistarRes(
      messagem: messagem ?? this.messagem,
      usuarioID: usuarioID ?? this.usuarioID,
    );
  }

  HandlersPostRegistarRes copyWithWrapped({
    Wrapped<String?>? messagem,
    Wrapped<int?>? usuarioID,
  }) {
    return HandlersPostRegistarRes(
      messagem: (messagem != null ? messagem.value : this.messagem),
      usuarioID: (usuarioID != null ? usuarioID.value : this.usuarioID),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class HandlersPutMutiraoPermissoesReq {
  const HandlersPutMutiraoPermissoesReq();

  factory HandlersPutMutiraoPermissoesReq.fromJson(Map<String, dynamic> json) =>
      _$HandlersPutMutiraoPermissoesReqFromJson(json);

  static const toJsonFactory = _$HandlersPutMutiraoPermissoesReqToJson;
  Map<String, dynamic> toJson() =>
      _$HandlersPutMutiraoPermissoesReqToJson(this);

  static const fromJsonFactory = _$HandlersPutMutiraoPermissoesReqFromJson;

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode => runtimeType.hashCode;
}

@JsonSerializable(explicitToJson: true)
class HandlersPutMutiraoPermissoesRes {
  const HandlersPutMutiraoPermissoesRes({this.messagem, this.timestamp});

  factory HandlersPutMutiraoPermissoesRes.fromJson(Map<String, dynamic> json) =>
      _$HandlersPutMutiraoPermissoesResFromJson(json);

  static const toJsonFactory = _$HandlersPutMutiraoPermissoesResToJson;
  Map<String, dynamic> toJson() =>
      _$HandlersPutMutiraoPermissoesResToJson(this);

  @JsonKey(name: 'messagem')
  final String? messagem;
  @JsonKey(name: 'timestamp')
  final int? timestamp;
  static const fromJsonFactory = _$HandlersPutMutiraoPermissoesResFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is HandlersPutMutiraoPermissoesRes &&
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

extension $HandlersPutMutiraoPermissoesResExtension
    on HandlersPutMutiraoPermissoesRes {
  HandlersPutMutiraoPermissoesRes copyWith({String? messagem, int? timestamp}) {
    return HandlersPutMutiraoPermissoesRes(
      messagem: messagem ?? this.messagem,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  HandlersPutMutiraoPermissoesRes copyWithWrapped({
    Wrapped<String?>? messagem,
    Wrapped<int?>? timestamp,
  }) {
    return HandlersPutMutiraoPermissoesRes(
      messagem: (messagem != null ? messagem.value : this.messagem),
      timestamp: (timestamp != null ? timestamp.value : this.timestamp),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class HandlersSafeUsuario {
  const HandlersSafeUsuario({this.email, this.id, this.nome});

  factory HandlersSafeUsuario.fromJson(Map<String, dynamic> json) =>
      _$HandlersSafeUsuarioFromJson(json);

  static const toJsonFactory = _$HandlersSafeUsuarioToJson;
  Map<String, dynamic> toJson() => _$HandlersSafeUsuarioToJson(this);

  @JsonKey(name: 'email')
  final String? email;
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'nome')
  final String? nome;
  static const fromJsonFactory = _$HandlersSafeUsuarioFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is HandlersSafeUsuario &&
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

extension $HandlersSafeUsuarioExtension on HandlersSafeUsuario {
  HandlersSafeUsuario copyWith({String? email, int? id, String? nome}) {
    return HandlersSafeUsuario(
      email: email ?? this.email,
      id: id ?? this.id,
      nome: nome ?? this.nome,
    );
  }

  HandlersSafeUsuario copyWithWrapped({
    Wrapped<String?>? email,
    Wrapped<int?>? id,
    Wrapped<String?>? nome,
  }) {
    return HandlersSafeUsuario(
      email: (email != null ? email.value : this.email),
      id: (id != null ? id.value : this.id),
      nome: (nome != null ? nome.value : this.nome),
    );
  }
}

String? entitysPermissaoNullableToJson(
  enums.EntitysPermissao? entitysPermissao,
) {
  return entitysPermissao?.value;
}

String? entitysPermissaoToJson(enums.EntitysPermissao entitysPermissao) {
  return entitysPermissao.value;
}

enums.EntitysPermissao entitysPermissaoFromJson(
  Object? entitysPermissao, [
  enums.EntitysPermissao? defaultValue,
]) {
  return enums.EntitysPermissao.values.firstWhereOrNull(
        (e) => e.value == entitysPermissao,
      ) ??
      defaultValue ??
      enums.EntitysPermissao.swaggerGeneratedUnknown;
}

enums.EntitysPermissao? entitysPermissaoNullableFromJson(
  Object? entitysPermissao, [
  enums.EntitysPermissao? defaultValue,
]) {
  if (entitysPermissao == null) {
    return null;
  }
  return enums.EntitysPermissao.values.firstWhereOrNull(
        (e) => e.value == entitysPermissao,
      ) ??
      defaultValue;
}

String entitysPermissaoExplodedListToJson(
  List<enums.EntitysPermissao>? entitysPermissao,
) {
  return entitysPermissao?.map((e) => e.value!).join(',') ?? '';
}

List<String> entitysPermissaoListToJson(
  List<enums.EntitysPermissao>? entitysPermissao,
) {
  if (entitysPermissao == null) {
    return [];
  }

  return entitysPermissao.map((e) => e.value!).toList();
}

List<enums.EntitysPermissao> entitysPermissaoListFromJson(
  List? entitysPermissao, [
  List<enums.EntitysPermissao>? defaultValue,
]) {
  if (entitysPermissao == null) {
    return defaultValue ?? [];
  }

  return entitysPermissao
      .map((e) => entitysPermissaoFromJson(e.toString()))
      .toList();
}

List<enums.EntitysPermissao>? entitysPermissaoNullableListFromJson(
  List? entitysPermissao, [
  List<enums.EntitysPermissao>? defaultValue,
]) {
  if (entitysPermissao == null) {
    return defaultValue;
  }

  return entitysPermissao
      .map((e) => entitysPermissaoFromJson(e.toString()))
      .toList();
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
