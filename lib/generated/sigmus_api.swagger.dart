// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element_parameter

import 'package:json_annotation/json_annotation.dart';
import 'package:json_annotation/json_annotation.dart' as json;
import 'package:collection/collection.dart';
import 'dart:convert';

import 'sigmus_api.models.swagger.dart';
import 'package:chopper/chopper.dart';

import 'client_mapping.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:http/http.dart' show MultipartFile;
import 'package:chopper/chopper.dart' as chopper;
import 'sigmus_api.enums.swagger.dart' as enums;
import 'sigmus_api.metadata.swagger.dart';
export 'sigmus_api.enums.swagger.dart';
export 'sigmus_api.models.swagger.dart';

part 'sigmus_api.swagger.chopper.dart';

// **************************************************************************
// SwaggerChopperGenerator
// **************************************************************************

@ChopperApi()
abstract class SigmusApi extends ChopperService {
  static SigmusApi create({
    ChopperClient? client,
    http.Client? httpClient,
    Authenticator? authenticator,
    ErrorConverter? errorConverter,
    Converter? converter,
    Uri? baseUrl,
    List<Interceptor>? interceptors,
  }) {
    if (client != null) {
      return _$SigmusApi(client);
    }

    final newClient = ChopperClient(
      services: [_$SigmusApi()],
      converter: converter ?? $JsonSerializableConverter(),
      interceptors: interceptors ?? [],
      client: httpClient,
      authenticator: authenticator,
      errorConverter: errorConverter,
      baseUrl: baseUrl ?? Uri.parse('http://'),
    );
    return _$SigmusApi(newClient);
  }

  ///Atualizar token do usuário
  Future<chopper.Response<GetAtualizarTokenRes>> getAtualizarToken() {
    generatedMapping.putIfAbsent(
      GetAtualizarTokenRes,
      () => GetAtualizarTokenRes.fromJsonFactory,
    );

    return _getAtualizarToken();
  }

