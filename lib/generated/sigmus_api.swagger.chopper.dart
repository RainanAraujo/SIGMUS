// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

part of 'sigmus_api.swagger.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$SigmusApi extends SigmusApi {
  _$SigmusApi([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = SigmusApi;

  @override
  Future<Response<GetAtualizarTokenRes>> _getAtualizarToken({
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
  }) {
    final Uri $url = Uri.parse('/atualizar-token');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      tag: swaggerMetaData,
    );
    return client.send<GetAtualizarTokenRes, GetAtualizarTokenRes>($request);
  }

  @override
  Future<Response<PersonData>> _getBuscarCNS({
    required String cns,
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
  }) {
    final Uri $url = Uri.parse('/buscar/cns/${cns}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      tag: swaggerMetaData,
    );
    return client.send<PersonData, PersonData>($request);
  }

  @override
  Future<Response<PersonData>> _getBuscarCPF({
    required String cpf,
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
  }) {
    final Uri $url = Uri.parse('/buscar/cpf/${cpf}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      tag: swaggerMetaData,
    );
    return client.send<PersonData, PersonData>($request);
  }

  @override
  Future<Response<PostEntrarRes>> _postEntrar({
    required PostEntrarReq body,
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
  }) {
    final Uri $url = Uri.parse('/entrar');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      tag: swaggerMetaData,
    );
    return client.send<PostEntrarRes, PostEntrarRes>($request);
  }

  @override
  Future<Response<GetMutiraoMudancasRes>> _getMutiraoMudancas({
    required int mutiraoID,
    int? depoisDe,
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
  }) {
    final Uri $url = Uri.parse('/mutirao/${mutiraoID}/mudancas');
    final Map<String, dynamic> $params = <String, dynamic>{
      'depoisDe': depoisDe,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      tag: swaggerMetaData,
    );
    return client.send<GetMutiraoMudancasRes, GetMutiraoMudancasRes>($request);
  }

  @override
  Future<Response<PostMutiraoMudancasRes>> _postMutiraoMudancas({
    required int mutiraoID,
    required PostMutiraoMudancasReq body,
    String? authorization,
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
  }) {
    final Uri $url = Uri.parse('/mutirao/${mutiraoID}/mudancas');
    final Map<String, String> $headers = {
      if (authorization != null) 'Authorization': authorization,
    };
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
      tag: swaggerMetaData,
    );
    return client.send<PostMutiraoMudancasRes, PostMutiraoMudancasRes>(
      $request,
    );
  }

  @override
  Future<Response<PutMutiraoPermissoesRes>> _putMutiraoPermissoes({
    required int mutiraoID,
    required PutMutiraoPermissoesReq body,
    String? authorization,
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
  }) {
    final Uri $url = Uri.parse('/mutirao/${mutiraoID}/permissoes');
    final Map<String, String> $headers = {
      if (authorization != null) 'Authorization': authorization,
    };
    final $body = body;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
      tag: swaggerMetaData,
    );
    return client.send<PutMutiraoPermissoesRes, PutMutiraoPermissoesRes>(
      $request,
    );
  }

  @override
  Future<Response<PostRegistarRes>> _postRegistrar({
    required PostRegistarReq body,
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
  }) {
    final Uri $url = Uri.parse('/registrar');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      tag: swaggerMetaData,
    );
    return client.send<PostRegistarRes, PostRegistarRes>($request);
  }

  @override
  Future<Response<GetUsuarioMutiroesRes>> _getUsuarioMutiroes({
    required int usuarioID,
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
  }) {
    final Uri $url = Uri.parse('/usuario/${usuarioID}/mutiroes');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      tag: swaggerMetaData,
    );
    return client.send<GetUsuarioMutiroesRes, GetUsuarioMutiroesRes>($request);
  }

  @override
  Future<Response<List<SafeUsuario>>> _getUsuarios({
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
  }) {
    final Uri $url = Uri.parse('/usuarios');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      tag: swaggerMetaData,
    );
    return client.send<List<SafeUsuario>, SafeUsuario>($request);
  }

  @override
  Future<Response<DelUserRes>> _deleteUsuario({
    required int id,
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
  }) {
    final Uri $url = Uri.parse('/usuarios/${id}');
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
      tag: swaggerMetaData,
    );
    return client.send<DelUserRes, DelUserRes>($request);
  }
}
