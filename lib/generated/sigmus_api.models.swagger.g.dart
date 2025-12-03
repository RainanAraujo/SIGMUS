// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sigmus_api.models.swagger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Colaborador _$ColaboradorFromJson(Map<String, dynamic> json) => Colaborador(
  atualizadoEm: (json['atualizado_em'] as num).toInt(),
  funcao: json['funcao'] as String,
  nome: json['nome'] as String,
  status: (json['status'] as num).toInt(),
);

Map<String, dynamic> _$ColaboradorToJson(Colaborador instance) =>
    <String, dynamic>{
      'atualizado_em': instance.atualizadoEm,
      'funcao': instance.funcao,
      'nome': instance.nome,
      'status': instance.status,
    };

Conduta _$CondutaFromJson(Map<String, dynamic> json) => Conduta(
  atualizadoEm: (json['atualizado_em'] as num).toInt(),
  dados: json['dados'] as Map<String, dynamic>?,
  data: json['data'] as String?,
  medicoId: (json['medicoId'] as num?)?.toInt(),
  pacienteId: (json['pacienteId'] as num).toInt(),
  status: (json['status'] as num).toInt(),
  tipo: json['tipo'] as String?,
);

Map<String, dynamic> _$CondutaToJson(Conduta instance) => <String, dynamic>{
  'atualizado_em': instance.atualizadoEm,
  'dados': instance.dados,
  'data': instance.data,
  'medicoId': instance.medicoId,
  'pacienteId': instance.pacienteId,
  'status': instance.status,
  'tipo': instance.tipo,
};

CondutaGenerica _$CondutaGenericaFromJson(Map<String, dynamic> json) =>
    CondutaGenerica(
      atualizadoEm: (json['atualizado_em'] as num).toInt(),
      conduta: json['conduta'] as String?,
      data: json['data'] as String?,
      medicoId: (json['medicoId'] as num?)?.toInt(),
      pacienteId: (json['pacienteId'] as num).toInt(),
      status: (json['status'] as num).toInt(),
    );

Map<String, dynamic> _$CondutaGenericaToJson(CondutaGenerica instance) =>
    <String, dynamic>{
      'atualizado_em': instance.atualizadoEm,
      'conduta': instance.conduta,
      'data': instance.data,
      'medicoId': instance.medicoId,
      'pacienteId': instance.pacienteId,
      'status': instance.status,
    };

DelUserRes _$DelUserResFromJson(Map<String, dynamic> json) =>
    DelUserRes(messagem: json['messagem'] as String);

Map<String, dynamic> _$DelUserResToJson(DelUserRes instance) =>
    <String, dynamic>{'messagem': instance.messagem};

ErrorMessage _$ErrorMessageFromJson(Map<String, dynamic> json) => ErrorMessage(
  error: json['error'] as String,
  messagem: json['messagem'] as String,
);

Map<String, dynamic> _$ErrorMessageToJson(ErrorMessage instance) =>
    <String, dynamic>{'error': instance.error, 'messagem': instance.messagem};

GetAtualizarTokenRes _$GetAtualizarTokenResFromJson(
  Map<String, dynamic> json,
) => GetAtualizarTokenRes(
  expiresIn: (json['expires_in'] as num).toInt(),
  messagem: json['messagem'] as String,
  token: json['token'] as String,
);

Map<String, dynamic> _$GetAtualizarTokenResToJson(
  GetAtualizarTokenRes instance,
) => <String, dynamic>{
  'expires_in': instance.expiresIn,
  'messagem': instance.messagem,
  'token': instance.token,
};

GetMutiraoMudancasRes _$GetMutiraoMudancasResFromJson(
  Map<String, dynamic> json,
) => GetMutiraoMudancasRes(
  messagem: json['messagem'] as String,
  mudancas: json['mudancas'] == null
      ? null
      : MutiraoMudancas.fromJson(json['mudancas'] as Map<String, dynamic>),
  mutirao: json['mutirao'] == null
      ? null
      : MutiraoData.fromJson(json['mutirao'] as Map<String, dynamic>),
  timestamp: (json['timestamp'] as num).toInt(),
);

Map<String, dynamic> _$GetMutiraoMudancasResToJson(
  GetMutiraoMudancasRes instance,
) => <String, dynamic>{
  'messagem': instance.messagem,
  'mudancas': instance.mudancas?.toJson(),
  'mutirao': instance.mutirao?.toJson(),
  'timestamp': instance.timestamp,
};