  ///Atualizar token do usuário
  @GET(path: '/atualizar-token')
  Future<chopper.Response<GetAtualizarTokenRes>> _getAtualizarToken({
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description:
          'Autentica um usuário e retorna um token JWT atualizado, se bem-sucedido.',
      summary: 'Atualizar token do usuário',
      operationId: 'getAtualizarToken',
      consumes: ["application/json"],
      produces: ["application/json"],
      security: [],
      tags: ["Autenticação"],
      deprecated: false,
    ),
  });

  ///Buscar dados da pessoa pelo CNS
  ///@param cns CNS da pessoa
  Future<chopper.Response<PersonData>> getBuscarCNS({required String? cns}) {
    generatedMapping.putIfAbsent(PersonData, () => PersonData.fromJsonFactory);

    return _getBuscarCNS(cns: cns);
  }

  ///Buscar dados da pessoa pelo CNS
  ///@param cns CNS da pessoa
  @GET(path: '/buscar/cns/{cns}')
  Future<chopper.Response<PersonData>> _getBuscarCNS({
    @Path('cns') required String? cns,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description:
          'Busca os dados de uma pessoa utilizando o CNS (Cartão Nacional de Saúde)',
      summary: 'Buscar dados da pessoa pelo CNS',
      operationId: 'getBuscarCNS',
      consumes: ["application/json"],
      produces: ["application/json"],
      security: [],
      tags: ["Busca"],
      deprecated: false,
    ),
  });

  ///Buscar dados da pessoa pelo CPF
  ///@param cpf CPF da pessoa
  Future<chopper.Response<PersonData>> getBuscarCPF({required String? cpf}) {
    generatedMapping.putIfAbsent(PersonData, () => PersonData.fromJsonFactory);

    return _getBuscarCPF(cpf: cpf);
  }

  ///Buscar dados da pessoa pelo CPF
  ///@param cpf CPF da pessoa
  @GET(path: '/buscar/cpf/{cpf}')
  Future<chopper.Response<PersonData>> _getBuscarCPF({
    @Path('cpf') required String? cpf,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description:
          'Busca os dados de uma pessoa utilizando o CPF (Cadastro de Pessoas Físicas)',
      summary: 'Buscar dados da pessoa pelo CPF',
      operationId: 'getBuscarCPF',
      consumes: ["application/json"],
      produces: ["application/json"],
      security: [],
      tags: ["Busca"],
      deprecated: false,
    ),
  });

  ///Login de usuário
  ///@param body Email e senha do usuário
  Future<chopper.Response<PostEntrarRes>> postEntrar({
    required PostEntrarReq? body,
  }) {
    generatedMapping.putIfAbsent(
      PostEntrarReq,
      () => PostEntrarReq.fromJsonFactory,
    );
    generatedMapping.putIfAbsent(
      PostEntrarRes,
      () => PostEntrarRes.fromJsonFactory,
    );

    return _postEntrar(body: body);
  }

  ///Login de usuário
  ///@param body Email e senha do usuário
  @POST(path: '/entrar')
  Future<chopper.Response<PostEntrarRes>> _postEntrar({
    @Body() required PostEntrarReq? body,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description:
          'Autentica um usuário e retorna um token JWT se bem-sucedido',
      summary: 'Login de usuário',
      operationId: 'postEntrar',
      consumes: ["application/json"],
      produces: ["application/json"],
      security: [],
      tags: ["Autenticação"],
      deprecated: false,
    ),
  });

  ///Retorna edições de um mutirão
  ///@param mutiraoID ID do Mutirão
  ///@param depoisDe Timestamp após o qual as edições devem ser retornadas
  Future<chopper.Response<GetMutiraoMudancasRes>> getMutiraoMudancas({
    required int? mutiraoID,
    int? depoisDe,
  }) {
    generatedMapping.putIfAbsent(
      GetMutiraoMudancasRes,
      () => GetMutiraoMudancasRes.fromJsonFactory,
    );

    return _getMutiraoMudancas(mutiraoID: mutiraoID, depoisDe: depoisDe);
  }

  ///Retorna edições de um mutirão
  ///@param mutiraoID ID do Mutirão
  ///@param depoisDe Timestamp após o qual as edições devem ser retornadas
  @GET(path: '/mutirao/{mutiraoID}/mudancas')
  Future<chopper.Response<GetMutiraoMudancasRes>> _getMutiraoMudancas({
    @Path('mutiraoID') required int? mutiraoID,
    @Query('depoisDe') int? depoisDe,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description:
          'Retorna as edições de um mutirão específico após uma data fornecida.',
      summary: 'Retorna edições de um mutirão',
      operationId: 'getMutiraoMudancas',
      consumes: ["application/json"],
      produces: ["application/json"],
      security: [],
      tags: ["Sincronização"],
      deprecated: false,
    ),
  });

  ///Salvar mudanças nas Edições do Mutirão
  ///@param mutiraoID ID do Mutirão
  ///@param body Mudanças a serem salvas
  Future<chopper.Response<PostMutiraoMudancasRes>> postMutiraoMudancas({
    required int? mutiraoID,
    required PostMutiraoMudancasReq? body,
    dynamic authorization,
  }) {
    generatedMapping.putIfAbsent(
      PostMutiraoMudancasReq,
      () => PostMutiraoMudancasReq.fromJsonFactory,
    );
    generatedMapping.putIfAbsent(
      PostMutiraoMudancasRes,
      () => PostMutiraoMudancasRes.fromJsonFactory,
    );

    return _postMutiraoMudancas(
      mutiraoID: mutiraoID,
      body: body,
      authorization: authorization?.toString(),
    );
  }

  ///Salvar mudanças nas Edições do Mutirão
  ///@param mutiraoID ID do Mutirão
  ///@param body Mudanças a serem salvas
  @POST(path: '/mutirao/{mutiraoID}/mudancas')
  Future<chopper.Response<PostMutiraoMudancasRes>> _postMutiraoMudancas({
    @Path('mutiraoID') required int? mutiraoID,
    @Body() required PostMutiraoMudancasReq? body,
    @Header('Authorization') String? authorization,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description: 'Salvar mudanças nas Edições do Mutirão pelo ID do Mutirão',
      summary: 'Salvar mudanças nas Edições do Mutirão',
      operationId: 'postMutiraoMudancas',
      consumes: ["application/json"],
      produces: ["application/json"],
      security: ["BearerAuth"],
      tags: ["Sincronização"],
      deprecated: false,
    ),
  });

  ///Atualizar permissões de um Mutirão
  ///@param mutiraoID ID do Mutirão
  ///@param body Permissões a serem atualizadas
  Future<chopper.Response<PutMutiraoPermissoesRes>> putMutiraoPermissoes({
    required int? mutiraoID,
    required PutMutiraoPermissoesReq? body,
    dynamic authorization,
  }) {
    generatedMapping.putIfAbsent(
      PutMutiraoPermissoesReq,
      () => PutMutiraoPermissoesReq.fromJsonFactory,
    );
    generatedMapping.putIfAbsent(
      PutMutiraoPermissoesRes,
      () => PutMutiraoPermissoesRes.fromJsonFactory,
    );

    return _putMutiraoPermissoes(
      mutiraoID: mutiraoID,
      body: body,
      authorization: authorization?.toString(),
    );
  }

  ///Atualizar permissões de um Mutirão
  ///@param mutiraoID ID do Mutirão
  ///@param body Permissões a serem atualizadas
  @PUT(path: '/mutirao/{mutiraoID}/permissoes')
  Future<chopper.Response<PutMutiraoPermissoesRes>> _putMutiraoPermissoes({
    @Path('mutiraoID') required int? mutiraoID,
    @Body() required PutMutiraoPermissoesReq? body,
    @Header('Authorization') String? authorization,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description:
          'Atualiza as permissões associadas a um Mutirão específico pelo seu ID.',
      summary: 'Atualizar permissões de um Mutirão',
      operationId: 'putMutiraoPermissoes',
      consumes: ["application/json"],
      produces: ["application/json"],
      security: ["BearerAuth"],
      tags: ["Sincronização"],
      deprecated: false,
    ),
  });

  ///Criar ou atualizar usuário
  ///@param body Dados do novo usuário
  Future<chopper.Response<PostRegistarRes>> postRegistrar({
    required PostRegistarReq? body,
  }) {
    generatedMapping.putIfAbsent(
      PostRegistarReq,
      () => PostRegistarReq.fromJsonFactory,
    );
    generatedMapping.putIfAbsent(
      PostRegistarRes,
      () => PostRegistarRes.fromJsonFactory,
    );

    return _postRegistrar(body: body);
  }

  ///Criar ou atualizar usuário
  ///@param body Dados do novo usuário
  @POST(path: '/registrar')
  Future<chopper.Response<PostRegistarRes>> _postRegistrar({
    @Body() required PostRegistarReq? body,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description:
          'Cria um novo usuário com email e senha fornecidos ou atualiza se o email já existir',
      summary: 'Criar ou atualizar usuário',
      operationId: 'postRegistrar',
      consumes: ["application/json"],
      produces: ["application/json"],
      security: [],
      tags: ["Usuários"],
      deprecated: false,
    ),
  });

  ///Busca mutirões legíveis por um usuário
  ///@param usuarioID ID do Usuário
  Future<chopper.Response<GetUsuarioMutiroesRes>> getUsuarioMutiroes({
    required int? usuarioID,
  }) {
    generatedMapping.putIfAbsent(
      GetUsuarioMutiroesRes,
      () => GetUsuarioMutiroesRes.fromJsonFactory,
    );

    return _getUsuarioMutiroes(usuarioID: usuarioID);
  }

  ///Busca mutirões legíveis por um usuário
  ///@param usuarioID ID do Usuário
  @GET(path: '/usuario/{usuarioID}/mutiroes')
  Future<chopper.Response<GetUsuarioMutiroesRes>> _getUsuarioMutiroes({
    @Path('usuarioID') required int? usuarioID,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description:
          'Retorna uma lista de mutirões que o usuário especificado pode ler',
      summary: 'Busca mutirões legíveis por um usuário',
      operationId: 'getUsuarioMutiroes',
      consumes: ["application/json"],
      produces: ["application/json"],
      security: [],
      tags: ["Sincronização"],
      deprecated: false,
    ),
  });

  ///Obter lista de usuários
  Future<chopper.Response<List<SafeUsuario>>> getUsuarios() {
    generatedMapping.putIfAbsent(
      SafeUsuario,
      () => SafeUsuario.fromJsonFactory,
    );

    return _getUsuarios();
  }

  ///Obter lista de usuários
  @GET(path: '/usuarios')
  Future<chopper.Response<List<SafeUsuario>>> _getUsuarios({
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description: 'Retorna uma lista de todos os usuários cadastrados',
      summary: 'Obter lista de usuários',
      operationId: 'getUsuarios',
      consumes: ["application/json"],
      produces: ["application/json"],
      security: [],
      tags: ["Usuários"],
      deprecated: false,
    ),
  });

  ///Deletar usuário
  ///@param id ID do usuário a ser deletado
  Future<chopper.Response<DelUserRes>> deleteUsuario({required int? id}) {
    generatedMapping.putIfAbsent(DelUserRes, () => DelUserRes.fromJsonFactory);

    return _deleteUsuario(id: id);
  }

  ///Deletar usuário
  ///@param id ID do usuário a ser deletado
  @DELETE(path: '/usuarios/{id}')
  Future<chopper.Response<DelUserRes>> _deleteUsuario({
    @Path('id') required int? id,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description: 'Deleta um usuário baseado no ID fornecido na URL',
      summary: 'Deletar usuário',
      operationId: 'deleteUsuario',
      consumes: ["application/json"],
      produces: ["application/json"],
      security: [],
      tags: ["Usuários"],
      deprecated: false,
    ),
  });
}

