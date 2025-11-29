// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sigmus_api.models.swagger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EntitysColaboradorUpdate _$EntitysColaboradorUpdateFromJson(
  Map<String, dynamic> json,
) => EntitysColaboradorUpdate(
  atualizadoEm: (json['atualizado_em'] as num?)?.toInt(),
  funcao: json['funcao'] as String?,
  nome: json['nome'] as String?,
  status: (json['status'] as num?)?.toInt(),
);

Map<String, dynamic> _$EntitysColaboradorUpdateToJson(
  EntitysColaboradorUpdate instance,
) => <String, dynamic>{
  'atualizado_em': instance.atualizadoEm,
  'funcao': instance.funcao,
  'nome': instance.nome,
  'status': instance.status,
};

EntitysCondutaGenericaUpdate _$EntitysCondutaGenericaUpdateFromJson(
  Map<String, dynamic> json,
) => EntitysCondutaGenericaUpdate(
  atualizadoEm: (json['atualizado_em'] as num?)?.toInt(),
  conduta: json['conduta'] as String?,
  data: json['data'] as String?,
  medicoId: (json['medicoId'] as num?)?.toInt(),
  pacienteId: (json['pacienteId'] as num?)?.toInt(),
  status: (json['status'] as num?)?.toInt(),
);

Map<String, dynamic> _$EntitysCondutaGenericaUpdateToJson(
  EntitysCondutaGenericaUpdate instance,
) => <String, dynamic>{
  'atualizado_em': instance.atualizadoEm,
  'conduta': instance.conduta,
  'data': instance.data,
  'medicoId': instance.medicoId,
  'pacienteId': instance.pacienteId,
  'status': instance.status,
};

EntitysCondutaUpdate _$EntitysCondutaUpdateFromJson(
  Map<String, dynamic> json,
) => EntitysCondutaUpdate(
  atualizadoEm: (json['atualizado_em'] as num?)?.toInt(),
  dados: json['dados'] as Map<String, dynamic>?,
  data: json['data'] as String?,
  medicoId: (json['medicoId'] as num?)?.toInt(),
  pacienteId: (json['pacienteId'] as num?)?.toInt(),
  status: (json['status'] as num?)?.toInt(),
  tipo: json['tipo'] as String?,
);

Map<String, dynamic> _$EntitysCondutaUpdateToJson(
  EntitysCondutaUpdate instance,
) => <String, dynamic>{
  'atualizado_em': instance.atualizadoEm,
  'dados': instance.dados,
  'data': instance.data,
  'medicoId': instance.medicoId,
  'pacienteId': instance.pacienteId,
  'status': instance.status,
  'tipo': instance.tipo,
};

EntitysErrorMessage _$EntitysErrorMessageFromJson(Map<String, dynamic> json) =>
    EntitysErrorMessage(
      error: json['error'] as String?,
      messagem: json['messagem'] as String?,
    );

Map<String, dynamic> _$EntitysErrorMessageToJson(
  EntitysErrorMessage instance,
) => <String, dynamic>{'error': instance.error, 'messagem': instance.messagem};

EntitysMedicoUpdate _$EntitysMedicoUpdateFromJson(Map<String, dynamic> json) =>
    EntitysMedicoUpdate(
      atualizadoEm: (json['atualizado_em'] as num?)?.toInt(),
      crm: json['crm'] as String?,
      nome: json['nome'] as String?,
      status: (json['status'] as num?)?.toInt(),
    );

Map<String, dynamic> _$EntitysMedicoUpdateToJson(
  EntitysMedicoUpdate instance,
) => <String, dynamic>{
  'atualizado_em': instance.atualizadoEm,
  'crm': instance.crm,
  'nome': instance.nome,
  'status': instance.status,
};

EntitysMutiraoData _$EntitysMutiraoDataFromJson(Map<String, dynamic> json) =>
    EntitysMutiraoData(
      atualizadoEm: (json['atualizado_em'] as num?)?.toInt(),
      contratante: json['contratante'] as String?,
      dataFinal: json['data_final'] as String?,
      dataInicio: json['data_inicio'] as String?,
      demandante: json['demandante'] as String?,
      estado: json['estado'] as String?,
      id: (json['id'] as num?)?.toInt(),
      local: json['local'] as String?,
      municipio: json['municipio'] as String?,
      permissoes: json['permissoes'] as Map<String, dynamic>?,
      status: (json['status'] as num?)?.toInt(),
      tipo: json['tipo'] as String?,
    );