GetUsuarioMutiroesRes _$GetUsuarioMutiroesResFromJson(
  Map<String, dynamic> json,
) => GetUsuarioMutiroesRes(
  messagem: json['messagem'] as String,
  mutiroes:
      (json['mutiroes'] as List<dynamic>?)
          ?.map((e) => MutiraoInfo.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [],
);

Map<String, dynamic> _$GetUsuarioMutiroesResToJson(
  GetUsuarioMutiroesRes instance,
) => <String, dynamic>{
  'messagem': instance.messagem,
  'mutiroes': instance.mutiroes.map((e) => e.toJson()).toList(),
};

Medico _$MedicoFromJson(Map<String, dynamic> json) => Medico(
  atualizadoEm: (json['atualizado_em'] as num).toInt(),
  crm: json['crm'] as String,
  nome: json['nome'] as String,
  status: (json['status'] as num).toInt(),
);

Map<String, dynamic> _$MedicoToJson(Medico instance) => <String, dynamic>{
  'atualizado_em': instance.atualizadoEm,
  'crm': instance.crm,
  'nome': instance.nome,
  'status': instance.status,
};

MutiraoData _$MutiraoDataFromJson(Map<String, dynamic> json) => MutiraoData(
  atualizadoEm: (json['atualizado_em'] as num).toInt(),
  contratante: json['contratante'] as String,
  dataFinal: json['data_final'] as String,
  dataInicio: json['data_inicio'] as String,
  demandante: json['demandante'] as String,
  estado: json['estado'] as String,
  id: (json['id'] as num).toInt(),
  local: json['local'] as String,
  municipio: json['municipio'] as String,
  permissoes: json['permissoes'] as Map<String, dynamic>,
  status: (json['status'] as num).toInt(),
  tipo: json['tipo'] as String,
);

Map<String, dynamic> _$MutiraoDataToJson(MutiraoData instance) =>
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

MutiraoInfo _$MutiraoInfoFromJson(Map<String, dynamic> json) => MutiraoInfo(
  atualizadoEm: (json['atualizado_em'] as num).toInt(),
  contratante: json['contratante'] as String,
  dataFinal: json['data_final'] as String,
  dataInicio: json['data_inicio'] as String,
  demandante: json['demandante'] as String,
  estado: json['estado'] as String,
  id: (json['id'] as num).toInt(),
  local: json['local'] as String,
  municipio: json['municipio'] as String,
  permissoes: json['permissoes'] as Map<String, dynamic>,
  status: (json['status'] as num).toInt(),
  tipo: json['tipo'] as String,
  ultimaMudanca: (json['ultima_mudanca'] as num).toInt(),
);

Map<String, dynamic> _$MutiraoInfoToJson(MutiraoInfo instance) =>
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
      'ultima_mudanca': instance.ultimaMudanca,
    };