typedef $JsonFactory<T> = T Function(Map<String, dynamic> json);

class $CustomJsonDecoder {
  $CustomJsonDecoder(this.factories);

  final Map<Type, $JsonFactory> factories;

  dynamic decode<T>(dynamic entity) {
    if (entity is Iterable) {
      return _decodeList<T>(entity);
    }

    if (entity is T) {
      return entity;
    }

    if (isTypeOf<T, Map>()) {
      return entity;
    }

    if (isTypeOf<T, Iterable>()) {
      return entity;
    }

    if (entity is Map<String, dynamic>) {
      return _decodeMap<T>(entity);
    }

    return entity;
  }

  T _decodeMap<T>(Map<String, dynamic> values) {
    final jsonFactory = factories[T];
    if (jsonFactory == null || jsonFactory is! $JsonFactory<T>) {
      return throw "Could not find factory for type $T. Is '$T: $T.fromJsonFactory' included in the CustomJsonDecoder instance creation in bootstrapper.dart?";
    }

    return jsonFactory(values);
  }

  List<T> _decodeList<T>(Iterable values) =>
      values.where((v) => v != null).map<T>((v) => decode<T>(v) as T).toList();
}

class $JsonSerializableConverter extends chopper.JsonConverter {
  @override
  FutureOr<chopper.Response<ResultType>> convertResponse<ResultType, Item>(
    chopper.Response response,
  ) async {
    if (response.bodyString.isEmpty) {
      // In rare cases, when let's say 204 (no content) is returned -
      // we cannot decode the missing json with the result type specified
      return chopper.Response(response.base, null, error: response.error);
    }

    if (ResultType == String) {
      return response.copyWith();
    }

    if (ResultType == DateTime) {
      return response.copyWith(
        body:
            DateTime.parse((response.body as String).replaceAll('"', ''))
                as ResultType,
      );
    }

    final jsonRes = await super.convertResponse(response);
    return jsonRes.copyWith<ResultType>(
      body: $jsonDecoder.decode<Item>(jsonRes.body) as ResultType,
    );
  }
}

final $jsonDecoder = $CustomJsonDecoder(generatedMapping);