Map<String, dynamic> _$EntitysMutiraoDataToJson(EntitysMutiraoData instance) =>
    <String, dynamic>{
      'atualizado_em': instance.atualizadoEm,
      'contratante': instance.contratante,
      'data_final': instance.dataFinal,
      'data_inicio': instance.dataInicio,
      'demandante': instance.demandante,
      'estado': instance.estado,
      'id': instance.id,
      'local': instance.local,
      'municipio': instance.municipio,
      'permissoes': instance.permissoes,
      'status': instance.status,
      'tipo': instance.tipo,
    };

EntitysMutiraoMudancas _$EntitysMutiraoMudancasFromJson(
  Map<String, dynamic> json,
) => EntitysMutiraoMudancas(
  colaboradores: json['colaboradores'] as Map<String, dynamic>?,
  condutas: json['condutas'] as Map<String, dynamic>?,
  condutasGenericas: json['condutasGenericas'] as Map<String, dynamic>?,
  medicos: json['medicos'] as Map<String, dynamic>?,
  mutiraoCondutas:
      (json['mutiraoCondutas'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      [],
  pacientes: json['pacientes'] as Map<String, dynamic>?,
  procedimentos: json['procedimentos'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$EntitysMutiraoMudancasToJson(
  EntitysMutiraoMudancas instance,
) => <String, dynamic>{
  'colaboradores': instance.colaboradores,
  'condutas': instance.condutas,
  'condutasGenericas': instance.condutasGenericas,
  'medicos': instance.medicos,
  'mutiraoCondutas': instance.mutiraoCondutas,
  'pacientes': instance.pacientes,
  'procedimentos': instance.procedimentos,
};

EntitysPacienteUpdate _$EntitysPacienteUpdateFromJson(
  Map<String, dynamic> json,
) => EntitysPacienteUpdate(
  atualizadoEm: (json['atualizado_em'] as num?)?.toInt(),
  cns: json['cns'] as String?,
  cpf: json['cpf'] as String?,
  dataNascimento: json['dataNascimento'] as String?,
  endereco: json['endereco'] as String?,
  municipio: json['municipio'] as String?,
  nome: json['nome'] as String?,
  nomeDaMae: json['nomeDaMae'] as String?,
  status: (json['status'] as num?)?.toInt(),
  tel: json['tel'] as String?,
  uf: json['uf'] as String?,
);

Map<String, dynamic> _$EntitysPacienteUpdateToJson(
  EntitysPacienteUpdate instance,
) => <String, dynamic>{
  'atualizado_em': instance.atualizadoEm,
  'cns': instance.cns,
  'cpf': instance.cpf,
  'dataNascimento': instance.dataNascimento,
  'endereco': instance.endereco,
  'municipio': instance.municipio,
  'nome': instance.nome,
  'nomeDaMae': instance.nomeDaMae,
  'status': instance.status,
  'tel': instance.tel,
  'uf': instance.uf,
};

EntitysPersonData _$EntitysPersonDataFromJson(Map<String, dynamic> json) =>
    EntitysPersonData(
      cns: json['cns'] as String?,
      cpf: json['cpf'] as String?,
      dataNascimento: json['dataNascimento'] as String?,
      endereco: json['endereco'] as String?,
      nome: json['nome'] as String?,
      nomeMae: json['nomeMae'] as String?,
      tel: json['tel'] as String?,
    );

Map<String, dynamic> _$EntitysPersonDataToJson(EntitysPersonData instance) =>
    <String, dynamic>{
      'cns': instance.cns,
      'cpf': instance.cpf,
      'dataNascimento': instance.dataNascimento,
      'endereco': instance.endereco,
      'nome': instance.nome,
      'nomeMae': instance.nomeMae,
      'tel': instance.tel,
    };

EntitysProcedimentoUpdate _$EntitysProcedimentoUpdateFromJson(
  Map<String, dynamic> json,
) => EntitysProcedimentoUpdate(
  atualizadoEm: (json['atualizado_em'] as num?)?.toInt(),
  data: json['data'] as String?,
  dioptriaLente: json['dioptriaLente'] as String?,
  intercorrencia: json['intercorrencia'] as String?,
  medicoId: (json['medicoId'] as num?)?.toInt(),
  observacao: json['observacao'] as String?,
  olho: json['olho'] as String?,
  pacienteId: (json['pacienteId'] as num?)?.toInt(),
  status: (json['status'] as num?)?.toInt(),
  tipo: json['tipo'] as String?,
);

Map<String, dynamic> _$EntitysProcedimentoUpdateToJson(
  EntitysProcedimentoUpdate instance,
) => <String, dynamic>{
  'atualizado_em': instance.atualizadoEm,
  'data': instance.data,
  'dioptriaLente': instance.dioptriaLente,
  'intercorrencia': instance.intercorrencia,
  'medicoId': instance.medicoId,
  'observacao': instance.observacao,
  'olho': instance.olho,
  'pacienteId': instance.pacienteId,
  'status': instance.status,
  'tipo': instance.tipo,
};

HandlersDelUserRes _$HandlersDelUserResFromJson(Map<String, dynamic> json) =>
    HandlersDelUserRes(messagem: json['messagem'] as String?);

Map<String, dynamic> _$HandlersDelUserResToJson(HandlersDelUserRes instance) =>
    <String, dynamic>{'messagem': instance.messagem};

HandlersGetAtualizarTokenRes _$HandlersGetAtualizarTokenResFromJson(
  Map<String, dynamic> json,
) => HandlersGetAtualizarTokenRes(
  expiresIn: (json['expires_in'] as num?)?.toInt(),
  messagem: json['messagem'] as String?,
  token: json['token'] as String?,
);

Map<String, dynamic> _$HandlersGetAtualizarTokenResToJson(
  HandlersGetAtualizarTokenRes instance,
) => <String, dynamic>{
  'expires_in': instance.expiresIn,
  'messagem': instance.messagem,
  'token': instance.token,
};

HandlersGetMutiraoMudancasRes _$HandlersGetMutiraoMudancasResFromJson(
  Map<String, dynamic> json,
) => HandlersGetMutiraoMudancasRes(
  messagem: json['messagem'] as String?,
  mudancas: json['mudancas'] == null
      ? null
      : EntitysMutiraoMudancas.fromJson(
          json['mudancas'] as Map<String, dynamic>,
        ),
  mutirao: json['mutirao'] == null
      ? null
      : EntitysMutiraoData.fromJson(json['mutirao'] as Map<String, dynamic>),
  timestamp: (json['timestamp'] as num?)?.toInt(),
);

Map<String, dynamic> _$HandlersGetMutiraoMudancasResToJson(
  HandlersGetMutiraoMudancasRes instance,
) => <String, dynamic>{
  'messagem': instance.messagem,
  'mudancas': instance.mudancas?.toJson(),
  'mutirao': instance.mutirao?.toJson(),
  'timestamp': instance.timestamp,
};

HandlersGetUsuarioMutiroesRes _$HandlersGetUsuarioMutiroesResFromJson(
  Map<String, dynamic> json,
) => HandlersGetUsuarioMutiroesRes(
  messagem: json['messagem'] as String?,
  mutiroes:
      (json['mutiroes'] as List<dynamic>?)
          ?.map((e) => HandlersMutiraoInfo.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [],
);

Map<String, dynamic> _$HandlersGetUsuarioMutiroesResToJson(
  HandlersGetUsuarioMutiroesRes instance,
) => <String, dynamic>{
  'messagem': instance.messagem,
  'mutiroes': instance.mutiroes?.map((e) => e.toJson()).toList(),
};

HandlersMutiraoInfo _$HandlersMutiraoInfoFromJson(Map<String, dynamic> json) =>
    HandlersMutiraoInfo(
      atualizadoEm: (json['atualizado_em'] as num?)?.toInt(),
      contratante: json['contratante'] as String?,
      dataFinal: json['data_final'] as String?,
      dataInicio: json['data_inicio'] as String?,
      demandante: json['demandante'] as String?,
      estado: json['estado'] as String?,
      id: (json['id'] as num?)?.toInt(),
      local: json['local'] as String?,
      municipio: json['municipio'] as String?,
      permissoes: json['permissoes'] as Map<String, dynamic>?,
      status: (json['status'] as num?)?.toInt(),
      tipo: json['tipo'] as String?,
      ultimaMudanca: (json['ultima_mudanca'] as num?)?.toInt(),
    );

Map<String, dynamic> _$HandlersMutiraoInfoToJson(
  HandlersMutiraoInfo instance,
) => <String, dynamic>{
  'atualizado_em': instance.atualizadoEm,
  'contratante': instance.contratante,
  'data_final': instance.dataFinal,
  'data_inicio': instance.dataInicio,
  'demandante': instance.demandante,
  'estado': instance.estado,
  'id': instance.id,
  'local': instance.local,
  'municipio': instance.municipio,
  'permissoes': instance.permissoes,
  'status': instance.status,
  'tipo': instance.tipo,
  'ultima_mudanca': instance.ultimaMudanca,
};

HandlersPostEntrarReq _$HandlersPostEntrarReqFromJson(
  Map<String, dynamic> json,
) => HandlersPostEntrarReq(
  email: json['email'] as String?,
  senha: json['senha'] as String?,
);

Map<String, dynamic> _$HandlersPostEntrarReqToJson(
  HandlersPostEntrarReq instance,
) => <String, dynamic>{'email': instance.email, 'senha': instance.senha};

HandlersPostEntrarRes _$HandlersPostEntrarResFromJson(
  Map<String, dynamic> json,
) => HandlersPostEntrarRes(
  expiresIn: (json['expires_in'] as num?)?.toInt(),
  messagem: json['messagem'] as String?,
  token: json['token'] as String?,
);

Map<String, dynamic> _$HandlersPostEntrarResToJson(
  HandlersPostEntrarRes instance,
) => <String, dynamic>{
  'expires_in': instance.expiresIn,
  'messagem': instance.messagem,
  'token': instance.token,
};

HandlersPostMutiraoMudancasReq _$HandlersPostMutiraoMudancasReqFromJson(
  Map<String, dynamic> json,
) => HandlersPostMutiraoMudancasReq(
  colaboradores: json['colaboradores'] as Map<String, dynamic>?,
  condutas: json['condutas'] as Map<String, dynamic>?,
  condutasGenericas: json['condutasGenericas'] as Map<String, dynamic>?,
  medicos: json['medicos'] as Map<String, dynamic>?,
  mutirao: json['mutirao'] == null
      ? null
      : EntitysMutiraoData.fromJson(json['mutirao'] as Map<String, dynamic>),
  mutiraoCondutas:
      (json['mutiraoCondutas'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      [],
  pacientes: json['pacientes'] as Map<String, dynamic>?,
  procedimentos: json['procedimentos'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$HandlersPostMutiraoMudancasReqToJson(
  HandlersPostMutiraoMudancasReq instance,
) => <String, dynamic>{
  'colaboradores': instance.colaboradores,
  'condutas': instance.condutas,
  'condutasGenericas': instance.condutasGenericas,
  'medicos': instance.medicos,
  'mutirao': instance.mutirao?.toJson(),
  'mutiraoCondutas': instance.mutiraoCondutas,
  'pacientes': instance.pacientes,
  'procedimentos': instance.procedimentos,
};

HandlersPostMutiraoMudancasRes _$HandlersPostMutiraoMudancasResFromJson(
  Map<String, dynamic> json,
) => HandlersPostMutiraoMudancasRes(
  messagem: json['messagem'] as String?,
  timestamp: (json['timestamp'] as num?)?.toInt(),
);

Map<String, dynamic> _$HandlersPostMutiraoMudancasResToJson(
  HandlersPostMutiraoMudancasRes instance,
) => <String, dynamic>{
  'messagem': instance.messagem,
  'timestamp': instance.timestamp,
};

HandlersPostRegistarReq _$HandlersPostRegistarReqFromJson(
  Map<String, dynamic> json,
) => HandlersPostRegistarReq(
  email: json['email'] as String?,
  nome: json['nome'] as String?,
  senha: json['senha'] as String?,
);

Map<String, dynamic> _$HandlersPostRegistarReqToJson(
  HandlersPostRegistarReq instance,
) => <String, dynamic>{
  'email': instance.email,
  'nome': instance.nome,
  'senha': instance.senha,
};

HandlersPostRegistarRes _$HandlersPostRegistarResFromJson(
  Map<String, dynamic> json,
) => HandlersPostRegistarRes(
  messagem: json['messagem'] as String?,
  usuarioID: (json['usuarioID'] as num?)?.toInt(),
);

Map<String, dynamic> _$HandlersPostRegistarResToJson(
  HandlersPostRegistarRes instance,
) => <String, dynamic>{
  'messagem': instance.messagem,
  'usuarioID': instance.usuarioID,
};

HandlersPutMutiraoPermissoesReq _$HandlersPutMutiraoPermissoesReqFromJson(
  Map<String, dynamic> json,
) => HandlersPutMutiraoPermissoesReq();

Map<String, dynamic> _$HandlersPutMutiraoPermissoesReqToJson(
  HandlersPutMutiraoPermissoesReq instance,
) => <String, dynamic>{};

HandlersPutMutiraoPermissoesRes _$HandlersPutMutiraoPermissoesResFromJson(
  Map<String, dynamic> json,
) => HandlersPutMutiraoPermissoesRes(
  messagem: json['messagem'] as String?,
  timestamp: (json['timestamp'] as num?)?.toInt(),
);

Map<String, dynamic> _$HandlersPutMutiraoPermissoesResToJson(
  HandlersPutMutiraoPermissoesRes instance,
) => <String, dynamic>{
  'messagem': instance.messagem,
  'timestamp': instance.timestamp,
};

HandlersSafeUsuario _$HandlersSafeUsuarioFromJson(Map<String, dynamic> json) =>
    HandlersSafeUsuario(
      email: json['email'] as String?,
      id: (json['id'] as num?)?.toInt(),
      nome: json['nome'] as String?,
    );

Map<String, dynamic> _$HandlersSafeUsuarioToJson(
  HandlersSafeUsuario instance,
) => <String, dynamic>{
  'email': instance.email,
  'id': instance.id,
  'nome': instance.nome,
};