MutiraoMudancas _$MutiraoMudancasFromJson(Map<String, dynamic> json) =>
    MutiraoMudancas(
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

Map<String, dynamic> _$MutiraoMudancasToJson(MutiraoMudancas instance) =>
    <String, dynamic>{
      'colaboradores': instance.colaboradores,
      'condutas': instance.condutas,
      'condutasGenericas': instance.condutasGenericas,
      'medicos': instance.medicos,
      'mutiraoCondutas': instance.mutiraoCondutas,
      'pacientes': instance.pacientes,
      'procedimentos': instance.procedimentos,
    };

Paciente _$PacienteFromJson(Map<String, dynamic> json) => Paciente(
  atualizadoEm: (json['atualizado_em'] as num).toInt(),
  cns: json['cns'] as String?,
  cpf: json['cpf'] as String?,
  dataNascimento: json['dataNascimento'] as String?,
  endereco: json['endereco'] as String?,
  municipio: json['municipio'] as String?,
  nome: json['nome'] as String?,
  nomeDaMae: json['nomeDaMae'] as String?,
  status: (json['status'] as num).toInt(),
  tel: json['tel'] as String?,
  uf: json['uf'] as String?,
);

Map<String, dynamic> _$PacienteToJson(Paciente instance) => <String, dynamic>{
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

PersonData _$PersonDataFromJson(Map<String, dynamic> json) => PersonData(
  cns: json['cns'] as String,
  cpf: json['cpf'] as String,
  dataNascimento: json['dataNascimento'] as String,
  endereco: json['endereco'] as String,
  nome: json['nome'] as String,
  nomeMae: json['nomeMae'] as String,
  tel: json['tel'] as String,
);

Map<String, dynamic> _$PersonDataToJson(PersonData instance) =>
    <String, dynamic>{
      'cns': instance.cns,
      'cpf': instance.cpf,
      'dataNascimento': instance.dataNascimento,
      'endereco': instance.endereco,
      'nome': instance.nome,
      'nomeMae': instance.nomeMae,
      'tel': instance.tel,
    };

PostEntrarReq _$PostEntrarReqFromJson(Map<String, dynamic> json) =>
    PostEntrarReq(
      email: json['email'] as String,
      senha: json['senha'] as String,
    );

Map<String, dynamic> _$PostEntrarReqToJson(PostEntrarReq instance) =>
    <String, dynamic>{'email': instance.email, 'senha': instance.senha};

PostEntrarRes _$PostEntrarResFromJson(Map<String, dynamic> json) =>
    PostEntrarRes(
      expiresIn: (json['expires_in'] as num).toInt(),
      messagem: json['messagem'] as String,
      token: json['token'] as String,
    );

Map<String, dynamic> _$PostEntrarResToJson(PostEntrarRes instance) =>
    <String, dynamic>{
      'expires_in': instance.expiresIn,
      'messagem': instance.messagem,
      'token': instance.token,
    };

PostMutiraoMudancasReq _$PostMutiraoMudancasReqFromJson(
  Map<String, dynamic> json,
) => PostMutiraoMudancasReq(
  colaboradores: json['colaboradores'] as Map<String, dynamic>?,
  condutas: json['condutas'] as Map<String, dynamic>?,
  condutasGenericas: json['condutasGenericas'] as Map<String, dynamic>?,
  medicos: json['medicos'] as Map<String, dynamic>?,
  mutirao: json['mutirao'] == null
      ? null
      : MutiraoData.fromJson(json['mutirao'] as Map<String, dynamic>),
  mutiraoCondutas:
      (json['mutiraoCondutas'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      [],
  pacientes: json['pacientes'] as Map<String, dynamic>?,
  procedimentos: json['procedimentos'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$PostMutiraoMudancasReqToJson(
  PostMutiraoMudancasReq instance,
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

PostMutiraoMudancasRes _$PostMutiraoMudancasResFromJson(
  Map<String, dynamic> json,
) => PostMutiraoMudancasRes(
  messagem: json['messagem'] as String,
  timestamp: (json['timestamp'] as num).toInt(),
);

Map<String, dynamic> _$PostMutiraoMudancasResToJson(
  PostMutiraoMudancasRes instance,
) => <String, dynamic>{
  'messagem': instance.messagem,
  'timestamp': instance.timestamp,
};

PostRegistarReq _$PostRegistarReqFromJson(Map<String, dynamic> json) =>
    PostRegistarReq(
      email: json['email'] as String,
      nome: json['nome'] as String,
      senha: json['senha'] as String,
    );

Map<String, dynamic> _$PostRegistarReqToJson(PostRegistarReq instance) =>
    <String, dynamic>{
      'email': instance.email,
      'nome': instance.nome,
      'senha': instance.senha,
    };

PostRegistarRes _$PostRegistarResFromJson(Map<String, dynamic> json) =>
    PostRegistarRes(
      messagem: json['messagem'] as String,
      usuarioID: (json['usuarioID'] as num).toInt(),
    );

Map<String, dynamic> _$PostRegistarResToJson(PostRegistarRes instance) =>
    <String, dynamic>{
      'messagem': instance.messagem,
      'usuarioID': instance.usuarioID,
    };

Procedimento _$ProcedimentoFromJson(Map<String, dynamic> json) => Procedimento(
  atualizadoEm: (json['atualizado_em'] as num).toInt(),
  data: json['data'] as String?,
  dioptriaLente: json['dioptriaLente'] as String?,
  intercorrencia: json['intercorrencia'] as String?,
  medicoId: (json['medicoId'] as num?)?.toInt(),
  observacao: json['observacao'] as String?,
  olho: json['olho'] as String?,
  pacienteId: (json['pacienteId'] as num).toInt(),
  status: (json['status'] as num).toInt(),
  tipo: json['tipo'] as String?,
);

Map<String, dynamic> _$ProcedimentoToJson(Procedimento instance) =>
    <String, dynamic>{
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

PutMutiraoPermissoesReq _$PutMutiraoPermissoesReqFromJson(
  Map<String, dynamic> json,
) => PutMutiraoPermissoesReq();

Map<String, dynamic> _$PutMutiraoPermissoesReqToJson(
  PutMutiraoPermissoesReq instance,
) => <String, dynamic>{};

PutMutiraoPermissoesRes _$PutMutiraoPermissoesResFromJson(
  Map<String, dynamic> json,
) => PutMutiraoPermissoesRes(
  messagem: json['messagem'] as String,
  timestamp: (json['timestamp'] as num).toInt(),
);

Map<String, dynamic> _$PutMutiraoPermissoesResToJson(
  PutMutiraoPermissoesRes instance,
) => <String, dynamic>{
  'messagem': instance.messagem,
  'timestamp': instance.timestamp,
};

SafeUsuario _$SafeUsuarioFromJson(Map<String, dynamic> json) => SafeUsuario(
  email: json['email'] as String,
  id: (json['id'] as num).toInt(),
  nome: json['nome'] as String,
);

Map<String, dynamic> _$SafeUsuarioToJson(SafeUsuario instance) =>
    <String, dynamic>{
      'email': instance.email,
      'id': instance.id,
      'nome': instance.nome,
    };
