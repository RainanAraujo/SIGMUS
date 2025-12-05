// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $MutiroesTable extends Mutiroes with TableInfo<$MutiroesTable, Mutirao> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MutiroesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _tipoMeta = const VerificationMeta('tipo');
  @override
  late final GeneratedColumn<String> tipo = GeneratedColumn<String>(
    'tipo',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dataInicioMeta = const VerificationMeta(
    'dataInicio',
  );
  @override
  late final GeneratedColumn<String> dataInicio = GeneratedColumn<String>(
    'data_inicio',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dataFinalMeta = const VerificationMeta(
    'dataFinal',
  );
  @override
  late final GeneratedColumn<String> dataFinal = GeneratedColumn<String>(
    'data_final',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _estadoMeta = const VerificationMeta('estado');
  @override
  late final GeneratedColumn<String> estado = GeneratedColumn<String>(
    'estado',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _municipioMeta = const VerificationMeta(
    'municipio',
  );
  @override
  late final GeneratedColumn<String> municipio = GeneratedColumn<String>(
    'municipio',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _localMeta = const VerificationMeta('local');
  @override
  late final GeneratedColumn<String> local = GeneratedColumn<String>(
    'local',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _demandanteMeta = const VerificationMeta(
    'demandante',
  );
  @override
  late final GeneratedColumn<String> demandante = GeneratedColumn<String>(
    'demandante',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _contratanteMeta = const VerificationMeta(
    'contratante',
  );
  @override
  late final GeneratedColumn<String> contratante = GeneratedColumn<String>(
    'contratante',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _atualizadoEmMeta = const VerificationMeta(
    'atualizadoEm',
  );
  @override
  late final GeneratedColumn<int> atualizadoEm = GeneratedColumn<int>(
    'atualizado_em',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<int> status = GeneratedColumn<int>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    tipo,
    dataInicio,
    dataFinal,
    estado,
    municipio,
    local,
    demandante,
    contratante,
    atualizadoEm,
    status,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'mutiroes';
  @override
  VerificationContext validateIntegrity(
    Insertable<Mutirao> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('tipo')) {
      context.handle(
        _tipoMeta,
        tipo.isAcceptableOrUnknown(data['tipo']!, _tipoMeta),
      );
    } else if (isInserting) {
      context.missing(_tipoMeta);
    }
    if (data.containsKey('data_inicio')) {
      context.handle(
        _dataInicioMeta,
        dataInicio.isAcceptableOrUnknown(data['data_inicio']!, _dataInicioMeta),
      );
    } else if (isInserting) {
      context.missing(_dataInicioMeta);
    }
    if (data.containsKey('data_final')) {
      context.handle(
        _dataFinalMeta,
        dataFinal.isAcceptableOrUnknown(data['data_final']!, _dataFinalMeta),
      );
    } else if (isInserting) {
      context.missing(_dataFinalMeta);
    }
    if (data.containsKey('estado')) {
      context.handle(
        _estadoMeta,
        estado.isAcceptableOrUnknown(data['estado']!, _estadoMeta),
      );
    } else if (isInserting) {
      context.missing(_estadoMeta);
    }
    if (data.containsKey('municipio')) {
      context.handle(
        _municipioMeta,
        municipio.isAcceptableOrUnknown(data['municipio']!, _municipioMeta),
      );
    } else if (isInserting) {
      context.missing(_municipioMeta);
    }
    if (data.containsKey('local')) {
      context.handle(
        _localMeta,
        local.isAcceptableOrUnknown(data['local']!, _localMeta),
      );
    } else if (isInserting) {
      context.missing(_localMeta);
    }
    if (data.containsKey('demandante')) {
      context.handle(
        _demandanteMeta,
        demandante.isAcceptableOrUnknown(data['demandante']!, _demandanteMeta),
      );
    } else if (isInserting) {
      context.missing(_demandanteMeta);
    }
    if (data.containsKey('contratante')) {
      context.handle(
        _contratanteMeta,
        contratante.isAcceptableOrUnknown(
          data['contratante']!,
          _contratanteMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_contratanteMeta);
    }
    if (data.containsKey('atualizado_em')) {
      context.handle(
        _atualizadoEmMeta,
        atualizadoEm.isAcceptableOrUnknown(
          data['atualizado_em']!,
          _atualizadoEmMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_atualizadoEmMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Mutirao map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Mutirao(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      tipo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tipo'],
      )!,
      dataInicio: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}data_inicio'],
      )!,
      dataFinal: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}data_final'],
      )!,
      estado: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}estado'],
      )!,
      municipio: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}municipio'],
      )!,
      local: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}local'],
      )!,
      demandante: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}demandante'],
      )!,
      contratante: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}contratante'],
      )!,
      atualizadoEm: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}atualizado_em'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}status'],
      )!,
    );
  }

  @override
  $MutiroesTable createAlias(String alias) {
    return $MutiroesTable(attachedDatabase, alias);
  }
}

class Mutirao extends DataClass implements Insertable<Mutirao> {
  final int id;
  final String tipo;
  final String dataInicio;
  final String dataFinal;
  final String estado;
  final String municipio;
  final String local;
  final String demandante;
  final String contratante;
  final int atualizadoEm;
  final int status;
  const Mutirao({
    required this.id,
    required this.tipo,
    required this.dataInicio,
    required this.dataFinal,
    required this.estado,
    required this.municipio,
    required this.local,
    required this.demandante,
    required this.contratante,
    required this.atualizadoEm,
    required this.status,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['tipo'] = Variable<String>(tipo);
    map['data_inicio'] = Variable<String>(dataInicio);
    map['data_final'] = Variable<String>(dataFinal);
    map['estado'] = Variable<String>(estado);
    map['municipio'] = Variable<String>(municipio);
    map['local'] = Variable<String>(local);
    map['demandante'] = Variable<String>(demandante);
    map['contratante'] = Variable<String>(contratante);
    map['atualizado_em'] = Variable<int>(atualizadoEm);
    map['status'] = Variable<int>(status);
    return map;
  }

  MutiroesCompanion toCompanion(bool nullToAbsent) {
    return MutiroesCompanion(
      id: Value(id),
      tipo: Value(tipo),
      dataInicio: Value(dataInicio),
      dataFinal: Value(dataFinal),
      estado: Value(estado),
      municipio: Value(municipio),
      local: Value(local),
      demandante: Value(demandante),
      contratante: Value(contratante),
      atualizadoEm: Value(atualizadoEm),
      status: Value(status),
    );
  }

  factory Mutirao.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Mutirao(
      id: serializer.fromJson<int>(json['id']),
      tipo: serializer.fromJson<String>(json['tipo']),
      dataInicio: serializer.fromJson<String>(json['dataInicio']),
      dataFinal: serializer.fromJson<String>(json['dataFinal']),
      estado: serializer.fromJson<String>(json['estado']),
      municipio: serializer.fromJson<String>(json['municipio']),
      local: serializer.fromJson<String>(json['local']),
      demandante: serializer.fromJson<String>(json['demandante']),
      contratante: serializer.fromJson<String>(json['contratante']),
      atualizadoEm: serializer.fromJson<int>(json['atualizadoEm']),
      status: serializer.fromJson<int>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'tipo': serializer.toJson<String>(tipo),
      'dataInicio': serializer.toJson<String>(dataInicio),
      'dataFinal': serializer.toJson<String>(dataFinal),
      'estado': serializer.toJson<String>(estado),
      'municipio': serializer.toJson<String>(municipio),
      'local': serializer.toJson<String>(local),
      'demandante': serializer.toJson<String>(demandante),
      'contratante': serializer.toJson<String>(contratante),
      'atualizadoEm': serializer.toJson<int>(atualizadoEm),
      'status': serializer.toJson<int>(status),
    };
  }

  Mutirao copyWith({
    int? id,
    String? tipo,
    String? dataInicio,
    String? dataFinal,
    String? estado,
    String? municipio,
    String? local,
    String? demandante,
    String? contratante,
    int? atualizadoEm,
    int? status,
  }) => Mutirao(
    id: id ?? this.id,
    tipo: tipo ?? this.tipo,
    dataInicio: dataInicio ?? this.dataInicio,
    dataFinal: dataFinal ?? this.dataFinal,
    estado: estado ?? this.estado,
    municipio: municipio ?? this.municipio,
    local: local ?? this.local,
    demandante: demandante ?? this.demandante,
    contratante: contratante ?? this.contratante,
    atualizadoEm: atualizadoEm ?? this.atualizadoEm,
    status: status ?? this.status,
  );
  Mutirao copyWithCompanion(MutiroesCompanion data) {
    return Mutirao(
      id: data.id.present ? data.id.value : this.id,
      tipo: data.tipo.present ? data.tipo.value : this.tipo,
      dataInicio: data.dataInicio.present
          ? data.dataInicio.value
          : this.dataInicio,
      dataFinal: data.dataFinal.present ? data.dataFinal.value : this.dataFinal,
      estado: data.estado.present ? data.estado.value : this.estado,
      municipio: data.municipio.present ? data.municipio.value : this.municipio,
      local: data.local.present ? data.local.value : this.local,
      demandante: data.demandante.present
          ? data.demandante.value
          : this.demandante,
      contratante: data.contratante.present
          ? data.contratante.value
          : this.contratante,
      atualizadoEm: data.atualizadoEm.present
          ? data.atualizadoEm.value
          : this.atualizadoEm,
      status: data.status.present ? data.status.value : this.status,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Mutirao(')
          ..write('id: $id, ')
          ..write('tipo: $tipo, ')
          ..write('dataInicio: $dataInicio, ')
          ..write('dataFinal: $dataFinal, ')
          ..write('estado: $estado, ')
          ..write('municipio: $municipio, ')
          ..write('local: $local, ')
          ..write('demandante: $demandante, ')
          ..write('contratante: $contratante, ')
          ..write('atualizadoEm: $atualizadoEm, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    tipo,
    dataInicio,
    dataFinal,
    estado,
    municipio,
    local,
    demandante,
    contratante,
    atualizadoEm,
    status,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Mutirao &&
          other.id == this.id &&
          other.tipo == this.tipo &&
          other.dataInicio == this.dataInicio &&
          other.dataFinal == this.dataFinal &&
          other.estado == this.estado &&
          other.municipio == this.municipio &&
          other.local == this.local &&
          other.demandante == this.demandante &&
          other.contratante == this.contratante &&
          other.atualizadoEm == this.atualizadoEm &&
          other.status == this.status);
}

class MutiroesCompanion extends UpdateCompanion<Mutirao> {
  final Value<int> id;
  final Value<String> tipo;
  final Value<String> dataInicio;
  final Value<String> dataFinal;
  final Value<String> estado;
  final Value<String> municipio;
  final Value<String> local;
  final Value<String> demandante;
  final Value<String> contratante;
  final Value<int> atualizadoEm;
  final Value<int> status;
  const MutiroesCompanion({
    this.id = const Value.absent(),
    this.tipo = const Value.absent(),
    this.dataInicio = const Value.absent(),
    this.dataFinal = const Value.absent(),
    this.estado = const Value.absent(),
    this.municipio = const Value.absent(),
    this.local = const Value.absent(),
    this.demandante = const Value.absent(),
    this.contratante = const Value.absent(),
    this.atualizadoEm = const Value.absent(),
    this.status = const Value.absent(),
  });
  MutiroesCompanion.insert({
    this.id = const Value.absent(),
    required String tipo,
    required String dataInicio,
    required String dataFinal,
    required String estado,
    required String municipio,
    required String local,
    required String demandante,
    required String contratante,
    required int atualizadoEm,
    this.status = const Value.absent(),
  }) : tipo = Value(tipo),
       dataInicio = Value(dataInicio),
       dataFinal = Value(dataFinal),
       estado = Value(estado),
       municipio = Value(municipio),
       local = Value(local),
       demandante = Value(demandante),
       contratante = Value(contratante),
       atualizadoEm = Value(atualizadoEm);
  static Insertable<Mutirao> custom({
    Expression<int>? id,
    Expression<String>? tipo,
    Expression<String>? dataInicio,
    Expression<String>? dataFinal,
    Expression<String>? estado,
    Expression<String>? municipio,
    Expression<String>? local,
    Expression<String>? demandante,
    Expression<String>? contratante,
    Expression<int>? atualizadoEm,
    Expression<int>? status,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (tipo != null) 'tipo': tipo,
      if (dataInicio != null) 'data_inicio': dataInicio,
      if (dataFinal != null) 'data_final': dataFinal,
      if (estado != null) 'estado': estado,
      if (municipio != null) 'municipio': municipio,
      if (local != null) 'local': local,
      if (demandante != null) 'demandante': demandante,
      if (contratante != null) 'contratante': contratante,
      if (atualizadoEm != null) 'atualizado_em': atualizadoEm,
      if (status != null) 'status': status,
    });
  }

  MutiroesCompanion copyWith({
    Value<int>? id,
    Value<String>? tipo,
    Value<String>? dataInicio,
    Value<String>? dataFinal,
    Value<String>? estado,
    Value<String>? municipio,
    Value<String>? local,
    Value<String>? demandante,
    Value<String>? contratante,
    Value<int>? atualizadoEm,
    Value<int>? status,
  }) {
    return MutiroesCompanion(
      id: id ?? this.id,
      tipo: tipo ?? this.tipo,
      dataInicio: dataInicio ?? this.dataInicio,
      dataFinal: dataFinal ?? this.dataFinal,
      estado: estado ?? this.estado,
      municipio: municipio ?? this.municipio,
      local: local ?? this.local,
      demandante: demandante ?? this.demandante,
      contratante: contratante ?? this.contratante,
      atualizadoEm: atualizadoEm ?? this.atualizadoEm,
      status: status ?? this.status,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (tipo.present) {
      map['tipo'] = Variable<String>(tipo.value);
    }
    if (dataInicio.present) {
      map['data_inicio'] = Variable<String>(dataInicio.value);
    }
    if (dataFinal.present) {
      map['data_final'] = Variable<String>(dataFinal.value);
    }
    if (estado.present) {
      map['estado'] = Variable<String>(estado.value);
    }
    if (municipio.present) {
      map['municipio'] = Variable<String>(municipio.value);
    }
    if (local.present) {
      map['local'] = Variable<String>(local.value);
    }
    if (demandante.present) {
      map['demandante'] = Variable<String>(demandante.value);
    }
    if (contratante.present) {
      map['contratante'] = Variable<String>(contratante.value);
    }
    if (atualizadoEm.present) {
      map['atualizado_em'] = Variable<int>(atualizadoEm.value);
    }
    if (status.present) {
      map['status'] = Variable<int>(status.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MutiroesCompanion(')
          ..write('id: $id, ')
          ..write('tipo: $tipo, ')
          ..write('dataInicio: $dataInicio, ')
          ..write('dataFinal: $dataFinal, ')
          ..write('estado: $estado, ')
          ..write('municipio: $municipio, ')
          ..write('local: $local, ')
          ..write('demandante: $demandante, ')
          ..write('contratante: $contratante, ')
          ..write('atualizadoEm: $atualizadoEm, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }
}

class $PermissoesTable extends Permissoes
    with TableInfo<$PermissoesTable, Permissao> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PermissoesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _mutiraoIdMeta = const VerificationMeta(
    'mutiraoId',
  );
  @override
  late final GeneratedColumn<int> mutiraoId = GeneratedColumn<int>(
    'mutirao_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'REFERENCES mutiroes(id) ON DELETE CASCADE',
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _permissoesMeta = const VerificationMeta(
    'permissoes',
  );
  @override
  late final GeneratedColumn<String> permissoes = GeneratedColumn<String>(
    'permissoes',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [mutiraoId, email, permissoes];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'permissoes';
  @override
  VerificationContext validateIntegrity(
    Insertable<Permissao> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('mutirao_id')) {
      context.handle(
        _mutiraoIdMeta,
        mutiraoId.isAcceptableOrUnknown(data['mutirao_id']!, _mutiraoIdMeta),
      );
    } else if (isInserting) {
      context.missing(_mutiraoIdMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('permissoes')) {
      context.handle(
        _permissoesMeta,
        permissoes.isAcceptableOrUnknown(data['permissoes']!, _permissoesMeta),
      );
    } else if (isInserting) {
      context.missing(_permissoesMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {mutiraoId, email};
  @override
  Permissao map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Permissao(
      mutiraoId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}mutirao_id'],
      )!,
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      )!,
      permissoes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}permissoes'],
      )!,
    );
  }

  @override
  $PermissoesTable createAlias(String alias) {
    return $PermissoesTable(attachedDatabase, alias);
  }
}

class Permissao extends DataClass implements Insertable<Permissao> {
  final int mutiraoId;
  final String email;
  final String permissoes;
  const Permissao({
    required this.mutiraoId,
    required this.email,
    required this.permissoes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['mutirao_id'] = Variable<int>(mutiraoId);
    map['email'] = Variable<String>(email);
    map['permissoes'] = Variable<String>(permissoes);
    return map;
  }

  PermissoesCompanion toCompanion(bool nullToAbsent) {
    return PermissoesCompanion(
      mutiraoId: Value(mutiraoId),
      email: Value(email),
      permissoes: Value(permissoes),
    );
  }

  factory Permissao.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Permissao(
      mutiraoId: serializer.fromJson<int>(json['mutiraoId']),
      email: serializer.fromJson<String>(json['email']),
      permissoes: serializer.fromJson<String>(json['permissoes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'mutiraoId': serializer.toJson<int>(mutiraoId),
      'email': serializer.toJson<String>(email),
      'permissoes': serializer.toJson<String>(permissoes),
    };
  }

  Permissao copyWith({int? mutiraoId, String? email, String? permissoes}) =>
      Permissao(
        mutiraoId: mutiraoId ?? this.mutiraoId,
        email: email ?? this.email,
        permissoes: permissoes ?? this.permissoes,
      );
  Permissao copyWithCompanion(PermissoesCompanion data) {
    return Permissao(
      mutiraoId: data.mutiraoId.present ? data.mutiraoId.value : this.mutiraoId,
      email: data.email.present ? data.email.value : this.email,
      permissoes: data.permissoes.present
          ? data.permissoes.value
          : this.permissoes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Permissao(')
          ..write('mutiraoId: $mutiraoId, ')
          ..write('email: $email, ')
          ..write('permissoes: $permissoes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(mutiraoId, email, permissoes);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Permissao &&
          other.mutiraoId == this.mutiraoId &&
          other.email == this.email &&
          other.permissoes == this.permissoes);
}

class PermissoesCompanion extends UpdateCompanion<Permissao> {
  final Value<int> mutiraoId;
  final Value<String> email;
  final Value<String> permissoes;
  final Value<int> rowid;
  const PermissoesCompanion({
    this.mutiraoId = const Value.absent(),
    this.email = const Value.absent(),
    this.permissoes = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PermissoesCompanion.insert({
    required int mutiraoId,
    required String email,
    required String permissoes,
    this.rowid = const Value.absent(),
  }) : mutiraoId = Value(mutiraoId),
       email = Value(email),
       permissoes = Value(permissoes);
  static Insertable<Permissao> custom({
    Expression<int>? mutiraoId,
    Expression<String>? email,
    Expression<String>? permissoes,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (mutiraoId != null) 'mutirao_id': mutiraoId,
      if (email != null) 'email': email,
      if (permissoes != null) 'permissoes': permissoes,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PermissoesCompanion copyWith({
    Value<int>? mutiraoId,
    Value<String>? email,
    Value<String>? permissoes,
    Value<int>? rowid,
  }) {
    return PermissoesCompanion(
      mutiraoId: mutiraoId ?? this.mutiraoId,
      email: email ?? this.email,
      permissoes: permissoes ?? this.permissoes,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (mutiraoId.present) {
      map['mutirao_id'] = Variable<int>(mutiraoId.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (permissoes.present) {
      map['permissoes'] = Variable<String>(permissoes.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PermissoesCompanion(')
          ..write('mutiraoId: $mutiraoId, ')
          ..write('email: $email, ')
          ..write('permissoes: $permissoes, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ColaboradoresTable extends Colaboradores
    with TableInfo<$ColaboradoresTable, Colaborador> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ColaboradoresTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _mutiraoIdMeta = const VerificationMeta(
    'mutiraoId',
  );
  @override
  late final GeneratedColumn<int> mutiraoId = GeneratedColumn<int>(
    'mutirao_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nomeMeta = const VerificationMeta('nome');
  @override
  late final GeneratedColumn<String> nome = GeneratedColumn<String>(
    'nome',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _funcaoMeta = const VerificationMeta('funcao');
  @override
  late final GeneratedColumn<String> funcao = GeneratedColumn<String>(
    'funcao',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _atualizadoEmMeta = const VerificationMeta(
    'atualizadoEm',
  );
  @override
  late final GeneratedColumn<int> atualizadoEm = GeneratedColumn<int>(
    'atualizado_em',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<int> status = GeneratedColumn<int>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    mutiraoId,
    nome,
    funcao,
    atualizadoEm,
    status,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'colaboradores';
  @override
  VerificationContext validateIntegrity(
    Insertable<Colaborador> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('mutirao_id')) {
      context.handle(
        _mutiraoIdMeta,
        mutiraoId.isAcceptableOrUnknown(data['mutirao_id']!, _mutiraoIdMeta),
      );
    } else if (isInserting) {
      context.missing(_mutiraoIdMeta);
    }
    if (data.containsKey('nome')) {
      context.handle(
        _nomeMeta,
        nome.isAcceptableOrUnknown(data['nome']!, _nomeMeta),
      );
    } else if (isInserting) {
      context.missing(_nomeMeta);
    }
    if (data.containsKey('funcao')) {
      context.handle(
        _funcaoMeta,
        funcao.isAcceptableOrUnknown(data['funcao']!, _funcaoMeta),
      );
    } else if (isInserting) {
      context.missing(_funcaoMeta);
    }
    if (data.containsKey('atualizado_em')) {
      context.handle(
        _atualizadoEmMeta,
        atualizadoEm.isAcceptableOrUnknown(
          data['atualizado_em']!,
          _atualizadoEmMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_atualizadoEmMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Colaborador map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Colaborador(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      mutiraoId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}mutirao_id'],
      )!,
      nome: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nome'],
      )!,
      funcao: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}funcao'],
      )!,
      atualizadoEm: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}atualizado_em'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}status'],
      )!,
    );
  }

  @override
  $ColaboradoresTable createAlias(String alias) {
    return $ColaboradoresTable(attachedDatabase, alias);
  }
}

class Colaborador extends DataClass implements Insertable<Colaborador> {
  final int id;
  final int mutiraoId;
  final String nome;
  final String funcao;
  final int atualizadoEm;
  final int status;
  const Colaborador({
    required this.id,
    required this.mutiraoId,
    required this.nome,
    required this.funcao,
    required this.atualizadoEm,
    required this.status,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['mutirao_id'] = Variable<int>(mutiraoId);
    map['nome'] = Variable<String>(nome);
    map['funcao'] = Variable<String>(funcao);
    map['atualizado_em'] = Variable<int>(atualizadoEm);
    map['status'] = Variable<int>(status);
    return map;
  }

  ColaboradoresCompanion toCompanion(bool nullToAbsent) {
    return ColaboradoresCompanion(
      id: Value(id),
      mutiraoId: Value(mutiraoId),
      nome: Value(nome),
      funcao: Value(funcao),
      atualizadoEm: Value(atualizadoEm),
      status: Value(status),
    );
  }

  factory Colaborador.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Colaborador(
      id: serializer.fromJson<int>(json['id']),
      mutiraoId: serializer.fromJson<int>(json['mutiraoId']),
      nome: serializer.fromJson<String>(json['nome']),
      funcao: serializer.fromJson<String>(json['funcao']),
      atualizadoEm: serializer.fromJson<int>(json['atualizadoEm']),
      status: serializer.fromJson<int>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'mutiraoId': serializer.toJson<int>(mutiraoId),
      'nome': serializer.toJson<String>(nome),
      'funcao': serializer.toJson<String>(funcao),
      'atualizadoEm': serializer.toJson<int>(atualizadoEm),
      'status': serializer.toJson<int>(status),
    };
  }

  Colaborador copyWith({
    int? id,
    int? mutiraoId,
    String? nome,
    String? funcao,
    int? atualizadoEm,
    int? status,
  }) => Colaborador(
    id: id ?? this.id,
    mutiraoId: mutiraoId ?? this.mutiraoId,
    nome: nome ?? this.nome,
    funcao: funcao ?? this.funcao,
    atualizadoEm: atualizadoEm ?? this.atualizadoEm,
    status: status ?? this.status,
  );
  Colaborador copyWithCompanion(ColaboradoresCompanion data) {
    return Colaborador(
      id: data.id.present ? data.id.value : this.id,
      mutiraoId: data.mutiraoId.present ? data.mutiraoId.value : this.mutiraoId,
      nome: data.nome.present ? data.nome.value : this.nome,
      funcao: data.funcao.present ? data.funcao.value : this.funcao,
      atualizadoEm: data.atualizadoEm.present
          ? data.atualizadoEm.value
          : this.atualizadoEm,
      status: data.status.present ? data.status.value : this.status,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Colaborador(')
          ..write('id: $id, ')
          ..write('mutiraoId: $mutiraoId, ')
          ..write('nome: $nome, ')
          ..write('funcao: $funcao, ')
          ..write('atualizadoEm: $atualizadoEm, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, mutiraoId, nome, funcao, atualizadoEm, status);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Colaborador &&
          other.id == this.id &&
          other.mutiraoId == this.mutiraoId &&
          other.nome == this.nome &&
          other.funcao == this.funcao &&
          other.atualizadoEm == this.atualizadoEm &&
          other.status == this.status);
}

class ColaboradoresCompanion extends UpdateCompanion<Colaborador> {
  final Value<int> id;
  final Value<int> mutiraoId;
  final Value<String> nome;
  final Value<String> funcao;
  final Value<int> atualizadoEm;
  final Value<int> status;
  const ColaboradoresCompanion({
    this.id = const Value.absent(),
    this.mutiraoId = const Value.absent(),
    this.nome = const Value.absent(),
    this.funcao = const Value.absent(),
    this.atualizadoEm = const Value.absent(),
    this.status = const Value.absent(),
  });
  ColaboradoresCompanion.insert({
    this.id = const Value.absent(),
    required int mutiraoId,
    required String nome,
    required String funcao,
    required int atualizadoEm,
    this.status = const Value.absent(),
  }) : mutiraoId = Value(mutiraoId),
       nome = Value(nome),
       funcao = Value(funcao),
       atualizadoEm = Value(atualizadoEm);
  static Insertable<Colaborador> custom({
    Expression<int>? id,
    Expression<int>? mutiraoId,
    Expression<String>? nome,
    Expression<String>? funcao,
    Expression<int>? atualizadoEm,
    Expression<int>? status,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (mutiraoId != null) 'mutirao_id': mutiraoId,
      if (nome != null) 'nome': nome,
      if (funcao != null) 'funcao': funcao,
      if (atualizadoEm != null) 'atualizado_em': atualizadoEm,
      if (status != null) 'status': status,
    });
  }

  ColaboradoresCompanion copyWith({
    Value<int>? id,
    Value<int>? mutiraoId,
    Value<String>? nome,
    Value<String>? funcao,
    Value<int>? atualizadoEm,
    Value<int>? status,
  }) {
    return ColaboradoresCompanion(
      id: id ?? this.id,
      mutiraoId: mutiraoId ?? this.mutiraoId,
      nome: nome ?? this.nome,
      funcao: funcao ?? this.funcao,
      atualizadoEm: atualizadoEm ?? this.atualizadoEm,
      status: status ?? this.status,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (mutiraoId.present) {
      map['mutirao_id'] = Variable<int>(mutiraoId.value);
    }
    if (nome.present) {
      map['nome'] = Variable<String>(nome.value);
    }
    if (funcao.present) {
      map['funcao'] = Variable<String>(funcao.value);
    }
    if (atualizadoEm.present) {
      map['atualizado_em'] = Variable<int>(atualizadoEm.value);
    }
    if (status.present) {
      map['status'] = Variable<int>(status.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ColaboradoresCompanion(')
          ..write('id: $id, ')
          ..write('mutiraoId: $mutiraoId, ')
          ..write('nome: $nome, ')
          ..write('funcao: $funcao, ')
          ..write('atualizadoEm: $atualizadoEm, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }
}

class $PacientesTable extends Pacientes
    with TableInfo<$PacientesTable, Paciente> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PacientesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _cpfMeta = const VerificationMeta('cpf');
  @override
  late final GeneratedColumn<String> cpf = GeneratedColumn<String>(
    'cpf',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _cnsMeta = const VerificationMeta('cns');
  @override
  late final GeneratedColumn<String> cns = GeneratedColumn<String>(
    'cns',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nomeMeta = const VerificationMeta('nome');
  @override
  late final GeneratedColumn<String> nome = GeneratedColumn<String>(
    'nome',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _telMeta = const VerificationMeta('tel');
  @override
  late final GeneratedColumn<String> tel = GeneratedColumn<String>(
    'tel',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _dataNascimentoMeta = const VerificationMeta(
    'dataNascimento',
  );
  @override
  late final GeneratedColumn<String> dataNascimento = GeneratedColumn<String>(
    'data_nascimento',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ufMeta = const VerificationMeta('uf');
  @override
  late final GeneratedColumn<String> uf = GeneratedColumn<String>(
    'uf',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _municipioMeta = const VerificationMeta(
    'municipio',
  );
  @override
  late final GeneratedColumn<String> municipio = GeneratedColumn<String>(
    'municipio',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _enderecoMeta = const VerificationMeta(
    'endereco',
  );
  @override
  late final GeneratedColumn<String> endereco = GeneratedColumn<String>(
    'endereco',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nomeDaMaeMeta = const VerificationMeta(
    'nomeDaMae',
  );
  @override
  late final GeneratedColumn<String> nomeDaMae = GeneratedColumn<String>(
    'nome_da_mae',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _atualizadoEmMeta = const VerificationMeta(
    'atualizadoEm',
  );
  @override
  late final GeneratedColumn<int> atualizadoEm = GeneratedColumn<int>(
    'atualizado_em',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<int> status = GeneratedColumn<int>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    cpf,
    cns,
    nome,
    tel,
    dataNascimento,
    uf,
    municipio,
    endereco,
    nomeDaMae,
    atualizadoEm,
    status,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pacientes';
  @override
  VerificationContext validateIntegrity(
    Insertable<Paciente> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('cpf')) {
      context.handle(
        _cpfMeta,
        cpf.isAcceptableOrUnknown(data['cpf']!, _cpfMeta),
      );
    }
    if (data.containsKey('cns')) {
      context.handle(
        _cnsMeta,
        cns.isAcceptableOrUnknown(data['cns']!, _cnsMeta),
      );
    }
    if (data.containsKey('nome')) {
      context.handle(
        _nomeMeta,
        nome.isAcceptableOrUnknown(data['nome']!, _nomeMeta),
      );
    }
    if (data.containsKey('tel')) {
      context.handle(
        _telMeta,
        tel.isAcceptableOrUnknown(data['tel']!, _telMeta),
      );
    }
    if (data.containsKey('data_nascimento')) {
      context.handle(
        _dataNascimentoMeta,
        dataNascimento.isAcceptableOrUnknown(
          data['data_nascimento']!,
          _dataNascimentoMeta,
        ),
      );
    }
    if (data.containsKey('uf')) {
      context.handle(_ufMeta, uf.isAcceptableOrUnknown(data['uf']!, _ufMeta));
    }
    if (data.containsKey('municipio')) {
      context.handle(
        _municipioMeta,
        municipio.isAcceptableOrUnknown(data['municipio']!, _municipioMeta),
      );
    }
    if (data.containsKey('endereco')) {
      context.handle(
        _enderecoMeta,
        endereco.isAcceptableOrUnknown(data['endereco']!, _enderecoMeta),
      );
    }
    if (data.containsKey('nome_da_mae')) {
      context.handle(
        _nomeDaMaeMeta,
        nomeDaMae.isAcceptableOrUnknown(data['nome_da_mae']!, _nomeDaMaeMeta),
      );
    }
    if (data.containsKey('atualizado_em')) {
      context.handle(
        _atualizadoEmMeta,
        atualizadoEm.isAcceptableOrUnknown(
          data['atualizado_em']!,
          _atualizadoEmMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_atualizadoEmMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Paciente map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Paciente(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      cpf: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cpf'],
      ),
      cns: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cns'],
      ),
      nome: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nome'],
      ),
      tel: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tel'],
      ),
      dataNascimento: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}data_nascimento'],
      ),
      uf: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}uf'],
      ),
      municipio: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}municipio'],
      ),
      endereco: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}endereco'],
      ),
      nomeDaMae: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nome_da_mae'],
      ),
      atualizadoEm: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}atualizado_em'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}status'],
      )!,
    );
  }

  @override
  $PacientesTable createAlias(String alias) {
    return $PacientesTable(attachedDatabase, alias);
  }
}

class Paciente extends DataClass implements Insertable<Paciente> {
  final int id;
  final String? cpf;
  final String? cns;
  final String? nome;
  final String? tel;
  final String? dataNascimento;
  final String? uf;
  final String? municipio;
  final String? endereco;
  final String? nomeDaMae;
  final int atualizadoEm;
  final int status;
  const Paciente({
    required this.id,
    this.cpf,
    this.cns,
    this.nome,
    this.tel,
    this.dataNascimento,
    this.uf,
    this.municipio,
    this.endereco,
    this.nomeDaMae,
    required this.atualizadoEm,
    required this.status,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || cpf != null) {
      map['cpf'] = Variable<String>(cpf);
    }
    if (!nullToAbsent || cns != null) {
      map['cns'] = Variable<String>(cns);
    }
    if (!nullToAbsent || nome != null) {
      map['nome'] = Variable<String>(nome);
    }
    if (!nullToAbsent || tel != null) {
      map['tel'] = Variable<String>(tel);
    }
    if (!nullToAbsent || dataNascimento != null) {
      map['data_nascimento'] = Variable<String>(dataNascimento);
    }
    if (!nullToAbsent || uf != null) {
      map['uf'] = Variable<String>(uf);
    }
    if (!nullToAbsent || municipio != null) {
      map['municipio'] = Variable<String>(municipio);
    }
    if (!nullToAbsent || endereco != null) {
      map['endereco'] = Variable<String>(endereco);
    }
    if (!nullToAbsent || nomeDaMae != null) {
      map['nome_da_mae'] = Variable<String>(nomeDaMae);
    }
    map['atualizado_em'] = Variable<int>(atualizadoEm);
    map['status'] = Variable<int>(status);
    return map;
  }

  PacientesCompanion toCompanion(bool nullToAbsent) {
    return PacientesCompanion(
      id: Value(id),
      cpf: cpf == null && nullToAbsent ? const Value.absent() : Value(cpf),
      cns: cns == null && nullToAbsent ? const Value.absent() : Value(cns),
      nome: nome == null && nullToAbsent ? const Value.absent() : Value(nome),
      tel: tel == null && nullToAbsent ? const Value.absent() : Value(tel),
      dataNascimento: dataNascimento == null && nullToAbsent
          ? const Value.absent()
          : Value(dataNascimento),
      uf: uf == null && nullToAbsent ? const Value.absent() : Value(uf),
      municipio: municipio == null && nullToAbsent
          ? const Value.absent()
          : Value(municipio),
      endereco: endereco == null && nullToAbsent
          ? const Value.absent()
          : Value(endereco),
      nomeDaMae: nomeDaMae == null && nullToAbsent
          ? const Value.absent()
          : Value(nomeDaMae),
      atualizadoEm: Value(atualizadoEm),
      status: Value(status),
    );
  }

  factory Paciente.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Paciente(
      id: serializer.fromJson<int>(json['id']),
      cpf: serializer.fromJson<String?>(json['cpf']),
      cns: serializer.fromJson<String?>(json['cns']),
      nome: serializer.fromJson<String?>(json['nome']),
      tel: serializer.fromJson<String?>(json['tel']),
      dataNascimento: serializer.fromJson<String?>(json['dataNascimento']),
      uf: serializer.fromJson<String?>(json['uf']),
      municipio: serializer.fromJson<String?>(json['municipio']),
      endereco: serializer.fromJson<String?>(json['endereco']),
      nomeDaMae: serializer.fromJson<String?>(json['nomeDaMae']),
      atualizadoEm: serializer.fromJson<int>(json['atualizadoEm']),
      status: serializer.fromJson<int>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'cpf': serializer.toJson<String?>(cpf),
      'cns': serializer.toJson<String?>(cns),
      'nome': serializer.toJson<String?>(nome),
      'tel': serializer.toJson<String?>(tel),
      'dataNascimento': serializer.toJson<String?>(dataNascimento),
      'uf': serializer.toJson<String?>(uf),
      'municipio': serializer.toJson<String?>(municipio),
      'endereco': serializer.toJson<String?>(endereco),
      'nomeDaMae': serializer.toJson<String?>(nomeDaMae),
      'atualizadoEm': serializer.toJson<int>(atualizadoEm),
      'status': serializer.toJson<int>(status),
    };
  }

  Paciente copyWith({
    int? id,
    Value<String?> cpf = const Value.absent(),
    Value<String?> cns = const Value.absent(),
    Value<String?> nome = const Value.absent(),
    Value<String?> tel = const Value.absent(),
    Value<String?> dataNascimento = const Value.absent(),
    Value<String?> uf = const Value.absent(),
    Value<String?> municipio = const Value.absent(),
    Value<String?> endereco = const Value.absent(),
    Value<String?> nomeDaMae = const Value.absent(),
    int? atualizadoEm,
    int? status,
  }) => Paciente(
    id: id ?? this.id,
    cpf: cpf.present ? cpf.value : this.cpf,
    cns: cns.present ? cns.value : this.cns,
    nome: nome.present ? nome.value : this.nome,
    tel: tel.present ? tel.value : this.tel,
    dataNascimento: dataNascimento.present
        ? dataNascimento.value
        : this.dataNascimento,
    uf: uf.present ? uf.value : this.uf,
    municipio: municipio.present ? municipio.value : this.municipio,
    endereco: endereco.present ? endereco.value : this.endereco,
    nomeDaMae: nomeDaMae.present ? nomeDaMae.value : this.nomeDaMae,
    atualizadoEm: atualizadoEm ?? this.atualizadoEm,
    status: status ?? this.status,
  );
  Paciente copyWithCompanion(PacientesCompanion data) {
    return Paciente(
      id: data.id.present ? data.id.value : this.id,
      cpf: data.cpf.present ? data.cpf.value : this.cpf,
      cns: data.cns.present ? data.cns.value : this.cns,
      nome: data.nome.present ? data.nome.value : this.nome,
      tel: data.tel.present ? data.tel.value : this.tel,
      dataNascimento: data.dataNascimento.present
          ? data.dataNascimento.value
          : this.dataNascimento,
      uf: data.uf.present ? data.uf.value : this.uf,
      municipio: data.municipio.present ? data.municipio.value : this.municipio,
      endereco: data.endereco.present ? data.endereco.value : this.endereco,
      nomeDaMae: data.nomeDaMae.present ? data.nomeDaMae.value : this.nomeDaMae,
      atualizadoEm: data.atualizadoEm.present
          ? data.atualizadoEm.value
          : this.atualizadoEm,
      status: data.status.present ? data.status.value : this.status,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Paciente(')
          ..write('id: $id, ')
          ..write('cpf: $cpf, ')
          ..write('cns: $cns, ')
          ..write('nome: $nome, ')
          ..write('tel: $tel, ')
          ..write('dataNascimento: $dataNascimento, ')
          ..write('uf: $uf, ')
          ..write('municipio: $municipio, ')
          ..write('endereco: $endereco, ')
          ..write('nomeDaMae: $nomeDaMae, ')
          ..write('atualizadoEm: $atualizadoEm, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    cpf,
    cns,
    nome,
    tel,
    dataNascimento,
    uf,
    municipio,
    endereco,
    nomeDaMae,
    atualizadoEm,
    status,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Paciente &&
          other.id == this.id &&
          other.cpf == this.cpf &&
          other.cns == this.cns &&
          other.nome == this.nome &&
          other.tel == this.tel &&
          other.dataNascimento == this.dataNascimento &&
          other.uf == this.uf &&
          other.municipio == this.municipio &&
          other.endereco == this.endereco &&
          other.nomeDaMae == this.nomeDaMae &&
          other.atualizadoEm == this.atualizadoEm &&
          other.status == this.status);
}

class PacientesCompanion extends UpdateCompanion<Paciente> {
  final Value<int> id;
  final Value<String?> cpf;
  final Value<String?> cns;
  final Value<String?> nome;
  final Value<String?> tel;
  final Value<String?> dataNascimento;
  final Value<String?> uf;
  final Value<String?> municipio;
  final Value<String?> endereco;
  final Value<String?> nomeDaMae;
  final Value<int> atualizadoEm;
  final Value<int> status;
  const PacientesCompanion({
    this.id = const Value.absent(),
    this.cpf = const Value.absent(),
    this.cns = const Value.absent(),
    this.nome = const Value.absent(),
    this.tel = const Value.absent(),
    this.dataNascimento = const Value.absent(),
    this.uf = const Value.absent(),
    this.municipio = const Value.absent(),
    this.endereco = const Value.absent(),
    this.nomeDaMae = const Value.absent(),
    this.atualizadoEm = const Value.absent(),
    this.status = const Value.absent(),
  });
  PacientesCompanion.insert({
    this.id = const Value.absent(),
    this.cpf = const Value.absent(),
    this.cns = const Value.absent(),
    this.nome = const Value.absent(),
    this.tel = const Value.absent(),
    this.dataNascimento = const Value.absent(),
    this.uf = const Value.absent(),
    this.municipio = const Value.absent(),
    this.endereco = const Value.absent(),
    this.nomeDaMae = const Value.absent(),
    required int atualizadoEm,
    this.status = const Value.absent(),
  }) : atualizadoEm = Value(atualizadoEm);
  static Insertable<Paciente> custom({
    Expression<int>? id,
    Expression<String>? cpf,
    Expression<String>? cns,
    Expression<String>? nome,
    Expression<String>? tel,
    Expression<String>? dataNascimento,
    Expression<String>? uf,
    Expression<String>? municipio,
    Expression<String>? endereco,
    Expression<String>? nomeDaMae,
    Expression<int>? atualizadoEm,
    Expression<int>? status,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (cpf != null) 'cpf': cpf,
      if (cns != null) 'cns': cns,
      if (nome != null) 'nome': nome,
      if (tel != null) 'tel': tel,
      if (dataNascimento != null) 'data_nascimento': dataNascimento,
      if (uf != null) 'uf': uf,
      if (municipio != null) 'municipio': municipio,
      if (endereco != null) 'endereco': endereco,
      if (nomeDaMae != null) 'nome_da_mae': nomeDaMae,
      if (atualizadoEm != null) 'atualizado_em': atualizadoEm,
      if (status != null) 'status': status,
    });
  }

  PacientesCompanion copyWith({
    Value<int>? id,
    Value<String?>? cpf,
    Value<String?>? cns,
    Value<String?>? nome,
    Value<String?>? tel,
    Value<String?>? dataNascimento,
    Value<String?>? uf,
    Value<String?>? municipio,
    Value<String?>? endereco,
    Value<String?>? nomeDaMae,
    Value<int>? atualizadoEm,
    Value<int>? status,
  }) {
    return PacientesCompanion(
      id: id ?? this.id,
      cpf: cpf ?? this.cpf,
      cns: cns ?? this.cns,
      nome: nome ?? this.nome,
      tel: tel ?? this.tel,
      dataNascimento: dataNascimento ?? this.dataNascimento,
      uf: uf ?? this.uf,
      municipio: municipio ?? this.municipio,
      endereco: endereco ?? this.endereco,
      nomeDaMae: nomeDaMae ?? this.nomeDaMae,
      atualizadoEm: atualizadoEm ?? this.atualizadoEm,
      status: status ?? this.status,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (cpf.present) {
      map['cpf'] = Variable<String>(cpf.value);
    }
    if (cns.present) {
      map['cns'] = Variable<String>(cns.value);
    }
    if (nome.present) {
      map['nome'] = Variable<String>(nome.value);
    }
    if (tel.present) {
      map['tel'] = Variable<String>(tel.value);
    }
    if (dataNascimento.present) {
      map['data_nascimento'] = Variable<String>(dataNascimento.value);
    }
    if (uf.present) {
      map['uf'] = Variable<String>(uf.value);
    }
    if (municipio.present) {
      map['municipio'] = Variable<String>(municipio.value);
    }
    if (endereco.present) {
      map['endereco'] = Variable<String>(endereco.value);
    }
    if (nomeDaMae.present) {
      map['nome_da_mae'] = Variable<String>(nomeDaMae.value);
    }
    if (atualizadoEm.present) {
      map['atualizado_em'] = Variable<int>(atualizadoEm.value);
    }
    if (status.present) {
      map['status'] = Variable<int>(status.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PacientesCompanion(')
          ..write('id: $id, ')
          ..write('cpf: $cpf, ')
          ..write('cns: $cns, ')
          ..write('nome: $nome, ')
          ..write('tel: $tel, ')
          ..write('dataNascimento: $dataNascimento, ')
          ..write('uf: $uf, ')
          ..write('municipio: $municipio, ')
          ..write('endereco: $endereco, ')
          ..write('nomeDaMae: $nomeDaMae, ')
          ..write('atualizadoEm: $atualizadoEm, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }
}

class $MedicosTable extends Medicos with TableInfo<$MedicosTable, Medico> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MedicosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _mutiraoIdMeta = const VerificationMeta(
    'mutiraoId',
  );
  @override
  late final GeneratedColumn<int> mutiraoId = GeneratedColumn<int>(
    'mutirao_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES mutiroes (id)',
    ),
  );
  static const VerificationMeta _nomeMeta = const VerificationMeta('nome');
  @override
  late final GeneratedColumn<String> nome = GeneratedColumn<String>(
    'nome',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _crmMeta = const VerificationMeta('crm');
  @override
  late final GeneratedColumn<String> crm = GeneratedColumn<String>(
    'crm',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _atualizadoEmMeta = const VerificationMeta(
    'atualizadoEm',
  );
  @override
  late final GeneratedColumn<int> atualizadoEm = GeneratedColumn<int>(
    'atualizado_em',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<int> status = GeneratedColumn<int>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    mutiraoId,
    nome,
    crm,
    atualizadoEm,
    status,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'medicos';
  @override
  VerificationContext validateIntegrity(
    Insertable<Medico> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('mutirao_id')) {
      context.handle(
        _mutiraoIdMeta,
        mutiraoId.isAcceptableOrUnknown(data['mutirao_id']!, _mutiraoIdMeta),
      );
    } else if (isInserting) {
      context.missing(_mutiraoIdMeta);
    }
    if (data.containsKey('nome')) {
      context.handle(
        _nomeMeta,
        nome.isAcceptableOrUnknown(data['nome']!, _nomeMeta),
      );
    } else if (isInserting) {
      context.missing(_nomeMeta);
    }
    if (data.containsKey('crm')) {
      context.handle(
        _crmMeta,
        crm.isAcceptableOrUnknown(data['crm']!, _crmMeta),
      );
    } else if (isInserting) {
      context.missing(_crmMeta);
    }
    if (data.containsKey('atualizado_em')) {
      context.handle(
        _atualizadoEmMeta,
        atualizadoEm.isAcceptableOrUnknown(
          data['atualizado_em']!,
          _atualizadoEmMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_atualizadoEmMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Medico map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Medico(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      mutiraoId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}mutirao_id'],
      )!,
      nome: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nome'],
      )!,
      crm: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}crm'],
      )!,
      atualizadoEm: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}atualizado_em'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}status'],
      )!,
    );
  }

  @override
  $MedicosTable createAlias(String alias) {
    return $MedicosTable(attachedDatabase, alias);
  }
}

class Medico extends DataClass implements Insertable<Medico> {
  final int id;
  final int mutiraoId;
  final String nome;
  final String crm;
  final int atualizadoEm;
  final int status;
  const Medico({
    required this.id,
    required this.mutiraoId,
    required this.nome,
    required this.crm,
    required this.atualizadoEm,
    required this.status,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['mutirao_id'] = Variable<int>(mutiraoId);
    map['nome'] = Variable<String>(nome);
    map['crm'] = Variable<String>(crm);
    map['atualizado_em'] = Variable<int>(atualizadoEm);
    map['status'] = Variable<int>(status);
    return map;
  }

  MedicosCompanion toCompanion(bool nullToAbsent) {
    return MedicosCompanion(
      id: Value(id),
      mutiraoId: Value(mutiraoId),
      nome: Value(nome),
      crm: Value(crm),
      atualizadoEm: Value(atualizadoEm),
      status: Value(status),
    );
  }

  factory Medico.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Medico(
      id: serializer.fromJson<int>(json['id']),
      mutiraoId: serializer.fromJson<int>(json['mutiraoId']),
      nome: serializer.fromJson<String>(json['nome']),
      crm: serializer.fromJson<String>(json['crm']),
      atualizadoEm: serializer.fromJson<int>(json['atualizadoEm']),
      status: serializer.fromJson<int>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'mutiraoId': serializer.toJson<int>(mutiraoId),
      'nome': serializer.toJson<String>(nome),
      'crm': serializer.toJson<String>(crm),
      'atualizadoEm': serializer.toJson<int>(atualizadoEm),
      'status': serializer.toJson<int>(status),
    };
  }

  Medico copyWith({
    int? id,
    int? mutiraoId,
    String? nome,
    String? crm,
    int? atualizadoEm,
    int? status,
  }) => Medico(
    id: id ?? this.id,
    mutiraoId: mutiraoId ?? this.mutiraoId,
    nome: nome ?? this.nome,
    crm: crm ?? this.crm,
    atualizadoEm: atualizadoEm ?? this.atualizadoEm,
    status: status ?? this.status,
  );
  Medico copyWithCompanion(MedicosCompanion data) {
    return Medico(
      id: data.id.present ? data.id.value : this.id,
      mutiraoId: data.mutiraoId.present ? data.mutiraoId.value : this.mutiraoId,
      nome: data.nome.present ? data.nome.value : this.nome,
      crm: data.crm.present ? data.crm.value : this.crm,
      atualizadoEm: data.atualizadoEm.present
          ? data.atualizadoEm.value
          : this.atualizadoEm,
      status: data.status.present ? data.status.value : this.status,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Medico(')
          ..write('id: $id, ')
          ..write('mutiraoId: $mutiraoId, ')
          ..write('nome: $nome, ')
          ..write('crm: $crm, ')
          ..write('atualizadoEm: $atualizadoEm, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, mutiraoId, nome, crm, atualizadoEm, status);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Medico &&
          other.id == this.id &&
          other.mutiraoId == this.mutiraoId &&
          other.nome == this.nome &&
          other.crm == this.crm &&
          other.atualizadoEm == this.atualizadoEm &&
          other.status == this.status);
}

class MedicosCompanion extends UpdateCompanion<Medico> {
  final Value<int> id;
  final Value<int> mutiraoId;
  final Value<String> nome;
  final Value<String> crm;
  final Value<int> atualizadoEm;
  final Value<int> status;
  const MedicosCompanion({
    this.id = const Value.absent(),
    this.mutiraoId = const Value.absent(),
    this.nome = const Value.absent(),
    this.crm = const Value.absent(),
    this.atualizadoEm = const Value.absent(),
    this.status = const Value.absent(),
  });
  MedicosCompanion.insert({
    this.id = const Value.absent(),
    required int mutiraoId,
    required String nome,
    required String crm,
    required int atualizadoEm,
    this.status = const Value.absent(),
  }) : mutiraoId = Value(mutiraoId),
       nome = Value(nome),
       crm = Value(crm),
       atualizadoEm = Value(atualizadoEm);
  static Insertable<Medico> custom({
    Expression<int>? id,
    Expression<int>? mutiraoId,
    Expression<String>? nome,
    Expression<String>? crm,
    Expression<int>? atualizadoEm,
    Expression<int>? status,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (mutiraoId != null) 'mutirao_id': mutiraoId,
      if (nome != null) 'nome': nome,
      if (crm != null) 'crm': crm,
      if (atualizadoEm != null) 'atualizado_em': atualizadoEm,
      if (status != null) 'status': status,
    });
  }

  MedicosCompanion copyWith({
    Value<int>? id,
    Value<int>? mutiraoId,
    Value<String>? nome,
    Value<String>? crm,
    Value<int>? atualizadoEm,
    Value<int>? status,
  }) {
    return MedicosCompanion(
      id: id ?? this.id,
      mutiraoId: mutiraoId ?? this.mutiraoId,
      nome: nome ?? this.nome,
      crm: crm ?? this.crm,
      atualizadoEm: atualizadoEm ?? this.atualizadoEm,
      status: status ?? this.status,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (mutiraoId.present) {
      map['mutirao_id'] = Variable<int>(mutiraoId.value);
    }
    if (nome.present) {
      map['nome'] = Variable<String>(nome.value);
    }
    if (crm.present) {
      map['crm'] = Variable<String>(crm.value);
    }
    if (atualizadoEm.present) {
      map['atualizado_em'] = Variable<int>(atualizadoEm.value);
    }
    if (status.present) {
      map['status'] = Variable<int>(status.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MedicosCompanion(')
          ..write('id: $id, ')
          ..write('mutiraoId: $mutiraoId, ')
          ..write('nome: $nome, ')
          ..write('crm: $crm, ')
          ..write('atualizadoEm: $atualizadoEm, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }
}

class $CondutasTable extends Condutas with TableInfo<$CondutasTable, Conduta> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CondutasTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _dataMeta = const VerificationMeta('data');
  @override
  late final GeneratedColumn<String> data = GeneratedColumn<String>(
    'data',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _mutiraoIdMeta = const VerificationMeta(
    'mutiraoId',
  );
  @override
  late final GeneratedColumn<int> mutiraoId = GeneratedColumn<int>(
    'mutirao_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES mutiroes (id)',
    ),
  );
  static const VerificationMeta _pacienteIdMeta = const VerificationMeta(
    'pacienteId',
  );
  @override
  late final GeneratedColumn<int> pacienteId = GeneratedColumn<int>(
    'paciente_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES pacientes (id)',
    ),
  );
  static const VerificationMeta _medicoIdMeta = const VerificationMeta(
    'medicoId',
  );
  @override
  late final GeneratedColumn<int> medicoId = GeneratedColumn<int>(
    'medico_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _tipoMeta = const VerificationMeta('tipo');
  @override
  late final GeneratedColumn<String> tipo = GeneratedColumn<String>(
    'tipo',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _dadosMeta = const VerificationMeta('dados');
  @override
  late final GeneratedColumn<String> dados = GeneratedColumn<String>(
    'dados',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _atualizadoEmMeta = const VerificationMeta(
    'atualizadoEm',
  );
  @override
  late final GeneratedColumn<int> atualizadoEm = GeneratedColumn<int>(
    'atualizado_em',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<int> status = GeneratedColumn<int>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    data,
    mutiraoId,
    pacienteId,
    medicoId,
    tipo,
    dados,
    atualizadoEm,
    status,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'condutas';
  @override
  VerificationContext validateIntegrity(
    Insertable<Conduta> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('data')) {
      context.handle(
        _dataMeta,
        this.data.isAcceptableOrUnknown(data['data']!, _dataMeta),
      );
    }
    if (data.containsKey('mutirao_id')) {
      context.handle(
        _mutiraoIdMeta,
        mutiraoId.isAcceptableOrUnknown(data['mutirao_id']!, _mutiraoIdMeta),
      );
    } else if (isInserting) {
      context.missing(_mutiraoIdMeta);
    }
    if (data.containsKey('paciente_id')) {
      context.handle(
        _pacienteIdMeta,
        pacienteId.isAcceptableOrUnknown(data['paciente_id']!, _pacienteIdMeta),
      );
    } else if (isInserting) {
      context.missing(_pacienteIdMeta);
    }
    if (data.containsKey('medico_id')) {
      context.handle(
        _medicoIdMeta,
        medicoId.isAcceptableOrUnknown(data['medico_id']!, _medicoIdMeta),
      );
    }
    if (data.containsKey('tipo')) {
      context.handle(
        _tipoMeta,
        tipo.isAcceptableOrUnknown(data['tipo']!, _tipoMeta),
      );
    }
    if (data.containsKey('dados')) {
      context.handle(
        _dadosMeta,
        dados.isAcceptableOrUnknown(data['dados']!, _dadosMeta),
      );
    }
    if (data.containsKey('atualizado_em')) {
      context.handle(
        _atualizadoEmMeta,
        atualizadoEm.isAcceptableOrUnknown(
          data['atualizado_em']!,
          _atualizadoEmMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_atualizadoEmMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Conduta map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Conduta(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      data: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}data'],
      ),
      mutiraoId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}mutirao_id'],
      )!,
      pacienteId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}paciente_id'],
      )!,
      medicoId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}medico_id'],
      ),
      tipo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tipo'],
      ),
      dados: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}dados'],
      ),
      atualizadoEm: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}atualizado_em'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}status'],
      )!,
    );
  }

  @override
  $CondutasTable createAlias(String alias) {
    return $CondutasTable(attachedDatabase, alias);
  }
}

class Conduta extends DataClass implements Insertable<Conduta> {
  final int id;
  final String? data;
  final int mutiraoId;
  final int pacienteId;
  final int? medicoId;
  final String? tipo;
  final String? dados;
  final int atualizadoEm;
  final int status;
  const Conduta({
    required this.id,
    this.data,
    required this.mutiraoId,
    required this.pacienteId,
    this.medicoId,
    this.tipo,
    this.dados,
    required this.atualizadoEm,
    required this.status,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || data != null) {
      map['data'] = Variable<String>(data);
    }
    map['mutirao_id'] = Variable<int>(mutiraoId);
    map['paciente_id'] = Variable<int>(pacienteId);
    if (!nullToAbsent || medicoId != null) {
      map['medico_id'] = Variable<int>(medicoId);
    }
    if (!nullToAbsent || tipo != null) {
      map['tipo'] = Variable<String>(tipo);
    }
    if (!nullToAbsent || dados != null) {
      map['dados'] = Variable<String>(dados);
    }
    map['atualizado_em'] = Variable<int>(atualizadoEm);
    map['status'] = Variable<int>(status);
    return map;
  }

  CondutasCompanion toCompanion(bool nullToAbsent) {
    return CondutasCompanion(
      id: Value(id),
      data: data == null && nullToAbsent ? const Value.absent() : Value(data),
      mutiraoId: Value(mutiraoId),
      pacienteId: Value(pacienteId),
      medicoId: medicoId == null && nullToAbsent
          ? const Value.absent()
          : Value(medicoId),
      tipo: tipo == null && nullToAbsent ? const Value.absent() : Value(tipo),
      dados: dados == null && nullToAbsent
          ? const Value.absent()
          : Value(dados),
      atualizadoEm: Value(atualizadoEm),
      status: Value(status),
    );
  }

  factory Conduta.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Conduta(
      id: serializer.fromJson<int>(json['id']),
      data: serializer.fromJson<String?>(json['data']),
      mutiraoId: serializer.fromJson<int>(json['mutiraoId']),
      pacienteId: serializer.fromJson<int>(json['pacienteId']),
      medicoId: serializer.fromJson<int?>(json['medicoId']),
      tipo: serializer.fromJson<String?>(json['tipo']),
      dados: serializer.fromJson<String?>(json['dados']),
      atualizadoEm: serializer.fromJson<int>(json['atualizadoEm']),
      status: serializer.fromJson<int>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'data': serializer.toJson<String?>(data),
      'mutiraoId': serializer.toJson<int>(mutiraoId),
      'pacienteId': serializer.toJson<int>(pacienteId),
      'medicoId': serializer.toJson<int?>(medicoId),
      'tipo': serializer.toJson<String?>(tipo),
      'dados': serializer.toJson<String?>(dados),
      'atualizadoEm': serializer.toJson<int>(atualizadoEm),
      'status': serializer.toJson<int>(status),
    };
  }

  Conduta copyWith({
    int? id,
    Value<String?> data = const Value.absent(),
    int? mutiraoId,
    int? pacienteId,
    Value<int?> medicoId = const Value.absent(),
    Value<String?> tipo = const Value.absent(),
    Value<String?> dados = const Value.absent(),
    int? atualizadoEm,
    int? status,
  }) => Conduta(
    id: id ?? this.id,
    data: data.present ? data.value : this.data,
    mutiraoId: mutiraoId ?? this.mutiraoId,
    pacienteId: pacienteId ?? this.pacienteId,
    medicoId: medicoId.present ? medicoId.value : this.medicoId,
    tipo: tipo.present ? tipo.value : this.tipo,
    dados: dados.present ? dados.value : this.dados,
    atualizadoEm: atualizadoEm ?? this.atualizadoEm,
    status: status ?? this.status,
  );
  Conduta copyWithCompanion(CondutasCompanion data) {
    return Conduta(
      id: data.id.present ? data.id.value : this.id,
      data: data.data.present ? data.data.value : this.data,
      mutiraoId: data.mutiraoId.present ? data.mutiraoId.value : this.mutiraoId,
      pacienteId: data.pacienteId.present
          ? data.pacienteId.value
          : this.pacienteId,
      medicoId: data.medicoId.present ? data.medicoId.value : this.medicoId,
      tipo: data.tipo.present ? data.tipo.value : this.tipo,
      dados: data.dados.present ? data.dados.value : this.dados,
      atualizadoEm: data.atualizadoEm.present
          ? data.atualizadoEm.value
          : this.atualizadoEm,
      status: data.status.present ? data.status.value : this.status,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Conduta(')
          ..write('id: $id, ')
          ..write('data: $data, ')
          ..write('mutiraoId: $mutiraoId, ')
          ..write('pacienteId: $pacienteId, ')
          ..write('medicoId: $medicoId, ')
          ..write('tipo: $tipo, ')
          ..write('dados: $dados, ')
          ..write('atualizadoEm: $atualizadoEm, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    data,
    mutiraoId,
    pacienteId,
    medicoId,
    tipo,
    dados,
    atualizadoEm,
    status,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Conduta &&
          other.id == this.id &&
          other.data == this.data &&
          other.mutiraoId == this.mutiraoId &&
          other.pacienteId == this.pacienteId &&
          other.medicoId == this.medicoId &&
          other.tipo == this.tipo &&
          other.dados == this.dados &&
          other.atualizadoEm == this.atualizadoEm &&
          other.status == this.status);
}

class CondutasCompanion extends UpdateCompanion<Conduta> {
  final Value<int> id;
  final Value<String?> data;
  final Value<int> mutiraoId;
  final Value<int> pacienteId;
  final Value<int?> medicoId;
  final Value<String?> tipo;
  final Value<String?> dados;
  final Value<int> atualizadoEm;
  final Value<int> status;
  const CondutasCompanion({
    this.id = const Value.absent(),
    this.data = const Value.absent(),
    this.mutiraoId = const Value.absent(),
    this.pacienteId = const Value.absent(),
    this.medicoId = const Value.absent(),
    this.tipo = const Value.absent(),
    this.dados = const Value.absent(),
    this.atualizadoEm = const Value.absent(),
    this.status = const Value.absent(),
  });
  CondutasCompanion.insert({
    this.id = const Value.absent(),
    this.data = const Value.absent(),
    required int mutiraoId,
    required int pacienteId,
    this.medicoId = const Value.absent(),
    this.tipo = const Value.absent(),
    this.dados = const Value.absent(),
    required int atualizadoEm,
    this.status = const Value.absent(),
  }) : mutiraoId = Value(mutiraoId),
       pacienteId = Value(pacienteId),
       atualizadoEm = Value(atualizadoEm);
  static Insertable<Conduta> custom({
    Expression<int>? id,
    Expression<String>? data,
    Expression<int>? mutiraoId,
    Expression<int>? pacienteId,
    Expression<int>? medicoId,
    Expression<String>? tipo,
    Expression<String>? dados,
    Expression<int>? atualizadoEm,
    Expression<int>? status,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (data != null) 'data': data,
      if (mutiraoId != null) 'mutirao_id': mutiraoId,
      if (pacienteId != null) 'paciente_id': pacienteId,
      if (medicoId != null) 'medico_id': medicoId,
      if (tipo != null) 'tipo': tipo,
      if (dados != null) 'dados': dados,
      if (atualizadoEm != null) 'atualizado_em': atualizadoEm,
      if (status != null) 'status': status,
    });
  }

  CondutasCompanion copyWith({
    Value<int>? id,
    Value<String?>? data,
    Value<int>? mutiraoId,
    Value<int>? pacienteId,
    Value<int?>? medicoId,
    Value<String?>? tipo,
    Value<String?>? dados,
    Value<int>? atualizadoEm,
    Value<int>? status,
  }) {
    return CondutasCompanion(
      id: id ?? this.id,
      data: data ?? this.data,
      mutiraoId: mutiraoId ?? this.mutiraoId,
      pacienteId: pacienteId ?? this.pacienteId,
      medicoId: medicoId ?? this.medicoId,
      tipo: tipo ?? this.tipo,
      dados: dados ?? this.dados,
      atualizadoEm: atualizadoEm ?? this.atualizadoEm,
      status: status ?? this.status,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (data.present) {
      map['data'] = Variable<String>(data.value);
    }
    if (mutiraoId.present) {
      map['mutirao_id'] = Variable<int>(mutiraoId.value);
    }
    if (pacienteId.present) {
      map['paciente_id'] = Variable<int>(pacienteId.value);
    }
    if (medicoId.present) {
      map['medico_id'] = Variable<int>(medicoId.value);
    }
    if (tipo.present) {
      map['tipo'] = Variable<String>(tipo.value);
    }
    if (dados.present) {
      map['dados'] = Variable<String>(dados.value);
    }
    if (atualizadoEm.present) {
      map['atualizado_em'] = Variable<int>(atualizadoEm.value);
    }
    if (status.present) {
      map['status'] = Variable<int>(status.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CondutasCompanion(')
          ..write('id: $id, ')
          ..write('data: $data, ')
          ..write('mutiraoId: $mutiraoId, ')
          ..write('pacienteId: $pacienteId, ')
          ..write('medicoId: $medicoId, ')
          ..write('tipo: $tipo, ')
          ..write('dados: $dados, ')
          ..write('atualizadoEm: $atualizadoEm, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }
}

class $ProcedimentosTable extends Procedimentos
    with TableInfo<$ProcedimentosTable, Procedimento> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProcedimentosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _dataMeta = const VerificationMeta('data');
  @override
  late final GeneratedColumn<String> data = GeneratedColumn<String>(
    'data',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _mutiraoIdMeta = const VerificationMeta(
    'mutiraoId',
  );
  @override
  late final GeneratedColumn<int> mutiraoId = GeneratedColumn<int>(
    'mutirao_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES mutiroes (id)',
    ),
  );
  static const VerificationMeta _pacienteIdMeta = const VerificationMeta(
    'pacienteId',
  );
  @override
  late final GeneratedColumn<int> pacienteId = GeneratedColumn<int>(
    'paciente_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES pacientes (id)',
    ),
  );
  static const VerificationMeta _medicoIdMeta = const VerificationMeta(
    'medicoId',
  );
  @override
  late final GeneratedColumn<int> medicoId = GeneratedColumn<int>(
    'medico_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES medicos (id)',
    ),
  );
  static const VerificationMeta _tipoMeta = const VerificationMeta('tipo');
  @override
  late final GeneratedColumn<String> tipo = GeneratedColumn<String>(
    'tipo',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _olhoMeta = const VerificationMeta('olho');
  @override
  late final GeneratedColumn<String> olho = GeneratedColumn<String>(
    'olho',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dioptriaLenteMeta = const VerificationMeta(
    'dioptriaLente',
  );
  @override
  late final GeneratedColumn<String> dioptriaLente = GeneratedColumn<String>(
    'dioptria_lente',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _intercorrenciaMeta = const VerificationMeta(
    'intercorrencia',
  );
  @override
  late final GeneratedColumn<String> intercorrencia = GeneratedColumn<String>(
    'intercorrencia',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _observacaoMeta = const VerificationMeta(
    'observacao',
  );
  @override
  late final GeneratedColumn<String> observacao = GeneratedColumn<String>(
    'observacao',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _atualizadoEmMeta = const VerificationMeta(
    'atualizadoEm',
  );
  @override
  late final GeneratedColumn<int> atualizadoEm = GeneratedColumn<int>(
    'atualizado_em',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<int> status = GeneratedColumn<int>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    data,
    mutiraoId,
    pacienteId,
    medicoId,
    tipo,
    olho,
    dioptriaLente,
    intercorrencia,
    observacao,
    atualizadoEm,
    status,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'procedimentos';
  @override
  VerificationContext validateIntegrity(
    Insertable<Procedimento> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('data')) {
      context.handle(
        _dataMeta,
        this.data.isAcceptableOrUnknown(data['data']!, _dataMeta),
      );
    }
    if (data.containsKey('mutirao_id')) {
      context.handle(
        _mutiraoIdMeta,
        mutiraoId.isAcceptableOrUnknown(data['mutirao_id']!, _mutiraoIdMeta),
      );
    } else if (isInserting) {
      context.missing(_mutiraoIdMeta);
    }
    if (data.containsKey('paciente_id')) {
      context.handle(
        _pacienteIdMeta,
        pacienteId.isAcceptableOrUnknown(data['paciente_id']!, _pacienteIdMeta),
      );
    } else if (isInserting) {
      context.missing(_pacienteIdMeta);
    }
    if (data.containsKey('medico_id')) {
      context.handle(
        _medicoIdMeta,
        medicoId.isAcceptableOrUnknown(data['medico_id']!, _medicoIdMeta),
      );
    } else if (isInserting) {
      context.missing(_medicoIdMeta);
    }
    if (data.containsKey('tipo')) {
      context.handle(
        _tipoMeta,
        tipo.isAcceptableOrUnknown(data['tipo']!, _tipoMeta),
      );
    } else if (isInserting) {
      context.missing(_tipoMeta);
    }
    if (data.containsKey('olho')) {
      context.handle(
        _olhoMeta,
        olho.isAcceptableOrUnknown(data['olho']!, _olhoMeta),
      );
    } else if (isInserting) {
      context.missing(_olhoMeta);
    }
    if (data.containsKey('dioptria_lente')) {
      context.handle(
        _dioptriaLenteMeta,
        dioptriaLente.isAcceptableOrUnknown(
          data['dioptria_lente']!,
          _dioptriaLenteMeta,
        ),
      );
    }
    if (data.containsKey('intercorrencia')) {
      context.handle(
        _intercorrenciaMeta,
        intercorrencia.isAcceptableOrUnknown(
          data['intercorrencia']!,
          _intercorrenciaMeta,
        ),
      );
    }
    if (data.containsKey('observacao')) {
      context.handle(
        _observacaoMeta,
        observacao.isAcceptableOrUnknown(data['observacao']!, _observacaoMeta),
      );
    }
    if (data.containsKey('atualizado_em')) {
      context.handle(
        _atualizadoEmMeta,
        atualizadoEm.isAcceptableOrUnknown(
          data['atualizado_em']!,
          _atualizadoEmMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_atualizadoEmMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Procedimento map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Procedimento(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      data: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}data'],
      ),
      mutiraoId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}mutirao_id'],
      )!,
      pacienteId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}paciente_id'],
      )!,
      medicoId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}medico_id'],
      )!,
      tipo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tipo'],
      )!,
      olho: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}olho'],
      )!,
      dioptriaLente: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}dioptria_lente'],
      ),
      intercorrencia: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}intercorrencia'],
      ),
      observacao: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}observacao'],
      ),
      atualizadoEm: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}atualizado_em'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}status'],
      )!,
    );
  }

  @override
  $ProcedimentosTable createAlias(String alias) {
    return $ProcedimentosTable(attachedDatabase, alias);
  }
}

class Procedimento extends DataClass implements Insertable<Procedimento> {
  final int id;
  final String? data;
  final int mutiraoId;
  final int pacienteId;
  final int medicoId;
  final String tipo;
  final String olho;
  final String? dioptriaLente;
  final String? intercorrencia;
  final String? observacao;
  final int atualizadoEm;
  final int status;
  const Procedimento({
    required this.id,
    this.data,
    required this.mutiraoId,
    required this.pacienteId,
    required this.medicoId,
    required this.tipo,
    required this.olho,
    this.dioptriaLente,
    this.intercorrencia,
    this.observacao,
    required this.atualizadoEm,
    required this.status,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || data != null) {
      map['data'] = Variable<String>(data);
    }
    map['mutirao_id'] = Variable<int>(mutiraoId);
    map['paciente_id'] = Variable<int>(pacienteId);
    map['medico_id'] = Variable<int>(medicoId);
    map['tipo'] = Variable<String>(tipo);
    map['olho'] = Variable<String>(olho);
    if (!nullToAbsent || dioptriaLente != null) {
      map['dioptria_lente'] = Variable<String>(dioptriaLente);
    }
    if (!nullToAbsent || intercorrencia != null) {
      map['intercorrencia'] = Variable<String>(intercorrencia);
    }
    if (!nullToAbsent || observacao != null) {
      map['observacao'] = Variable<String>(observacao);
    }
    map['atualizado_em'] = Variable<int>(atualizadoEm);
    map['status'] = Variable<int>(status);
    return map;
  }

  ProcedimentosCompanion toCompanion(bool nullToAbsent) {
    return ProcedimentosCompanion(
      id: Value(id),
      data: data == null && nullToAbsent ? const Value.absent() : Value(data),
      mutiraoId: Value(mutiraoId),
      pacienteId: Value(pacienteId),
      medicoId: Value(medicoId),
      tipo: Value(tipo),
      olho: Value(olho),
      dioptriaLente: dioptriaLente == null && nullToAbsent
          ? const Value.absent()
          : Value(dioptriaLente),
      intercorrencia: intercorrencia == null && nullToAbsent
          ? const Value.absent()
          : Value(intercorrencia),
      observacao: observacao == null && nullToAbsent
          ? const Value.absent()
          : Value(observacao),
      atualizadoEm: Value(atualizadoEm),
      status: Value(status),
    );
  }

  factory Procedimento.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Procedimento(
      id: serializer.fromJson<int>(json['id']),
      data: serializer.fromJson<String?>(json['data']),
      mutiraoId: serializer.fromJson<int>(json['mutiraoId']),
      pacienteId: serializer.fromJson<int>(json['pacienteId']),
      medicoId: serializer.fromJson<int>(json['medicoId']),
      tipo: serializer.fromJson<String>(json['tipo']),
      olho: serializer.fromJson<String>(json['olho']),
      dioptriaLente: serializer.fromJson<String?>(json['dioptriaLente']),
      intercorrencia: serializer.fromJson<String?>(json['intercorrencia']),
      observacao: serializer.fromJson<String?>(json['observacao']),
      atualizadoEm: serializer.fromJson<int>(json['atualizadoEm']),
      status: serializer.fromJson<int>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'data': serializer.toJson<String?>(data),
      'mutiraoId': serializer.toJson<int>(mutiraoId),
      'pacienteId': serializer.toJson<int>(pacienteId),
      'medicoId': serializer.toJson<int>(medicoId),
      'tipo': serializer.toJson<String>(tipo),
      'olho': serializer.toJson<String>(olho),
      'dioptriaLente': serializer.toJson<String?>(dioptriaLente),
      'intercorrencia': serializer.toJson<String?>(intercorrencia),
      'observacao': serializer.toJson<String?>(observacao),
      'atualizadoEm': serializer.toJson<int>(atualizadoEm),
      'status': serializer.toJson<int>(status),
    };
  }

  Procedimento copyWith({
    int? id,
    Value<String?> data = const Value.absent(),
    int? mutiraoId,
    int? pacienteId,
    int? medicoId,
    String? tipo,
    String? olho,
    Value<String?> dioptriaLente = const Value.absent(),
    Value<String?> intercorrencia = const Value.absent(),
    Value<String?> observacao = const Value.absent(),
    int? atualizadoEm,
    int? status,
  }) => Procedimento(
    id: id ?? this.id,
    data: data.present ? data.value : this.data,
    mutiraoId: mutiraoId ?? this.mutiraoId,
    pacienteId: pacienteId ?? this.pacienteId,
    medicoId: medicoId ?? this.medicoId,
    tipo: tipo ?? this.tipo,
    olho: olho ?? this.olho,
    dioptriaLente: dioptriaLente.present
        ? dioptriaLente.value
        : this.dioptriaLente,
    intercorrencia: intercorrencia.present
        ? intercorrencia.value
        : this.intercorrencia,
    observacao: observacao.present ? observacao.value : this.observacao,
    atualizadoEm: atualizadoEm ?? this.atualizadoEm,
    status: status ?? this.status,
  );
  Procedimento copyWithCompanion(ProcedimentosCompanion data) {
    return Procedimento(
      id: data.id.present ? data.id.value : this.id,
      data: data.data.present ? data.data.value : this.data,
      mutiraoId: data.mutiraoId.present ? data.mutiraoId.value : this.mutiraoId,
      pacienteId: data.pacienteId.present
          ? data.pacienteId.value
          : this.pacienteId,
      medicoId: data.medicoId.present ? data.medicoId.value : this.medicoId,
      tipo: data.tipo.present ? data.tipo.value : this.tipo,
      olho: data.olho.present ? data.olho.value : this.olho,
      dioptriaLente: data.dioptriaLente.present
          ? data.dioptriaLente.value
          : this.dioptriaLente,
      intercorrencia: data.intercorrencia.present
          ? data.intercorrencia.value
          : this.intercorrencia,
      observacao: data.observacao.present
          ? data.observacao.value
          : this.observacao,
      atualizadoEm: data.atualizadoEm.present
          ? data.atualizadoEm.value
          : this.atualizadoEm,
      status: data.status.present ? data.status.value : this.status,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Procedimento(')
          ..write('id: $id, ')
          ..write('data: $data, ')
          ..write('mutiraoId: $mutiraoId, ')
          ..write('pacienteId: $pacienteId, ')
          ..write('medicoId: $medicoId, ')
          ..write('tipo: $tipo, ')
          ..write('olho: $olho, ')
          ..write('dioptriaLente: $dioptriaLente, ')
          ..write('intercorrencia: $intercorrencia, ')
          ..write('observacao: $observacao, ')
          ..write('atualizadoEm: $atualizadoEm, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    data,
    mutiraoId,
    pacienteId,
    medicoId,
    tipo,
    olho,
    dioptriaLente,
    intercorrencia,
    observacao,
    atualizadoEm,
    status,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Procedimento &&
          other.id == this.id &&
          other.data == this.data &&
          other.mutiraoId == this.mutiraoId &&
          other.pacienteId == this.pacienteId &&
          other.medicoId == this.medicoId &&
          other.tipo == this.tipo &&
          other.olho == this.olho &&
          other.dioptriaLente == this.dioptriaLente &&
          other.intercorrencia == this.intercorrencia &&
          other.observacao == this.observacao &&
          other.atualizadoEm == this.atualizadoEm &&
          other.status == this.status);
}

class ProcedimentosCompanion extends UpdateCompanion<Procedimento> {
  final Value<int> id;
  final Value<String?> data;
  final Value<int> mutiraoId;
  final Value<int> pacienteId;
  final Value<int> medicoId;
  final Value<String> tipo;
  final Value<String> olho;
  final Value<String?> dioptriaLente;
  final Value<String?> intercorrencia;
  final Value<String?> observacao;
  final Value<int> atualizadoEm;
  final Value<int> status;
  const ProcedimentosCompanion({
    this.id = const Value.absent(),
    this.data = const Value.absent(),
    this.mutiraoId = const Value.absent(),
    this.pacienteId = const Value.absent(),
    this.medicoId = const Value.absent(),
    this.tipo = const Value.absent(),
    this.olho = const Value.absent(),
    this.dioptriaLente = const Value.absent(),
    this.intercorrencia = const Value.absent(),
    this.observacao = const Value.absent(),
    this.atualizadoEm = const Value.absent(),
    this.status = const Value.absent(),
  });
  ProcedimentosCompanion.insert({
    this.id = const Value.absent(),
    this.data = const Value.absent(),
    required int mutiraoId,
    required int pacienteId,
    required int medicoId,
    required String tipo,
    required String olho,
    this.dioptriaLente = const Value.absent(),
    this.intercorrencia = const Value.absent(),
    this.observacao = const Value.absent(),
    required int atualizadoEm,
    this.status = const Value.absent(),
  }) : mutiraoId = Value(mutiraoId),
       pacienteId = Value(pacienteId),
       medicoId = Value(medicoId),
       tipo = Value(tipo),
       olho = Value(olho),
       atualizadoEm = Value(atualizadoEm);
  static Insertable<Procedimento> custom({
    Expression<int>? id,
    Expression<String>? data,
    Expression<int>? mutiraoId,
    Expression<int>? pacienteId,
    Expression<int>? medicoId,
    Expression<String>? tipo,
    Expression<String>? olho,
    Expression<String>? dioptriaLente,
    Expression<String>? intercorrencia,
    Expression<String>? observacao,
    Expression<int>? atualizadoEm,
    Expression<int>? status,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (data != null) 'data': data,
      if (mutiraoId != null) 'mutirao_id': mutiraoId,
      if (pacienteId != null) 'paciente_id': pacienteId,
      if (medicoId != null) 'medico_id': medicoId,
      if (tipo != null) 'tipo': tipo,
      if (olho != null) 'olho': olho,
      if (dioptriaLente != null) 'dioptria_lente': dioptriaLente,
      if (intercorrencia != null) 'intercorrencia': intercorrencia,
      if (observacao != null) 'observacao': observacao,
      if (atualizadoEm != null) 'atualizado_em': atualizadoEm,
      if (status != null) 'status': status,
    });
  }

  ProcedimentosCompanion copyWith({
    Value<int>? id,
    Value<String?>? data,
    Value<int>? mutiraoId,
    Value<int>? pacienteId,
    Value<int>? medicoId,
    Value<String>? tipo,
    Value<String>? olho,
    Value<String?>? dioptriaLente,
    Value<String?>? intercorrencia,
    Value<String?>? observacao,
    Value<int>? atualizadoEm,
    Value<int>? status,
  }) {
    return ProcedimentosCompanion(
      id: id ?? this.id,
      data: data ?? this.data,
      mutiraoId: mutiraoId ?? this.mutiraoId,
      pacienteId: pacienteId ?? this.pacienteId,
      medicoId: medicoId ?? this.medicoId,
      tipo: tipo ?? this.tipo,
      olho: olho ?? this.olho,
      dioptriaLente: dioptriaLente ?? this.dioptriaLente,
      intercorrencia: intercorrencia ?? this.intercorrencia,
      observacao: observacao ?? this.observacao,
      atualizadoEm: atualizadoEm ?? this.atualizadoEm,
      status: status ?? this.status,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (data.present) {
      map['data'] = Variable<String>(data.value);
    }
    if (mutiraoId.present) {
      map['mutirao_id'] = Variable<int>(mutiraoId.value);
    }
    if (pacienteId.present) {
      map['paciente_id'] = Variable<int>(pacienteId.value);
    }
    if (medicoId.present) {
      map['medico_id'] = Variable<int>(medicoId.value);
    }
    if (tipo.present) {
      map['tipo'] = Variable<String>(tipo.value);
    }
    if (olho.present) {
      map['olho'] = Variable<String>(olho.value);
    }
    if (dioptriaLente.present) {
      map['dioptria_lente'] = Variable<String>(dioptriaLente.value);
    }
    if (intercorrencia.present) {
      map['intercorrencia'] = Variable<String>(intercorrencia.value);
    }
    if (observacao.present) {
      map['observacao'] = Variable<String>(observacao.value);
    }
    if (atualizadoEm.present) {
      map['atualizado_em'] = Variable<int>(atualizadoEm.value);
    }
    if (status.present) {
      map['status'] = Variable<int>(status.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProcedimentosCompanion(')
          ..write('id: $id, ')
          ..write('data: $data, ')
          ..write('mutiraoId: $mutiraoId, ')
          ..write('pacienteId: $pacienteId, ')
          ..write('medicoId: $medicoId, ')
          ..write('tipo: $tipo, ')
          ..write('olho: $olho, ')
          ..write('dioptriaLente: $dioptriaLente, ')
          ..write('intercorrencia: $intercorrencia, ')
          ..write('observacao: $observacao, ')
          ..write('atualizadoEm: $atualizadoEm, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }
}

class $CondutasGenericasTable extends CondutasGenericas
    with TableInfo<$CondutasGenericasTable, CondutaGenerica> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CondutasGenericasTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _dataMeta = const VerificationMeta('data');
  @override
  late final GeneratedColumn<String> data = GeneratedColumn<String>(
    'data',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _mutiraoIdMeta = const VerificationMeta(
    'mutiraoId',
  );
  @override
  late final GeneratedColumn<int> mutiraoId = GeneratedColumn<int>(
    'mutirao_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES mutiroes (id)',
    ),
  );
  static const VerificationMeta _pacienteIdMeta = const VerificationMeta(
    'pacienteId',
  );
  @override
  late final GeneratedColumn<int> pacienteId = GeneratedColumn<int>(
    'paciente_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES pacientes (id)',
    ),
  );
  static const VerificationMeta _medicoIdMeta = const VerificationMeta(
    'medicoId',
  );
  @override
  late final GeneratedColumn<int> medicoId = GeneratedColumn<int>(
    'medico_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES medicos (id)',
    ),
  );
  static const VerificationMeta _condutaMeta = const VerificationMeta(
    'conduta',
  );
  @override
  late final GeneratedColumn<String> conduta = GeneratedColumn<String>(
    'conduta',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _observacaoMeta = const VerificationMeta(
    'observacao',
  );
  @override
  late final GeneratedColumn<String> observacao = GeneratedColumn<String>(
    'observacao',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _atualizadoEmMeta = const VerificationMeta(
    'atualizadoEm',
  );
  @override
  late final GeneratedColumn<int> atualizadoEm = GeneratedColumn<int>(
    'atualizado_em',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<int> status = GeneratedColumn<int>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    data,
    mutiraoId,
    pacienteId,
    medicoId,
    conduta,
    observacao,
    atualizadoEm,
    status,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'condutas_genericas';
  @override
  VerificationContext validateIntegrity(
    Insertable<CondutaGenerica> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('data')) {
      context.handle(
        _dataMeta,
        this.data.isAcceptableOrUnknown(data['data']!, _dataMeta),
      );
    }
    if (data.containsKey('mutirao_id')) {
      context.handle(
        _mutiraoIdMeta,
        mutiraoId.isAcceptableOrUnknown(data['mutirao_id']!, _mutiraoIdMeta),
      );
    } else if (isInserting) {
      context.missing(_mutiraoIdMeta);
    }
    if (data.containsKey('paciente_id')) {
      context.handle(
        _pacienteIdMeta,
        pacienteId.isAcceptableOrUnknown(data['paciente_id']!, _pacienteIdMeta),
      );
    } else if (isInserting) {
      context.missing(_pacienteIdMeta);
    }
    if (data.containsKey('medico_id')) {
      context.handle(
        _medicoIdMeta,
        medicoId.isAcceptableOrUnknown(data['medico_id']!, _medicoIdMeta),
      );
    }
    if (data.containsKey('conduta')) {
      context.handle(
        _condutaMeta,
        conduta.isAcceptableOrUnknown(data['conduta']!, _condutaMeta),
      );
    }
    if (data.containsKey('observacao')) {
      context.handle(
        _observacaoMeta,
        observacao.isAcceptableOrUnknown(data['observacao']!, _observacaoMeta),
      );
    }
    if (data.containsKey('atualizado_em')) {
      context.handle(
        _atualizadoEmMeta,
        atualizadoEm.isAcceptableOrUnknown(
          data['atualizado_em']!,
          _atualizadoEmMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_atualizadoEmMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CondutaGenerica map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CondutaGenerica(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      data: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}data'],
      ),
      mutiraoId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}mutirao_id'],
      )!,
      pacienteId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}paciente_id'],
      )!,
      medicoId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}medico_id'],
      ),
      conduta: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}conduta'],
      ),
      observacao: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}observacao'],
      ),
      atualizadoEm: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}atualizado_em'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}status'],
      )!,
    );
  }

  @override
  $CondutasGenericasTable createAlias(String alias) {
    return $CondutasGenericasTable(attachedDatabase, alias);
  }
}

class CondutaGenerica extends DataClass implements Insertable<CondutaGenerica> {
  final int id;
  final String? data;
  final int mutiraoId;
  final int pacienteId;
  final int? medicoId;
  final String? conduta;
  final String? observacao;
  final int atualizadoEm;
  final int status;
  const CondutaGenerica({
    required this.id,
    this.data,
    required this.mutiraoId,
    required this.pacienteId,
    this.medicoId,
    this.conduta,
    this.observacao,
    required this.atualizadoEm,
    required this.status,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || data != null) {
      map['data'] = Variable<String>(data);
    }
    map['mutirao_id'] = Variable<int>(mutiraoId);
    map['paciente_id'] = Variable<int>(pacienteId);
    if (!nullToAbsent || medicoId != null) {
      map['medico_id'] = Variable<int>(medicoId);
    }
    if (!nullToAbsent || conduta != null) {
      map['conduta'] = Variable<String>(conduta);
    }
    if (!nullToAbsent || observacao != null) {
      map['observacao'] = Variable<String>(observacao);
    }
    map['atualizado_em'] = Variable<int>(atualizadoEm);
    map['status'] = Variable<int>(status);
    return map;
  }

  CondutasGenericasCompanion toCompanion(bool nullToAbsent) {
    return CondutasGenericasCompanion(
      id: Value(id),
      data: data == null && nullToAbsent ? const Value.absent() : Value(data),
      mutiraoId: Value(mutiraoId),
      pacienteId: Value(pacienteId),
      medicoId: medicoId == null && nullToAbsent
          ? const Value.absent()
          : Value(medicoId),
      conduta: conduta == null && nullToAbsent
          ? const Value.absent()
          : Value(conduta),
      observacao: observacao == null && nullToAbsent
          ? const Value.absent()
          : Value(observacao),
      atualizadoEm: Value(atualizadoEm),
      status: Value(status),
    );
  }

  factory CondutaGenerica.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CondutaGenerica(
      id: serializer.fromJson<int>(json['id']),
      data: serializer.fromJson<String?>(json['data']),
      mutiraoId: serializer.fromJson<int>(json['mutiraoId']),
      pacienteId: serializer.fromJson<int>(json['pacienteId']),
      medicoId: serializer.fromJson<int?>(json['medicoId']),
      conduta: serializer.fromJson<String?>(json['conduta']),
      observacao: serializer.fromJson<String?>(json['observacao']),
      atualizadoEm: serializer.fromJson<int>(json['atualizadoEm']),
      status: serializer.fromJson<int>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'data': serializer.toJson<String?>(data),
      'mutiraoId': serializer.toJson<int>(mutiraoId),
      'pacienteId': serializer.toJson<int>(pacienteId),
      'medicoId': serializer.toJson<int?>(medicoId),
      'conduta': serializer.toJson<String?>(conduta),
      'observacao': serializer.toJson<String?>(observacao),
      'atualizadoEm': serializer.toJson<int>(atualizadoEm),
      'status': serializer.toJson<int>(status),
    };
  }

  CondutaGenerica copyWith({
    int? id,
    Value<String?> data = const Value.absent(),
    int? mutiraoId,
    int? pacienteId,
    Value<int?> medicoId = const Value.absent(),
    Value<String?> conduta = const Value.absent(),
    Value<String?> observacao = const Value.absent(),
    int? atualizadoEm,
    int? status,
  }) => CondutaGenerica(
    id: id ?? this.id,
    data: data.present ? data.value : this.data,
    mutiraoId: mutiraoId ?? this.mutiraoId,
    pacienteId: pacienteId ?? this.pacienteId,
    medicoId: medicoId.present ? medicoId.value : this.medicoId,
    conduta: conduta.present ? conduta.value : this.conduta,
    observacao: observacao.present ? observacao.value : this.observacao,
    atualizadoEm: atualizadoEm ?? this.atualizadoEm,
    status: status ?? this.status,
  );
  CondutaGenerica copyWithCompanion(CondutasGenericasCompanion data) {
    return CondutaGenerica(
      id: data.id.present ? data.id.value : this.id,
      data: data.data.present ? data.data.value : this.data,
      mutiraoId: data.mutiraoId.present ? data.mutiraoId.value : this.mutiraoId,
      pacienteId: data.pacienteId.present
          ? data.pacienteId.value
          : this.pacienteId,
      medicoId: data.medicoId.present ? data.medicoId.value : this.medicoId,
      conduta: data.conduta.present ? data.conduta.value : this.conduta,
      observacao: data.observacao.present
          ? data.observacao.value
          : this.observacao,
      atualizadoEm: data.atualizadoEm.present
          ? data.atualizadoEm.value
          : this.atualizadoEm,
      status: data.status.present ? data.status.value : this.status,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CondutaGenerica(')
          ..write('id: $id, ')
          ..write('data: $data, ')
          ..write('mutiraoId: $mutiraoId, ')
          ..write('pacienteId: $pacienteId, ')
          ..write('medicoId: $medicoId, ')
          ..write('conduta: $conduta, ')
          ..write('observacao: $observacao, ')
          ..write('atualizadoEm: $atualizadoEm, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    data,
    mutiraoId,
    pacienteId,
    medicoId,
    conduta,
    observacao,
    atualizadoEm,
    status,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CondutaGenerica &&
          other.id == this.id &&
          other.data == this.data &&
          other.mutiraoId == this.mutiraoId &&
          other.pacienteId == this.pacienteId &&
          other.medicoId == this.medicoId &&
          other.conduta == this.conduta &&
          other.observacao == this.observacao &&
          other.atualizadoEm == this.atualizadoEm &&
          other.status == this.status);
}

class CondutasGenericasCompanion extends UpdateCompanion<CondutaGenerica> {
  final Value<int> id;
  final Value<String?> data;
  final Value<int> mutiraoId;
  final Value<int> pacienteId;
  final Value<int?> medicoId;
  final Value<String?> conduta;
  final Value<String?> observacao;
  final Value<int> atualizadoEm;
  final Value<int> status;
  const CondutasGenericasCompanion({
    this.id = const Value.absent(),
    this.data = const Value.absent(),
    this.mutiraoId = const Value.absent(),
    this.pacienteId = const Value.absent(),
    this.medicoId = const Value.absent(),
    this.conduta = const Value.absent(),
    this.observacao = const Value.absent(),
    this.atualizadoEm = const Value.absent(),
    this.status = const Value.absent(),
  });
  CondutasGenericasCompanion.insert({
    this.id = const Value.absent(),
    this.data = const Value.absent(),
    required int mutiraoId,
    required int pacienteId,
    this.medicoId = const Value.absent(),
    this.conduta = const Value.absent(),
    this.observacao = const Value.absent(),
    required int atualizadoEm,
    this.status = const Value.absent(),
  }) : mutiraoId = Value(mutiraoId),
       pacienteId = Value(pacienteId),
       atualizadoEm = Value(atualizadoEm);
  static Insertable<CondutaGenerica> custom({
    Expression<int>? id,
    Expression<String>? data,
    Expression<int>? mutiraoId,
    Expression<int>? pacienteId,
    Expression<int>? medicoId,
    Expression<String>? conduta,
    Expression<String>? observacao,
    Expression<int>? atualizadoEm,
    Expression<int>? status,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (data != null) 'data': data,
      if (mutiraoId != null) 'mutirao_id': mutiraoId,
      if (pacienteId != null) 'paciente_id': pacienteId,
      if (medicoId != null) 'medico_id': medicoId,
      if (conduta != null) 'conduta': conduta,
      if (observacao != null) 'observacao': observacao,
      if (atualizadoEm != null) 'atualizado_em': atualizadoEm,
      if (status != null) 'status': status,
    });
  }

  CondutasGenericasCompanion copyWith({
    Value<int>? id,
    Value<String?>? data,
    Value<int>? mutiraoId,
    Value<int>? pacienteId,
    Value<int?>? medicoId,
    Value<String?>? conduta,
    Value<String?>? observacao,
    Value<int>? atualizadoEm,
    Value<int>? status,
  }) {
    return CondutasGenericasCompanion(
      id: id ?? this.id,
      data: data ?? this.data,
      mutiraoId: mutiraoId ?? this.mutiraoId,
      pacienteId: pacienteId ?? this.pacienteId,
      medicoId: medicoId ?? this.medicoId,
      conduta: conduta ?? this.conduta,
      observacao: observacao ?? this.observacao,
      atualizadoEm: atualizadoEm ?? this.atualizadoEm,
      status: status ?? this.status,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (data.present) {
      map['data'] = Variable<String>(data.value);
    }
    if (mutiraoId.present) {
      map['mutirao_id'] = Variable<int>(mutiraoId.value);
    }
    if (pacienteId.present) {
      map['paciente_id'] = Variable<int>(pacienteId.value);
    }
    if (medicoId.present) {
      map['medico_id'] = Variable<int>(medicoId.value);
    }
    if (conduta.present) {
      map['conduta'] = Variable<String>(conduta.value);
    }
    if (observacao.present) {
      map['observacao'] = Variable<String>(observacao.value);
    }
    if (atualizadoEm.present) {
      map['atualizado_em'] = Variable<int>(atualizadoEm.value);
    }
    if (status.present) {
      map['status'] = Variable<int>(status.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CondutasGenericasCompanion(')
          ..write('id: $id, ')
          ..write('data: $data, ')
          ..write('mutiraoId: $mutiraoId, ')
          ..write('pacienteId: $pacienteId, ')
          ..write('medicoId: $medicoId, ')
          ..write('conduta: $conduta, ')
          ..write('observacao: $observacao, ')
          ..write('atualizadoEm: $atualizadoEm, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }
}

class $MutiraoCondutasTable extends MutiraoCondutas
    with TableInfo<$MutiraoCondutasTable, MutiraoConduta> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MutiraoCondutasTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _mutiraoIdMeta = const VerificationMeta(
    'mutiraoId',
  );
  @override
  late final GeneratedColumn<int> mutiraoId = GeneratedColumn<int>(
    'mutirao_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES mutiroes (id)',
    ),
  );
  static const VerificationMeta _condutaMeta = const VerificationMeta(
    'conduta',
  );
  @override
  late final GeneratedColumn<String> conduta = GeneratedColumn<String>(
    'conduta',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [mutiraoId, conduta];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'mutirao_condutas';
  @override
  VerificationContext validateIntegrity(
    Insertable<MutiraoConduta> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('mutirao_id')) {
      context.handle(
        _mutiraoIdMeta,
        mutiraoId.isAcceptableOrUnknown(data['mutirao_id']!, _mutiraoIdMeta),
      );
    } else if (isInserting) {
      context.missing(_mutiraoIdMeta);
    }
    if (data.containsKey('conduta')) {
      context.handle(
        _condutaMeta,
        conduta.isAcceptableOrUnknown(data['conduta']!, _condutaMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {mutiraoId, conduta};
  @override
  MutiraoConduta map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MutiraoConduta(
      mutiraoId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}mutirao_id'],
      )!,
      conduta: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}conduta'],
      ),
    );
  }

  @override
  $MutiraoCondutasTable createAlias(String alias) {
    return $MutiraoCondutasTable(attachedDatabase, alias);
  }
}

class MutiraoConduta extends DataClass implements Insertable<MutiraoConduta> {
  final int mutiraoId;
  final String? conduta;
  const MutiraoConduta({required this.mutiraoId, this.conduta});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['mutirao_id'] = Variable<int>(mutiraoId);
    if (!nullToAbsent || conduta != null) {
      map['conduta'] = Variable<String>(conduta);
    }
    return map;
  }

  MutiraoCondutasCompanion toCompanion(bool nullToAbsent) {
    return MutiraoCondutasCompanion(
      mutiraoId: Value(mutiraoId),
      conduta: conduta == null && nullToAbsent
          ? const Value.absent()
          : Value(conduta),
    );
  }

  factory MutiraoConduta.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MutiraoConduta(
      mutiraoId: serializer.fromJson<int>(json['mutiraoId']),
      conduta: serializer.fromJson<String?>(json['conduta']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'mutiraoId': serializer.toJson<int>(mutiraoId),
      'conduta': serializer.toJson<String?>(conduta),
    };
  }

  MutiraoConduta copyWith({
    int? mutiraoId,
    Value<String?> conduta = const Value.absent(),
  }) => MutiraoConduta(
    mutiraoId: mutiraoId ?? this.mutiraoId,
    conduta: conduta.present ? conduta.value : this.conduta,
  );
  MutiraoConduta copyWithCompanion(MutiraoCondutasCompanion data) {
    return MutiraoConduta(
      mutiraoId: data.mutiraoId.present ? data.mutiraoId.value : this.mutiraoId,
      conduta: data.conduta.present ? data.conduta.value : this.conduta,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MutiraoConduta(')
          ..write('mutiraoId: $mutiraoId, ')
          ..write('conduta: $conduta')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(mutiraoId, conduta);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MutiraoConduta &&
          other.mutiraoId == this.mutiraoId &&
          other.conduta == this.conduta);
}

class MutiraoCondutasCompanion extends UpdateCompanion<MutiraoConduta> {
  final Value<int> mutiraoId;
  final Value<String?> conduta;
  final Value<int> rowid;
  const MutiraoCondutasCompanion({
    this.mutiraoId = const Value.absent(),
    this.conduta = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MutiraoCondutasCompanion.insert({
    required int mutiraoId,
    this.conduta = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : mutiraoId = Value(mutiraoId);
  static Insertable<MutiraoConduta> custom({
    Expression<int>? mutiraoId,
    Expression<String>? conduta,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (mutiraoId != null) 'mutirao_id': mutiraoId,
      if (conduta != null) 'conduta': conduta,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MutiraoCondutasCompanion copyWith({
    Value<int>? mutiraoId,
    Value<String?>? conduta,
    Value<int>? rowid,
  }) {
    return MutiraoCondutasCompanion(
      mutiraoId: mutiraoId ?? this.mutiraoId,
      conduta: conduta ?? this.conduta,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (mutiraoId.present) {
      map['mutirao_id'] = Variable<int>(mutiraoId.value);
    }
    if (conduta.present) {
      map['conduta'] = Variable<String>(conduta.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MutiraoCondutasCompanion(')
          ..write('mutiraoId: $mutiraoId, ')
          ..write('conduta: $conduta, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $HistoricoSincronizacaoTable extends HistoricoSincronizacao
    with TableInfo<$HistoricoSincronizacaoTable, HistoricoSincronizacaoData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HistoricoSincronizacaoTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _localTsMeta = const VerificationMeta(
    'localTs',
  );
  @override
  late final GeneratedColumn<int> localTs = GeneratedColumn<int>(
    'local_ts',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _remoteTsMeta = const VerificationMeta(
    'remoteTs',
  );
  @override
  late final GeneratedColumn<int> remoteTs = GeneratedColumn<int>(
    'remote_ts',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _mutiraoIdMeta = const VerificationMeta(
    'mutiraoId',
  );
  @override
  late final GeneratedColumn<int> mutiraoId = GeneratedColumn<int>(
    'mutirao_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES mutiroes (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [localTs, remoteTs, mutiraoId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'historico_sincronizacao';
  @override
  VerificationContext validateIntegrity(
    Insertable<HistoricoSincronizacaoData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('local_ts')) {
      context.handle(
        _localTsMeta,
        localTs.isAcceptableOrUnknown(data['local_ts']!, _localTsMeta),
      );
    }
    if (data.containsKey('remote_ts')) {
      context.handle(
        _remoteTsMeta,
        remoteTs.isAcceptableOrUnknown(data['remote_ts']!, _remoteTsMeta),
      );
    } else if (isInserting) {
      context.missing(_remoteTsMeta);
    }
    if (data.containsKey('mutirao_id')) {
      context.handle(
        _mutiraoIdMeta,
        mutiraoId.isAcceptableOrUnknown(data['mutirao_id']!, _mutiraoIdMeta),
      );
    } else if (isInserting) {
      context.missing(_mutiraoIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {localTs};
  @override
  HistoricoSincronizacaoData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HistoricoSincronizacaoData(
      localTs: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}local_ts'],
      )!,
      remoteTs: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}remote_ts'],
      )!,
      mutiraoId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}mutirao_id'],
      )!,
    );
  }

  @override
  $HistoricoSincronizacaoTable createAlias(String alias) {
    return $HistoricoSincronizacaoTable(attachedDatabase, alias);
  }
}

class HistoricoSincronizacaoData extends DataClass
    implements Insertable<HistoricoSincronizacaoData> {
  final int localTs;
  final int remoteTs;
  final int mutiraoId;
  const HistoricoSincronizacaoData({
    required this.localTs,
    required this.remoteTs,
    required this.mutiraoId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['local_ts'] = Variable<int>(localTs);
    map['remote_ts'] = Variable<int>(remoteTs);
    map['mutirao_id'] = Variable<int>(mutiraoId);
    return map;
  }

  HistoricoSincronizacaoCompanion toCompanion(bool nullToAbsent) {
    return HistoricoSincronizacaoCompanion(
      localTs: Value(localTs),
      remoteTs: Value(remoteTs),
      mutiraoId: Value(mutiraoId),
    );
  }

  factory HistoricoSincronizacaoData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HistoricoSincronizacaoData(
      localTs: serializer.fromJson<int>(json['localTs']),
      remoteTs: serializer.fromJson<int>(json['remoteTs']),
      mutiraoId: serializer.fromJson<int>(json['mutiraoId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'localTs': serializer.toJson<int>(localTs),
      'remoteTs': serializer.toJson<int>(remoteTs),
      'mutiraoId': serializer.toJson<int>(mutiraoId),
    };
  }

  HistoricoSincronizacaoData copyWith({
    int? localTs,
    int? remoteTs,
    int? mutiraoId,
  }) => HistoricoSincronizacaoData(
    localTs: localTs ?? this.localTs,
    remoteTs: remoteTs ?? this.remoteTs,
    mutiraoId: mutiraoId ?? this.mutiraoId,
  );
  HistoricoSincronizacaoData copyWithCompanion(
    HistoricoSincronizacaoCompanion data,
  ) {
    return HistoricoSincronizacaoData(
      localTs: data.localTs.present ? data.localTs.value : this.localTs,
      remoteTs: data.remoteTs.present ? data.remoteTs.value : this.remoteTs,
      mutiraoId: data.mutiraoId.present ? data.mutiraoId.value : this.mutiraoId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HistoricoSincronizacaoData(')
          ..write('localTs: $localTs, ')
          ..write('remoteTs: $remoteTs, ')
          ..write('mutiraoId: $mutiraoId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(localTs, remoteTs, mutiraoId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HistoricoSincronizacaoData &&
          other.localTs == this.localTs &&
          other.remoteTs == this.remoteTs &&
          other.mutiraoId == this.mutiraoId);
}

class HistoricoSincronizacaoCompanion
    extends UpdateCompanion<HistoricoSincronizacaoData> {
  final Value<int> localTs;
  final Value<int> remoteTs;
  final Value<int> mutiraoId;
  const HistoricoSincronizacaoCompanion({
    this.localTs = const Value.absent(),
    this.remoteTs = const Value.absent(),
    this.mutiraoId = const Value.absent(),
  });
  HistoricoSincronizacaoCompanion.insert({
    this.localTs = const Value.absent(),
    required int remoteTs,
    required int mutiraoId,
  }) : remoteTs = Value(remoteTs),
       mutiraoId = Value(mutiraoId);
  static Insertable<HistoricoSincronizacaoData> custom({
    Expression<int>? localTs,
    Expression<int>? remoteTs,
    Expression<int>? mutiraoId,
  }) {
    return RawValuesInsertable({
      if (localTs != null) 'local_ts': localTs,
      if (remoteTs != null) 'remote_ts': remoteTs,
      if (mutiraoId != null) 'mutirao_id': mutiraoId,
    });
  }

  HistoricoSincronizacaoCompanion copyWith({
    Value<int>? localTs,
    Value<int>? remoteTs,
    Value<int>? mutiraoId,
  }) {
    return HistoricoSincronizacaoCompanion(
      localTs: localTs ?? this.localTs,
      remoteTs: remoteTs ?? this.remoteTs,
      mutiraoId: mutiraoId ?? this.mutiraoId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (localTs.present) {
      map['local_ts'] = Variable<int>(localTs.value);
    }
    if (remoteTs.present) {
      map['remote_ts'] = Variable<int>(remoteTs.value);
    }
    if (mutiraoId.present) {
      map['mutirao_id'] = Variable<int>(mutiraoId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HistoricoSincronizacaoCompanion(')
          ..write('localTs: $localTs, ')
          ..write('remoteTs: $remoteTs, ')
          ..write('mutiraoId: $mutiraoId')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $MutiroesTable mutiroes = $MutiroesTable(this);
  late final $PermissoesTable permissoes = $PermissoesTable(this);
  late final $ColaboradoresTable colaboradores = $ColaboradoresTable(this);
  late final $PacientesTable pacientes = $PacientesTable(this);
  late final $MedicosTable medicos = $MedicosTable(this);
  late final $CondutasTable condutas = $CondutasTable(this);
  late final $ProcedimentosTable procedimentos = $ProcedimentosTable(this);
  late final $CondutasGenericasTable condutasGenericas =
      $CondutasGenericasTable(this);
  late final $MutiraoCondutasTable mutiraoCondutas = $MutiraoCondutasTable(
    this,
  );
  late final $HistoricoSincronizacaoTable historicoSincronizacao =
      $HistoricoSincronizacaoTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    mutiroes,
    permissoes,
    colaboradores,
    pacientes,
    medicos,
    condutas,
    procedimentos,
    condutasGenericas,
    mutiraoCondutas,
    historicoSincronizacao,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'mutiroes',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('permissoes', kind: UpdateKind.delete)],
    ),
  ]);
}

typedef $$MutiroesTableCreateCompanionBuilder =
    MutiroesCompanion Function({
      Value<int> id,
      required String tipo,
      required String dataInicio,
      required String dataFinal,
      required String estado,
      required String municipio,
      required String local,
      required String demandante,
      required String contratante,
      required int atualizadoEm,
      Value<int> status,
    });
typedef $$MutiroesTableUpdateCompanionBuilder =
    MutiroesCompanion Function({
      Value<int> id,
      Value<String> tipo,
      Value<String> dataInicio,
      Value<String> dataFinal,
      Value<String> estado,
      Value<String> municipio,
      Value<String> local,
      Value<String> demandante,
      Value<String> contratante,
      Value<int> atualizadoEm,
      Value<int> status,
    });

final class $$MutiroesTableReferences
    extends BaseReferences<_$AppDatabase, $MutiroesTable, Mutirao> {
  $$MutiroesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$PermissoesTable, List<Permissao>>
  _permissoesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.permissoes,
    aliasName: $_aliasNameGenerator(db.mutiroes.id, db.permissoes.mutiraoId),
  );

  $$PermissoesTableProcessedTableManager get permissoesRefs {
    final manager = $$PermissoesTableTableManager(
      $_db,
      $_db.permissoes,
    ).filter((f) => f.mutiraoId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_permissoesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$MedicosTable, List<Medico>> _medicosRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.medicos,
    aliasName: $_aliasNameGenerator(db.mutiroes.id, db.medicos.mutiraoId),
  );

  $$MedicosTableProcessedTableManager get medicosRefs {
    final manager = $$MedicosTableTableManager(
      $_db,
      $_db.medicos,
    ).filter((f) => f.mutiraoId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_medicosRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$CondutasTable, List<Conduta>> _condutasRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.condutas,
    aliasName: $_aliasNameGenerator(db.mutiroes.id, db.condutas.mutiraoId),
  );

  $$CondutasTableProcessedTableManager get condutasRefs {
    final manager = $$CondutasTableTableManager(
      $_db,
      $_db.condutas,
    ).filter((f) => f.mutiraoId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_condutasRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ProcedimentosTable, List<Procedimento>>
  _procedimentosRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.procedimentos,
    aliasName: $_aliasNameGenerator(db.mutiroes.id, db.procedimentos.mutiraoId),
  );

  $$ProcedimentosTableProcessedTableManager get procedimentosRefs {
    final manager = $$ProcedimentosTableTableManager(
      $_db,
      $_db.procedimentos,
    ).filter((f) => f.mutiraoId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_procedimentosRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$CondutasGenericasTable, List<CondutaGenerica>>
  _condutasGenericasRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.condutasGenericas,
        aliasName: $_aliasNameGenerator(
          db.mutiroes.id,
          db.condutasGenericas.mutiraoId,
        ),
      );

  $$CondutasGenericasTableProcessedTableManager get condutasGenericasRefs {
    final manager = $$CondutasGenericasTableTableManager(
      $_db,
      $_db.condutasGenericas,
    ).filter((f) => f.mutiraoId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _condutasGenericasRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$MutiraoCondutasTable, List<MutiraoConduta>>
  _mutiraoCondutasRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.mutiraoCondutas,
    aliasName: $_aliasNameGenerator(
      db.mutiroes.id,
      db.mutiraoCondutas.mutiraoId,
    ),
  );

  $$MutiraoCondutasTableProcessedTableManager get mutiraoCondutasRefs {
    final manager = $$MutiraoCondutasTableTableManager(
      $_db,
      $_db.mutiraoCondutas,
    ).filter((f) => f.mutiraoId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _mutiraoCondutasRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $HistoricoSincronizacaoTable,
    List<HistoricoSincronizacaoData>
  >
  _historicoSincronizacaoRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.historicoSincronizacao,
        aliasName: $_aliasNameGenerator(
          db.mutiroes.id,
          db.historicoSincronizacao.mutiraoId,
        ),
      );

  $$HistoricoSincronizacaoTableProcessedTableManager
  get historicoSincronizacaoRefs {
    final manager = $$HistoricoSincronizacaoTableTableManager(
      $_db,
      $_db.historicoSincronizacao,
    ).filter((f) => f.mutiraoId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _historicoSincronizacaoRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$MutiroesTableFilterComposer
    extends Composer<_$AppDatabase, $MutiroesTable> {
  $$MutiroesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tipo => $composableBuilder(
    column: $table.tipo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get dataInicio => $composableBuilder(
    column: $table.dataInicio,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get dataFinal => $composableBuilder(
    column: $table.dataFinal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get estado => $composableBuilder(
    column: $table.estado,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get municipio => $composableBuilder(
    column: $table.municipio,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get local => $composableBuilder(
    column: $table.local,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get demandante => $composableBuilder(
    column: $table.demandante,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get contratante => $composableBuilder(
    column: $table.contratante,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get atualizadoEm => $composableBuilder(
    column: $table.atualizadoEm,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> permissoesRefs(
    Expression<bool> Function($$PermissoesTableFilterComposer f) f,
  ) {
    final $$PermissoesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.permissoes,
      getReferencedColumn: (t) => t.mutiraoId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PermissoesTableFilterComposer(
            $db: $db,
            $table: $db.permissoes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> medicosRefs(
    Expression<bool> Function($$MedicosTableFilterComposer f) f,
  ) {
    final $$MedicosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.medicos,
      getReferencedColumn: (t) => t.mutiraoId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MedicosTableFilterComposer(
            $db: $db,
            $table: $db.medicos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> condutasRefs(
    Expression<bool> Function($$CondutasTableFilterComposer f) f,
  ) {
    final $$CondutasTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.condutas,
      getReferencedColumn: (t) => t.mutiraoId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CondutasTableFilterComposer(
            $db: $db,
            $table: $db.condutas,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> procedimentosRefs(
    Expression<bool> Function($$ProcedimentosTableFilterComposer f) f,
  ) {
    final $$ProcedimentosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.procedimentos,
      getReferencedColumn: (t) => t.mutiraoId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProcedimentosTableFilterComposer(
            $db: $db,
            $table: $db.procedimentos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> condutasGenericasRefs(
    Expression<bool> Function($$CondutasGenericasTableFilterComposer f) f,
  ) {
    final $$CondutasGenericasTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.condutasGenericas,
      getReferencedColumn: (t) => t.mutiraoId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CondutasGenericasTableFilterComposer(
            $db: $db,
            $table: $db.condutasGenericas,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> mutiraoCondutasRefs(
    Expression<bool> Function($$MutiraoCondutasTableFilterComposer f) f,
  ) {
    final $$MutiraoCondutasTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.mutiraoCondutas,
      getReferencedColumn: (t) => t.mutiraoId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MutiraoCondutasTableFilterComposer(
            $db: $db,
            $table: $db.mutiraoCondutas,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> historicoSincronizacaoRefs(
    Expression<bool> Function($$HistoricoSincronizacaoTableFilterComposer f) f,
  ) {
    final $$HistoricoSincronizacaoTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.historicoSincronizacao,
          getReferencedColumn: (t) => t.mutiraoId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$HistoricoSincronizacaoTableFilterComposer(
                $db: $db,
                $table: $db.historicoSincronizacao,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$MutiroesTableOrderingComposer
    extends Composer<_$AppDatabase, $MutiroesTable> {
  $$MutiroesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tipo => $composableBuilder(
    column: $table.tipo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dataInicio => $composableBuilder(
    column: $table.dataInicio,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dataFinal => $composableBuilder(
    column: $table.dataFinal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get estado => $composableBuilder(
    column: $table.estado,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get municipio => $composableBuilder(
    column: $table.municipio,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get local => $composableBuilder(
    column: $table.local,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get demandante => $composableBuilder(
    column: $table.demandante,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get contratante => $composableBuilder(
    column: $table.contratante,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get atualizadoEm => $composableBuilder(
    column: $table.atualizadoEm,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MutiroesTableAnnotationComposer
    extends Composer<_$AppDatabase, $MutiroesTable> {
  $$MutiroesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get tipo =>
      $composableBuilder(column: $table.tipo, builder: (column) => column);

  GeneratedColumn<String> get dataInicio => $composableBuilder(
    column: $table.dataInicio,
    builder: (column) => column,
  );

  GeneratedColumn<String> get dataFinal =>
      $composableBuilder(column: $table.dataFinal, builder: (column) => column);

  GeneratedColumn<String> get estado =>
      $composableBuilder(column: $table.estado, builder: (column) => column);

  GeneratedColumn<String> get municipio =>
      $composableBuilder(column: $table.municipio, builder: (column) => column);

  GeneratedColumn<String> get local =>
      $composableBuilder(column: $table.local, builder: (column) => column);

  GeneratedColumn<String> get demandante => $composableBuilder(
    column: $table.demandante,
    builder: (column) => column,
  );

  GeneratedColumn<String> get contratante => $composableBuilder(
    column: $table.contratante,
    builder: (column) => column,
  );

  GeneratedColumn<int> get atualizadoEm => $composableBuilder(
    column: $table.atualizadoEm,
    builder: (column) => column,
  );

  GeneratedColumn<int> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  Expression<T> permissoesRefs<T extends Object>(
    Expression<T> Function($$PermissoesTableAnnotationComposer a) f,
  ) {
    final $$PermissoesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.permissoes,
      getReferencedColumn: (t) => t.mutiraoId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PermissoesTableAnnotationComposer(
            $db: $db,
            $table: $db.permissoes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> medicosRefs<T extends Object>(
    Expression<T> Function($$MedicosTableAnnotationComposer a) f,
  ) {
    final $$MedicosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.medicos,
      getReferencedColumn: (t) => t.mutiraoId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MedicosTableAnnotationComposer(
            $db: $db,
            $table: $db.medicos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> condutasRefs<T extends Object>(
    Expression<T> Function($$CondutasTableAnnotationComposer a) f,
  ) {
    final $$CondutasTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.condutas,
      getReferencedColumn: (t) => t.mutiraoId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CondutasTableAnnotationComposer(
            $db: $db,
            $table: $db.condutas,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> procedimentosRefs<T extends Object>(
    Expression<T> Function($$ProcedimentosTableAnnotationComposer a) f,
  ) {
    final $$ProcedimentosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.procedimentos,
      getReferencedColumn: (t) => t.mutiraoId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProcedimentosTableAnnotationComposer(
            $db: $db,
            $table: $db.procedimentos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> condutasGenericasRefs<T extends Object>(
    Expression<T> Function($$CondutasGenericasTableAnnotationComposer a) f,
  ) {
    final $$CondutasGenericasTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.condutasGenericas,
          getReferencedColumn: (t) => t.mutiraoId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$CondutasGenericasTableAnnotationComposer(
                $db: $db,
                $table: $db.condutasGenericas,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> mutiraoCondutasRefs<T extends Object>(
    Expression<T> Function($$MutiraoCondutasTableAnnotationComposer a) f,
  ) {
    final $$MutiraoCondutasTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.mutiraoCondutas,
      getReferencedColumn: (t) => t.mutiraoId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MutiraoCondutasTableAnnotationComposer(
            $db: $db,
            $table: $db.mutiraoCondutas,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> historicoSincronizacaoRefs<T extends Object>(
    Expression<T> Function($$HistoricoSincronizacaoTableAnnotationComposer a) f,
  ) {
    final $$HistoricoSincronizacaoTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.historicoSincronizacao,
          getReferencedColumn: (t) => t.mutiraoId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$HistoricoSincronizacaoTableAnnotationComposer(
                $db: $db,
                $table: $db.historicoSincronizacao,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$MutiroesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MutiroesTable,
          Mutirao,
          $$MutiroesTableFilterComposer,
          $$MutiroesTableOrderingComposer,
          $$MutiroesTableAnnotationComposer,
          $$MutiroesTableCreateCompanionBuilder,
          $$MutiroesTableUpdateCompanionBuilder,
          (Mutirao, $$MutiroesTableReferences),
          Mutirao,
          PrefetchHooks Function({
            bool permissoesRefs,
            bool medicosRefs,
            bool condutasRefs,
            bool procedimentosRefs,
            bool condutasGenericasRefs,
            bool mutiraoCondutasRefs,
            bool historicoSincronizacaoRefs,
          })
        > {
  $$MutiroesTableTableManager(_$AppDatabase db, $MutiroesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MutiroesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MutiroesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MutiroesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> tipo = const Value.absent(),
                Value<String> dataInicio = const Value.absent(),
                Value<String> dataFinal = const Value.absent(),
                Value<String> estado = const Value.absent(),
                Value<String> municipio = const Value.absent(),
                Value<String> local = const Value.absent(),
                Value<String> demandante = const Value.absent(),
                Value<String> contratante = const Value.absent(),
                Value<int> atualizadoEm = const Value.absent(),
                Value<int> status = const Value.absent(),
              }) => MutiroesCompanion(
                id: id,
                tipo: tipo,
                dataInicio: dataInicio,
                dataFinal: dataFinal,
                estado: estado,
                municipio: municipio,
                local: local,
                demandante: demandante,
                contratante: contratante,
                atualizadoEm: atualizadoEm,
                status: status,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String tipo,
                required String dataInicio,
                required String dataFinal,
                required String estado,
                required String municipio,
                required String local,
                required String demandante,
                required String contratante,
                required int atualizadoEm,
                Value<int> status = const Value.absent(),
              }) => MutiroesCompanion.insert(
                id: id,
                tipo: tipo,
                dataInicio: dataInicio,
                dataFinal: dataFinal,
                estado: estado,
                municipio: municipio,
                local: local,
                demandante: demandante,
                contratante: contratante,
                atualizadoEm: atualizadoEm,
                status: status,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$MutiroesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                permissoesRefs = false,
                medicosRefs = false,
                condutasRefs = false,
                procedimentosRefs = false,
                condutasGenericasRefs = false,
                mutiraoCondutasRefs = false,
                historicoSincronizacaoRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (permissoesRefs) db.permissoes,
                    if (medicosRefs) db.medicos,
                    if (condutasRefs) db.condutas,
                    if (procedimentosRefs) db.procedimentos,
                    if (condutasGenericasRefs) db.condutasGenericas,
                    if (mutiraoCondutasRefs) db.mutiraoCondutas,
                    if (historicoSincronizacaoRefs) db.historicoSincronizacao,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (permissoesRefs)
                        await $_getPrefetchedData<
                          Mutirao,
                          $MutiroesTable,
                          Permissao
                        >(
                          currentTable: table,
                          referencedTable: $$MutiroesTableReferences
                              ._permissoesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$MutiroesTableReferences(
                                db,
                                table,
                                p0,
                              ).permissoesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.mutiraoId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (medicosRefs)
                        await $_getPrefetchedData<
                          Mutirao,
                          $MutiroesTable,
                          Medico
                        >(
                          currentTable: table,
                          referencedTable: $$MutiroesTableReferences
                              ._medicosRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$MutiroesTableReferences(
                                db,
                                table,
                                p0,
                              ).medicosRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.mutiraoId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (condutasRefs)
                        await $_getPrefetchedData<
                          Mutirao,
                          $MutiroesTable,
                          Conduta
                        >(
                          currentTable: table,
                          referencedTable: $$MutiroesTableReferences
                              ._condutasRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$MutiroesTableReferences(
                                db,
                                table,
                                p0,
                              ).condutasRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.mutiraoId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (procedimentosRefs)
                        await $_getPrefetchedData<
                          Mutirao,
                          $MutiroesTable,
                          Procedimento
                        >(
                          currentTable: table,
                          referencedTable: $$MutiroesTableReferences
                              ._procedimentosRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$MutiroesTableReferences(
                                db,
                                table,
                                p0,
                              ).procedimentosRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.mutiraoId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (condutasGenericasRefs)
                        await $_getPrefetchedData<
                          Mutirao,
                          $MutiroesTable,
                          CondutaGenerica
                        >(
                          currentTable: table,
                          referencedTable: $$MutiroesTableReferences
                              ._condutasGenericasRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$MutiroesTableReferences(
                                db,
                                table,
                                p0,
                              ).condutasGenericasRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.mutiraoId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (mutiraoCondutasRefs)
                        await $_getPrefetchedData<
                          Mutirao,
                          $MutiroesTable,
                          MutiraoConduta
                        >(
                          currentTable: table,
                          referencedTable: $$MutiroesTableReferences
                              ._mutiraoCondutasRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$MutiroesTableReferences(
                                db,
                                table,
                                p0,
                              ).mutiraoCondutasRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.mutiraoId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (historicoSincronizacaoRefs)
                        await $_getPrefetchedData<
                          Mutirao,
                          $MutiroesTable,
                          HistoricoSincronizacaoData
                        >(
                          currentTable: table,
                          referencedTable: $$MutiroesTableReferences
                              ._historicoSincronizacaoRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$MutiroesTableReferences(
                                db,
                                table,
                                p0,
                              ).historicoSincronizacaoRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.mutiraoId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$MutiroesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MutiroesTable,
      Mutirao,
      $$MutiroesTableFilterComposer,
      $$MutiroesTableOrderingComposer,
      $$MutiroesTableAnnotationComposer,
      $$MutiroesTableCreateCompanionBuilder,
      $$MutiroesTableUpdateCompanionBuilder,
      (Mutirao, $$MutiroesTableReferences),
      Mutirao,
      PrefetchHooks Function({
        bool permissoesRefs,
        bool medicosRefs,
        bool condutasRefs,
        bool procedimentosRefs,
        bool condutasGenericasRefs,
        bool mutiraoCondutasRefs,
        bool historicoSincronizacaoRefs,
      })
    >;
typedef $$PermissoesTableCreateCompanionBuilder =
    PermissoesCompanion Function({
      required int mutiraoId,
      required String email,
      required String permissoes,
      Value<int> rowid,
    });
typedef $$PermissoesTableUpdateCompanionBuilder =
    PermissoesCompanion Function({
      Value<int> mutiraoId,
      Value<String> email,
      Value<String> permissoes,
      Value<int> rowid,
    });

final class $$PermissoesTableReferences
    extends BaseReferences<_$AppDatabase, $PermissoesTable, Permissao> {
  $$PermissoesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $MutiroesTable _mutiraoIdTable(_$AppDatabase db) =>
      db.mutiroes.createAlias(
        $_aliasNameGenerator(db.permissoes.mutiraoId, db.mutiroes.id),
      );

  $$MutiroesTableProcessedTableManager get mutiraoId {
    final $_column = $_itemColumn<int>('mutirao_id')!;

    final manager = $$MutiroesTableTableManager(
      $_db,
      $_db.mutiroes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_mutiraoIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$PermissoesTableFilterComposer
    extends Composer<_$AppDatabase, $PermissoesTable> {
  $$PermissoesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get permissoes => $composableBuilder(
    column: $table.permissoes,
    builder: (column) => ColumnFilters(column),
  );

  $$MutiroesTableFilterComposer get mutiraoId {
    final $$MutiroesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mutiraoId,
      referencedTable: $db.mutiroes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MutiroesTableFilterComposer(
            $db: $db,
            $table: $db.mutiroes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PermissoesTableOrderingComposer
    extends Composer<_$AppDatabase, $PermissoesTable> {
  $$PermissoesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get permissoes => $composableBuilder(
    column: $table.permissoes,
    builder: (column) => ColumnOrderings(column),
  );

  $$MutiroesTableOrderingComposer get mutiraoId {
    final $$MutiroesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mutiraoId,
      referencedTable: $db.mutiroes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MutiroesTableOrderingComposer(
            $db: $db,
            $table: $db.mutiroes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PermissoesTableAnnotationComposer
    extends Composer<_$AppDatabase, $PermissoesTable> {
  $$PermissoesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get permissoes => $composableBuilder(
    column: $table.permissoes,
    builder: (column) => column,
  );

  $$MutiroesTableAnnotationComposer get mutiraoId {
    final $$MutiroesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mutiraoId,
      referencedTable: $db.mutiroes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MutiroesTableAnnotationComposer(
            $db: $db,
            $table: $db.mutiroes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PermissoesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PermissoesTable,
          Permissao,
          $$PermissoesTableFilterComposer,
          $$PermissoesTableOrderingComposer,
          $$PermissoesTableAnnotationComposer,
          $$PermissoesTableCreateCompanionBuilder,
          $$PermissoesTableUpdateCompanionBuilder,
          (Permissao, $$PermissoesTableReferences),
          Permissao,
          PrefetchHooks Function({bool mutiraoId})
        > {
  $$PermissoesTableTableManager(_$AppDatabase db, $PermissoesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PermissoesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PermissoesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PermissoesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> mutiraoId = const Value.absent(),
                Value<String> email = const Value.absent(),
                Value<String> permissoes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PermissoesCompanion(
                mutiraoId: mutiraoId,
                email: email,
                permissoes: permissoes,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int mutiraoId,
                required String email,
                required String permissoes,
                Value<int> rowid = const Value.absent(),
              }) => PermissoesCompanion.insert(
                mutiraoId: mutiraoId,
                email: email,
                permissoes: permissoes,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PermissoesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({mutiraoId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (mutiraoId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.mutiraoId,
                                referencedTable: $$PermissoesTableReferences
                                    ._mutiraoIdTable(db),
                                referencedColumn: $$PermissoesTableReferences
                                    ._mutiraoIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$PermissoesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PermissoesTable,
      Permissao,
      $$PermissoesTableFilterComposer,
      $$PermissoesTableOrderingComposer,
      $$PermissoesTableAnnotationComposer,
      $$PermissoesTableCreateCompanionBuilder,
      $$PermissoesTableUpdateCompanionBuilder,
      (Permissao, $$PermissoesTableReferences),
      Permissao,
      PrefetchHooks Function({bool mutiraoId})
    >;
typedef $$ColaboradoresTableCreateCompanionBuilder =
    ColaboradoresCompanion Function({
      Value<int> id,
      required int mutiraoId,
      required String nome,
      required String funcao,
      required int atualizadoEm,
      Value<int> status,
    });
typedef $$ColaboradoresTableUpdateCompanionBuilder =
    ColaboradoresCompanion Function({
      Value<int> id,
      Value<int> mutiraoId,
      Value<String> nome,
      Value<String> funcao,
      Value<int> atualizadoEm,
      Value<int> status,
    });

class $$ColaboradoresTableFilterComposer
    extends Composer<_$AppDatabase, $ColaboradoresTable> {
  $$ColaboradoresTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get mutiraoId => $composableBuilder(
    column: $table.mutiraoId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nome => $composableBuilder(
    column: $table.nome,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get funcao => $composableBuilder(
    column: $table.funcao,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get atualizadoEm => $composableBuilder(
    column: $table.atualizadoEm,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ColaboradoresTableOrderingComposer
    extends Composer<_$AppDatabase, $ColaboradoresTable> {
  $$ColaboradoresTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get mutiraoId => $composableBuilder(
    column: $table.mutiraoId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nome => $composableBuilder(
    column: $table.nome,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get funcao => $composableBuilder(
    column: $table.funcao,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get atualizadoEm => $composableBuilder(
    column: $table.atualizadoEm,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ColaboradoresTableAnnotationComposer
    extends Composer<_$AppDatabase, $ColaboradoresTable> {
  $$ColaboradoresTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get mutiraoId =>
      $composableBuilder(column: $table.mutiraoId, builder: (column) => column);

  GeneratedColumn<String> get nome =>
      $composableBuilder(column: $table.nome, builder: (column) => column);

  GeneratedColumn<String> get funcao =>
      $composableBuilder(column: $table.funcao, builder: (column) => column);

  GeneratedColumn<int> get atualizadoEm => $composableBuilder(
    column: $table.atualizadoEm,
    builder: (column) => column,
  );

  GeneratedColumn<int> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);
}

class $$ColaboradoresTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ColaboradoresTable,
          Colaborador,
          $$ColaboradoresTableFilterComposer,
          $$ColaboradoresTableOrderingComposer,
          $$ColaboradoresTableAnnotationComposer,
          $$ColaboradoresTableCreateCompanionBuilder,
          $$ColaboradoresTableUpdateCompanionBuilder,
          (
            Colaborador,
            BaseReferences<_$AppDatabase, $ColaboradoresTable, Colaborador>,
          ),
          Colaborador,
          PrefetchHooks Function()
        > {
  $$ColaboradoresTableTableManager(_$AppDatabase db, $ColaboradoresTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ColaboradoresTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ColaboradoresTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ColaboradoresTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> mutiraoId = const Value.absent(),
                Value<String> nome = const Value.absent(),
                Value<String> funcao = const Value.absent(),
                Value<int> atualizadoEm = const Value.absent(),
                Value<int> status = const Value.absent(),
              }) => ColaboradoresCompanion(
                id: id,
                mutiraoId: mutiraoId,
                nome: nome,
                funcao: funcao,
                atualizadoEm: atualizadoEm,
                status: status,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int mutiraoId,
                required String nome,
                required String funcao,
                required int atualizadoEm,
                Value<int> status = const Value.absent(),
              }) => ColaboradoresCompanion.insert(
                id: id,
                mutiraoId: mutiraoId,
                nome: nome,
                funcao: funcao,
                atualizadoEm: atualizadoEm,
                status: status,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ColaboradoresTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ColaboradoresTable,
      Colaborador,
      $$ColaboradoresTableFilterComposer,
      $$ColaboradoresTableOrderingComposer,
      $$ColaboradoresTableAnnotationComposer,
      $$ColaboradoresTableCreateCompanionBuilder,
      $$ColaboradoresTableUpdateCompanionBuilder,
      (
        Colaborador,
        BaseReferences<_$AppDatabase, $ColaboradoresTable, Colaborador>,
      ),
      Colaborador,
      PrefetchHooks Function()
    >;
typedef $$PacientesTableCreateCompanionBuilder =
    PacientesCompanion Function({
      Value<int> id,
      Value<String?> cpf,
      Value<String?> cns,
      Value<String?> nome,
      Value<String?> tel,
      Value<String?> dataNascimento,
      Value<String?> uf,
      Value<String?> municipio,
      Value<String?> endereco,
      Value<String?> nomeDaMae,
      required int atualizadoEm,
      Value<int> status,
    });
typedef $$PacientesTableUpdateCompanionBuilder =
    PacientesCompanion Function({
      Value<int> id,
      Value<String?> cpf,
      Value<String?> cns,
      Value<String?> nome,
      Value<String?> tel,
      Value<String?> dataNascimento,
      Value<String?> uf,
      Value<String?> municipio,
      Value<String?> endereco,
      Value<String?> nomeDaMae,
      Value<int> atualizadoEm,
      Value<int> status,
    });

final class $$PacientesTableReferences
    extends BaseReferences<_$AppDatabase, $PacientesTable, Paciente> {
  $$PacientesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$CondutasTable, List<Conduta>> _condutasRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.condutas,
    aliasName: $_aliasNameGenerator(db.pacientes.id, db.condutas.pacienteId),
  );

  $$CondutasTableProcessedTableManager get condutasRefs {
    final manager = $$CondutasTableTableManager(
      $_db,
      $_db.condutas,
    ).filter((f) => f.pacienteId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_condutasRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ProcedimentosTable, List<Procedimento>>
  _procedimentosRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.procedimentos,
    aliasName: $_aliasNameGenerator(
      db.pacientes.id,
      db.procedimentos.pacienteId,
    ),
  );

  $$ProcedimentosTableProcessedTableManager get procedimentosRefs {
    final manager = $$ProcedimentosTableTableManager(
      $_db,
      $_db.procedimentos,
    ).filter((f) => f.pacienteId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_procedimentosRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$CondutasGenericasTable, List<CondutaGenerica>>
  _condutasGenericasRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.condutasGenericas,
        aliasName: $_aliasNameGenerator(
          db.pacientes.id,
          db.condutasGenericas.pacienteId,
        ),
      );

  $$CondutasGenericasTableProcessedTableManager get condutasGenericasRefs {
    final manager = $$CondutasGenericasTableTableManager(
      $_db,
      $_db.condutasGenericas,
    ).filter((f) => f.pacienteId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _condutasGenericasRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$PacientesTableFilterComposer
    extends Composer<_$AppDatabase, $PacientesTable> {
  $$PacientesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cpf => $composableBuilder(
    column: $table.cpf,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cns => $composableBuilder(
    column: $table.cns,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nome => $composableBuilder(
    column: $table.nome,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tel => $composableBuilder(
    column: $table.tel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get dataNascimento => $composableBuilder(
    column: $table.dataNascimento,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get uf => $composableBuilder(
    column: $table.uf,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get municipio => $composableBuilder(
    column: $table.municipio,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get endereco => $composableBuilder(
    column: $table.endereco,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nomeDaMae => $composableBuilder(
    column: $table.nomeDaMae,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get atualizadoEm => $composableBuilder(
    column: $table.atualizadoEm,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> condutasRefs(
    Expression<bool> Function($$CondutasTableFilterComposer f) f,
  ) {
    final $$CondutasTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.condutas,
      getReferencedColumn: (t) => t.pacienteId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CondutasTableFilterComposer(
            $db: $db,
            $table: $db.condutas,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> procedimentosRefs(
    Expression<bool> Function($$ProcedimentosTableFilterComposer f) f,
  ) {
    final $$ProcedimentosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.procedimentos,
      getReferencedColumn: (t) => t.pacienteId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProcedimentosTableFilterComposer(
            $db: $db,
            $table: $db.procedimentos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> condutasGenericasRefs(
    Expression<bool> Function($$CondutasGenericasTableFilterComposer f) f,
  ) {
    final $$CondutasGenericasTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.condutasGenericas,
      getReferencedColumn: (t) => t.pacienteId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CondutasGenericasTableFilterComposer(
            $db: $db,
            $table: $db.condutasGenericas,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PacientesTableOrderingComposer
    extends Composer<_$AppDatabase, $PacientesTable> {
  $$PacientesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cpf => $composableBuilder(
    column: $table.cpf,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cns => $composableBuilder(
    column: $table.cns,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nome => $composableBuilder(
    column: $table.nome,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tel => $composableBuilder(
    column: $table.tel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dataNascimento => $composableBuilder(
    column: $table.dataNascimento,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get uf => $composableBuilder(
    column: $table.uf,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get municipio => $composableBuilder(
    column: $table.municipio,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get endereco => $composableBuilder(
    column: $table.endereco,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nomeDaMae => $composableBuilder(
    column: $table.nomeDaMae,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get atualizadoEm => $composableBuilder(
    column: $table.atualizadoEm,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PacientesTableAnnotationComposer
    extends Composer<_$AppDatabase, $PacientesTable> {
  $$PacientesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get cpf =>
      $composableBuilder(column: $table.cpf, builder: (column) => column);

  GeneratedColumn<String> get cns =>
      $composableBuilder(column: $table.cns, builder: (column) => column);

  GeneratedColumn<String> get nome =>
      $composableBuilder(column: $table.nome, builder: (column) => column);

  GeneratedColumn<String> get tel =>
      $composableBuilder(column: $table.tel, builder: (column) => column);

  GeneratedColumn<String> get dataNascimento => $composableBuilder(
    column: $table.dataNascimento,
    builder: (column) => column,
  );

  GeneratedColumn<String> get uf =>
      $composableBuilder(column: $table.uf, builder: (column) => column);

  GeneratedColumn<String> get municipio =>
      $composableBuilder(column: $table.municipio, builder: (column) => column);

  GeneratedColumn<String> get endereco =>
      $composableBuilder(column: $table.endereco, builder: (column) => column);

  GeneratedColumn<String> get nomeDaMae =>
      $composableBuilder(column: $table.nomeDaMae, builder: (column) => column);

  GeneratedColumn<int> get atualizadoEm => $composableBuilder(
    column: $table.atualizadoEm,
    builder: (column) => column,
  );

  GeneratedColumn<int> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  Expression<T> condutasRefs<T extends Object>(
    Expression<T> Function($$CondutasTableAnnotationComposer a) f,
  ) {
    final $$CondutasTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.condutas,
      getReferencedColumn: (t) => t.pacienteId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CondutasTableAnnotationComposer(
            $db: $db,
            $table: $db.condutas,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> procedimentosRefs<T extends Object>(
    Expression<T> Function($$ProcedimentosTableAnnotationComposer a) f,
  ) {
    final $$ProcedimentosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.procedimentos,
      getReferencedColumn: (t) => t.pacienteId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProcedimentosTableAnnotationComposer(
            $db: $db,
            $table: $db.procedimentos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> condutasGenericasRefs<T extends Object>(
    Expression<T> Function($$CondutasGenericasTableAnnotationComposer a) f,
  ) {
    final $$CondutasGenericasTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.condutasGenericas,
          getReferencedColumn: (t) => t.pacienteId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$CondutasGenericasTableAnnotationComposer(
                $db: $db,
                $table: $db.condutasGenericas,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$PacientesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PacientesTable,
          Paciente,
          $$PacientesTableFilterComposer,
          $$PacientesTableOrderingComposer,
          $$PacientesTableAnnotationComposer,
          $$PacientesTableCreateCompanionBuilder,
          $$PacientesTableUpdateCompanionBuilder,
          (Paciente, $$PacientesTableReferences),
          Paciente,
          PrefetchHooks Function({
            bool condutasRefs,
            bool procedimentosRefs,
            bool condutasGenericasRefs,
          })
        > {
  $$PacientesTableTableManager(_$AppDatabase db, $PacientesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PacientesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PacientesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PacientesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> cpf = const Value.absent(),
                Value<String?> cns = const Value.absent(),
                Value<String?> nome = const Value.absent(),
                Value<String?> tel = const Value.absent(),
                Value<String?> dataNascimento = const Value.absent(),
                Value<String?> uf = const Value.absent(),
                Value<String?> municipio = const Value.absent(),
                Value<String?> endereco = const Value.absent(),
                Value<String?> nomeDaMae = const Value.absent(),
                Value<int> atualizadoEm = const Value.absent(),
                Value<int> status = const Value.absent(),
              }) => PacientesCompanion(
                id: id,
                cpf: cpf,
                cns: cns,
                nome: nome,
                tel: tel,
                dataNascimento: dataNascimento,
                uf: uf,
                municipio: municipio,
                endereco: endereco,
                nomeDaMae: nomeDaMae,
                atualizadoEm: atualizadoEm,
                status: status,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> cpf = const Value.absent(),
                Value<String?> cns = const Value.absent(),
                Value<String?> nome = const Value.absent(),
                Value<String?> tel = const Value.absent(),
                Value<String?> dataNascimento = const Value.absent(),
                Value<String?> uf = const Value.absent(),
                Value<String?> municipio = const Value.absent(),
                Value<String?> endereco = const Value.absent(),
                Value<String?> nomeDaMae = const Value.absent(),
                required int atualizadoEm,
                Value<int> status = const Value.absent(),
              }) => PacientesCompanion.insert(
                id: id,
                cpf: cpf,
                cns: cns,
                nome: nome,
                tel: tel,
                dataNascimento: dataNascimento,
                uf: uf,
                municipio: municipio,
                endereco: endereco,
                nomeDaMae: nomeDaMae,
                atualizadoEm: atualizadoEm,
                status: status,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PacientesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                condutasRefs = false,
                procedimentosRefs = false,
                condutasGenericasRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (condutasRefs) db.condutas,
                    if (procedimentosRefs) db.procedimentos,
                    if (condutasGenericasRefs) db.condutasGenericas,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (condutasRefs)
                        await $_getPrefetchedData<
                          Paciente,
                          $PacientesTable,
                          Conduta
                        >(
                          currentTable: table,
                          referencedTable: $$PacientesTableReferences
                              ._condutasRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PacientesTableReferences(
                                db,
                                table,
                                p0,
                              ).condutasRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.pacienteId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (procedimentosRefs)
                        await $_getPrefetchedData<
                          Paciente,
                          $PacientesTable,
                          Procedimento
                        >(
                          currentTable: table,
                          referencedTable: $$PacientesTableReferences
                              ._procedimentosRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PacientesTableReferences(
                                db,
                                table,
                                p0,
                              ).procedimentosRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.pacienteId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (condutasGenericasRefs)
                        await $_getPrefetchedData<
                          Paciente,
                          $PacientesTable,
                          CondutaGenerica
                        >(
                          currentTable: table,
                          referencedTable: $$PacientesTableReferences
                              ._condutasGenericasRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PacientesTableReferences(
                                db,
                                table,
                                p0,
                              ).condutasGenericasRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.pacienteId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$PacientesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PacientesTable,
      Paciente,
      $$PacientesTableFilterComposer,
      $$PacientesTableOrderingComposer,
      $$PacientesTableAnnotationComposer,
      $$PacientesTableCreateCompanionBuilder,
      $$PacientesTableUpdateCompanionBuilder,
      (Paciente, $$PacientesTableReferences),
      Paciente,
      PrefetchHooks Function({
        bool condutasRefs,
        bool procedimentosRefs,
        bool condutasGenericasRefs,
      })
    >;
typedef $$MedicosTableCreateCompanionBuilder =
    MedicosCompanion Function({
      Value<int> id,
      required int mutiraoId,
      required String nome,
      required String crm,
      required int atualizadoEm,
      Value<int> status,
    });
typedef $$MedicosTableUpdateCompanionBuilder =
    MedicosCompanion Function({
      Value<int> id,
      Value<int> mutiraoId,
      Value<String> nome,
      Value<String> crm,
      Value<int> atualizadoEm,
      Value<int> status,
    });

final class $$MedicosTableReferences
    extends BaseReferences<_$AppDatabase, $MedicosTable, Medico> {
  $$MedicosTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $MutiroesTable _mutiraoIdTable(_$AppDatabase db) => db.mutiroes
      .createAlias($_aliasNameGenerator(db.medicos.mutiraoId, db.mutiroes.id));

  $$MutiroesTableProcessedTableManager get mutiraoId {
    final $_column = $_itemColumn<int>('mutirao_id')!;

    final manager = $$MutiroesTableTableManager(
      $_db,
      $_db.mutiroes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_mutiraoIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$ProcedimentosTable, List<Procedimento>>
  _procedimentosRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.procedimentos,
    aliasName: $_aliasNameGenerator(db.medicos.id, db.procedimentos.medicoId),
  );

  $$ProcedimentosTableProcessedTableManager get procedimentosRefs {
    final manager = $$ProcedimentosTableTableManager(
      $_db,
      $_db.procedimentos,
    ).filter((f) => f.medicoId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_procedimentosRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$CondutasGenericasTable, List<CondutaGenerica>>
  _condutasGenericasRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.condutasGenericas,
        aliasName: $_aliasNameGenerator(
          db.medicos.id,
          db.condutasGenericas.medicoId,
        ),
      );

  $$CondutasGenericasTableProcessedTableManager get condutasGenericasRefs {
    final manager = $$CondutasGenericasTableTableManager(
      $_db,
      $_db.condutasGenericas,
    ).filter((f) => f.medicoId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _condutasGenericasRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$MedicosTableFilterComposer
    extends Composer<_$AppDatabase, $MedicosTable> {
  $$MedicosTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nome => $composableBuilder(
    column: $table.nome,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get crm => $composableBuilder(
    column: $table.crm,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get atualizadoEm => $composableBuilder(
    column: $table.atualizadoEm,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  $$MutiroesTableFilterComposer get mutiraoId {
    final $$MutiroesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mutiraoId,
      referencedTable: $db.mutiroes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MutiroesTableFilterComposer(
            $db: $db,
            $table: $db.mutiroes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> procedimentosRefs(
    Expression<bool> Function($$ProcedimentosTableFilterComposer f) f,
  ) {
    final $$ProcedimentosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.procedimentos,
      getReferencedColumn: (t) => t.medicoId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProcedimentosTableFilterComposer(
            $db: $db,
            $table: $db.procedimentos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> condutasGenericasRefs(
    Expression<bool> Function($$CondutasGenericasTableFilterComposer f) f,
  ) {
    final $$CondutasGenericasTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.condutasGenericas,
      getReferencedColumn: (t) => t.medicoId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CondutasGenericasTableFilterComposer(
            $db: $db,
            $table: $db.condutasGenericas,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$MedicosTableOrderingComposer
    extends Composer<_$AppDatabase, $MedicosTable> {
  $$MedicosTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nome => $composableBuilder(
    column: $table.nome,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get crm => $composableBuilder(
    column: $table.crm,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get atualizadoEm => $composableBuilder(
    column: $table.atualizadoEm,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  $$MutiroesTableOrderingComposer get mutiraoId {
    final $$MutiroesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mutiraoId,
      referencedTable: $db.mutiroes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MutiroesTableOrderingComposer(
            $db: $db,
            $table: $db.mutiroes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MedicosTableAnnotationComposer
    extends Composer<_$AppDatabase, $MedicosTable> {
  $$MedicosTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get nome =>
      $composableBuilder(column: $table.nome, builder: (column) => column);

  GeneratedColumn<String> get crm =>
      $composableBuilder(column: $table.crm, builder: (column) => column);

  GeneratedColumn<int> get atualizadoEm => $composableBuilder(
    column: $table.atualizadoEm,
    builder: (column) => column,
  );

  GeneratedColumn<int> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  $$MutiroesTableAnnotationComposer get mutiraoId {
    final $$MutiroesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mutiraoId,
      referencedTable: $db.mutiroes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MutiroesTableAnnotationComposer(
            $db: $db,
            $table: $db.mutiroes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> procedimentosRefs<T extends Object>(
    Expression<T> Function($$ProcedimentosTableAnnotationComposer a) f,
  ) {
    final $$ProcedimentosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.procedimentos,
      getReferencedColumn: (t) => t.medicoId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProcedimentosTableAnnotationComposer(
            $db: $db,
            $table: $db.procedimentos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> condutasGenericasRefs<T extends Object>(
    Expression<T> Function($$CondutasGenericasTableAnnotationComposer a) f,
  ) {
    final $$CondutasGenericasTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.condutasGenericas,
          getReferencedColumn: (t) => t.medicoId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$CondutasGenericasTableAnnotationComposer(
                $db: $db,
                $table: $db.condutasGenericas,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$MedicosTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MedicosTable,
          Medico,
          $$MedicosTableFilterComposer,
          $$MedicosTableOrderingComposer,
          $$MedicosTableAnnotationComposer,
          $$MedicosTableCreateCompanionBuilder,
          $$MedicosTableUpdateCompanionBuilder,
          (Medico, $$MedicosTableReferences),
          Medico,
          PrefetchHooks Function({
            bool mutiraoId,
            bool procedimentosRefs,
            bool condutasGenericasRefs,
          })
        > {
  $$MedicosTableTableManager(_$AppDatabase db, $MedicosTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MedicosTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MedicosTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MedicosTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> mutiraoId = const Value.absent(),
                Value<String> nome = const Value.absent(),
                Value<String> crm = const Value.absent(),
                Value<int> atualizadoEm = const Value.absent(),
                Value<int> status = const Value.absent(),
              }) => MedicosCompanion(
                id: id,
                mutiraoId: mutiraoId,
                nome: nome,
                crm: crm,
                atualizadoEm: atualizadoEm,
                status: status,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int mutiraoId,
                required String nome,
                required String crm,
                required int atualizadoEm,
                Value<int> status = const Value.absent(),
              }) => MedicosCompanion.insert(
                id: id,
                mutiraoId: mutiraoId,
                nome: nome,
                crm: crm,
                atualizadoEm: atualizadoEm,
                status: status,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$MedicosTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                mutiraoId = false,
                procedimentosRefs = false,
                condutasGenericasRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (procedimentosRefs) db.procedimentos,
                    if (condutasGenericasRefs) db.condutasGenericas,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (mutiraoId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.mutiraoId,
                                    referencedTable: $$MedicosTableReferences
                                        ._mutiraoIdTable(db),
                                    referencedColumn: $$MedicosTableReferences
                                        ._mutiraoIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (procedimentosRefs)
                        await $_getPrefetchedData<
                          Medico,
                          $MedicosTable,
                          Procedimento
                        >(
                          currentTable: table,
                          referencedTable: $$MedicosTableReferences
                              ._procedimentosRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$MedicosTableReferences(
                                db,
                                table,
                                p0,
                              ).procedimentosRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.medicoId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (condutasGenericasRefs)
                        await $_getPrefetchedData<
                          Medico,
                          $MedicosTable,
                          CondutaGenerica
                        >(
                          currentTable: table,
                          referencedTable: $$MedicosTableReferences
                              ._condutasGenericasRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$MedicosTableReferences(
                                db,
                                table,
                                p0,
                              ).condutasGenericasRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.medicoId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$MedicosTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MedicosTable,
      Medico,
      $$MedicosTableFilterComposer,
      $$MedicosTableOrderingComposer,
      $$MedicosTableAnnotationComposer,
      $$MedicosTableCreateCompanionBuilder,
      $$MedicosTableUpdateCompanionBuilder,
      (Medico, $$MedicosTableReferences),
      Medico,
      PrefetchHooks Function({
        bool mutiraoId,
        bool procedimentosRefs,
        bool condutasGenericasRefs,
      })
    >;
typedef $$CondutasTableCreateCompanionBuilder =
    CondutasCompanion Function({
      Value<int> id,
      Value<String?> data,
      required int mutiraoId,
      required int pacienteId,
      Value<int?> medicoId,
      Value<String?> tipo,
      Value<String?> dados,
      required int atualizadoEm,
      Value<int> status,
    });
typedef $$CondutasTableUpdateCompanionBuilder =
    CondutasCompanion Function({
      Value<int> id,
      Value<String?> data,
      Value<int> mutiraoId,
      Value<int> pacienteId,
      Value<int?> medicoId,
      Value<String?> tipo,
      Value<String?> dados,
      Value<int> atualizadoEm,
      Value<int> status,
    });

final class $$CondutasTableReferences
    extends BaseReferences<_$AppDatabase, $CondutasTable, Conduta> {
  $$CondutasTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $MutiroesTable _mutiraoIdTable(_$AppDatabase db) => db.mutiroes
      .createAlias($_aliasNameGenerator(db.condutas.mutiraoId, db.mutiroes.id));

  $$MutiroesTableProcessedTableManager get mutiraoId {
    final $_column = $_itemColumn<int>('mutirao_id')!;

    final manager = $$MutiroesTableTableManager(
      $_db,
      $_db.mutiroes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_mutiraoIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $PacientesTable _pacienteIdTable(_$AppDatabase db) =>
      db.pacientes.createAlias(
        $_aliasNameGenerator(db.condutas.pacienteId, db.pacientes.id),
      );

  $$PacientesTableProcessedTableManager get pacienteId {
    final $_column = $_itemColumn<int>('paciente_id')!;

    final manager = $$PacientesTableTableManager(
      $_db,
      $_db.pacientes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_pacienteIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$CondutasTableFilterComposer
    extends Composer<_$AppDatabase, $CondutasTable> {
  $$CondutasTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get data => $composableBuilder(
    column: $table.data,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get medicoId => $composableBuilder(
    column: $table.medicoId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tipo => $composableBuilder(
    column: $table.tipo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get dados => $composableBuilder(
    column: $table.dados,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get atualizadoEm => $composableBuilder(
    column: $table.atualizadoEm,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  $$MutiroesTableFilterComposer get mutiraoId {
    final $$MutiroesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mutiraoId,
      referencedTable: $db.mutiroes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MutiroesTableFilterComposer(
            $db: $db,
            $table: $db.mutiroes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PacientesTableFilterComposer get pacienteId {
    final $$PacientesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.pacienteId,
      referencedTable: $db.pacientes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PacientesTableFilterComposer(
            $db: $db,
            $table: $db.pacientes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CondutasTableOrderingComposer
    extends Composer<_$AppDatabase, $CondutasTable> {
  $$CondutasTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get data => $composableBuilder(
    column: $table.data,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get medicoId => $composableBuilder(
    column: $table.medicoId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tipo => $composableBuilder(
    column: $table.tipo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dados => $composableBuilder(
    column: $table.dados,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get atualizadoEm => $composableBuilder(
    column: $table.atualizadoEm,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  $$MutiroesTableOrderingComposer get mutiraoId {
    final $$MutiroesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mutiraoId,
      referencedTable: $db.mutiroes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MutiroesTableOrderingComposer(
            $db: $db,
            $table: $db.mutiroes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PacientesTableOrderingComposer get pacienteId {
    final $$PacientesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.pacienteId,
      referencedTable: $db.pacientes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PacientesTableOrderingComposer(
            $db: $db,
            $table: $db.pacientes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CondutasTableAnnotationComposer
    extends Composer<_$AppDatabase, $CondutasTable> {
  $$CondutasTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get data =>
      $composableBuilder(column: $table.data, builder: (column) => column);

  GeneratedColumn<int> get medicoId =>
      $composableBuilder(column: $table.medicoId, builder: (column) => column);

  GeneratedColumn<String> get tipo =>
      $composableBuilder(column: $table.tipo, builder: (column) => column);

  GeneratedColumn<String> get dados =>
      $composableBuilder(column: $table.dados, builder: (column) => column);

  GeneratedColumn<int> get atualizadoEm => $composableBuilder(
    column: $table.atualizadoEm,
    builder: (column) => column,
  );

  GeneratedColumn<int> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  $$MutiroesTableAnnotationComposer get mutiraoId {
    final $$MutiroesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mutiraoId,
      referencedTable: $db.mutiroes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MutiroesTableAnnotationComposer(
            $db: $db,
            $table: $db.mutiroes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PacientesTableAnnotationComposer get pacienteId {
    final $$PacientesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.pacienteId,
      referencedTable: $db.pacientes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PacientesTableAnnotationComposer(
            $db: $db,
            $table: $db.pacientes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CondutasTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CondutasTable,
          Conduta,
          $$CondutasTableFilterComposer,
          $$CondutasTableOrderingComposer,
          $$CondutasTableAnnotationComposer,
          $$CondutasTableCreateCompanionBuilder,
          $$CondutasTableUpdateCompanionBuilder,
          (Conduta, $$CondutasTableReferences),
          Conduta,
          PrefetchHooks Function({bool mutiraoId, bool pacienteId})
        > {
  $$CondutasTableTableManager(_$AppDatabase db, $CondutasTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CondutasTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CondutasTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CondutasTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> data = const Value.absent(),
                Value<int> mutiraoId = const Value.absent(),
                Value<int> pacienteId = const Value.absent(),
                Value<int?> medicoId = const Value.absent(),
                Value<String?> tipo = const Value.absent(),
                Value<String?> dados = const Value.absent(),
                Value<int> atualizadoEm = const Value.absent(),
                Value<int> status = const Value.absent(),
              }) => CondutasCompanion(
                id: id,
                data: data,
                mutiraoId: mutiraoId,
                pacienteId: pacienteId,
                medicoId: medicoId,
                tipo: tipo,
                dados: dados,
                atualizadoEm: atualizadoEm,
                status: status,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> data = const Value.absent(),
                required int mutiraoId,
                required int pacienteId,
                Value<int?> medicoId = const Value.absent(),
                Value<String?> tipo = const Value.absent(),
                Value<String?> dados = const Value.absent(),
                required int atualizadoEm,
                Value<int> status = const Value.absent(),
              }) => CondutasCompanion.insert(
                id: id,
                data: data,
                mutiraoId: mutiraoId,
                pacienteId: pacienteId,
                medicoId: medicoId,
                tipo: tipo,
                dados: dados,
                atualizadoEm: atualizadoEm,
                status: status,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CondutasTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({mutiraoId = false, pacienteId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (mutiraoId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.mutiraoId,
                                referencedTable: $$CondutasTableReferences
                                    ._mutiraoIdTable(db),
                                referencedColumn: $$CondutasTableReferences
                                    ._mutiraoIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (pacienteId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.pacienteId,
                                referencedTable: $$CondutasTableReferences
                                    ._pacienteIdTable(db),
                                referencedColumn: $$CondutasTableReferences
                                    ._pacienteIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$CondutasTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CondutasTable,
      Conduta,
      $$CondutasTableFilterComposer,
      $$CondutasTableOrderingComposer,
      $$CondutasTableAnnotationComposer,
      $$CondutasTableCreateCompanionBuilder,
      $$CondutasTableUpdateCompanionBuilder,
      (Conduta, $$CondutasTableReferences),
      Conduta,
      PrefetchHooks Function({bool mutiraoId, bool pacienteId})
    >;
typedef $$ProcedimentosTableCreateCompanionBuilder =
    ProcedimentosCompanion Function({
      Value<int> id,
      Value<String?> data,
      required int mutiraoId,
      required int pacienteId,
      required int medicoId,
      required String tipo,
      required String olho,
      Value<String?> dioptriaLente,
      Value<String?> intercorrencia,
      Value<String?> observacao,
      required int atualizadoEm,
      Value<int> status,
    });
typedef $$ProcedimentosTableUpdateCompanionBuilder =
    ProcedimentosCompanion Function({
      Value<int> id,
      Value<String?> data,
      Value<int> mutiraoId,
      Value<int> pacienteId,
      Value<int> medicoId,
      Value<String> tipo,
      Value<String> olho,
      Value<String?> dioptriaLente,
      Value<String?> intercorrencia,
      Value<String?> observacao,
      Value<int> atualizadoEm,
      Value<int> status,
    });

final class $$ProcedimentosTableReferences
    extends BaseReferences<_$AppDatabase, $ProcedimentosTable, Procedimento> {
  $$ProcedimentosTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $MutiroesTable _mutiraoIdTable(_$AppDatabase db) =>
      db.mutiroes.createAlias(
        $_aliasNameGenerator(db.procedimentos.mutiraoId, db.mutiroes.id),
      );

  $$MutiroesTableProcessedTableManager get mutiraoId {
    final $_column = $_itemColumn<int>('mutirao_id')!;

    final manager = $$MutiroesTableTableManager(
      $_db,
      $_db.mutiroes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_mutiraoIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $PacientesTable _pacienteIdTable(_$AppDatabase db) =>
      db.pacientes.createAlias(
        $_aliasNameGenerator(db.procedimentos.pacienteId, db.pacientes.id),
      );

  $$PacientesTableProcessedTableManager get pacienteId {
    final $_column = $_itemColumn<int>('paciente_id')!;

    final manager = $$PacientesTableTableManager(
      $_db,
      $_db.pacientes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_pacienteIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $MedicosTable _medicoIdTable(_$AppDatabase db) =>
      db.medicos.createAlias(
        $_aliasNameGenerator(db.procedimentos.medicoId, db.medicos.id),
      );

  $$MedicosTableProcessedTableManager get medicoId {
    final $_column = $_itemColumn<int>('medico_id')!;

    final manager = $$MedicosTableTableManager(
      $_db,
      $_db.medicos,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_medicoIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ProcedimentosTableFilterComposer
    extends Composer<_$AppDatabase, $ProcedimentosTable> {
  $$ProcedimentosTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get data => $composableBuilder(
    column: $table.data,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tipo => $composableBuilder(
    column: $table.tipo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get olho => $composableBuilder(
    column: $table.olho,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get dioptriaLente => $composableBuilder(
    column: $table.dioptriaLente,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get intercorrencia => $composableBuilder(
    column: $table.intercorrencia,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get observacao => $composableBuilder(
    column: $table.observacao,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get atualizadoEm => $composableBuilder(
    column: $table.atualizadoEm,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  $$MutiroesTableFilterComposer get mutiraoId {
    final $$MutiroesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mutiraoId,
      referencedTable: $db.mutiroes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MutiroesTableFilterComposer(
            $db: $db,
            $table: $db.mutiroes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PacientesTableFilterComposer get pacienteId {
    final $$PacientesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.pacienteId,
      referencedTable: $db.pacientes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PacientesTableFilterComposer(
            $db: $db,
            $table: $db.pacientes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$MedicosTableFilterComposer get medicoId {
    final $$MedicosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.medicoId,
      referencedTable: $db.medicos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MedicosTableFilterComposer(
            $db: $db,
            $table: $db.medicos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProcedimentosTableOrderingComposer
    extends Composer<_$AppDatabase, $ProcedimentosTable> {
  $$ProcedimentosTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get data => $composableBuilder(
    column: $table.data,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tipo => $composableBuilder(
    column: $table.tipo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get olho => $composableBuilder(
    column: $table.olho,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dioptriaLente => $composableBuilder(
    column: $table.dioptriaLente,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get intercorrencia => $composableBuilder(
    column: $table.intercorrencia,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get observacao => $composableBuilder(
    column: $table.observacao,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get atualizadoEm => $composableBuilder(
    column: $table.atualizadoEm,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  $$MutiroesTableOrderingComposer get mutiraoId {
    final $$MutiroesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mutiraoId,
      referencedTable: $db.mutiroes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MutiroesTableOrderingComposer(
            $db: $db,
            $table: $db.mutiroes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PacientesTableOrderingComposer get pacienteId {
    final $$PacientesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.pacienteId,
      referencedTable: $db.pacientes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PacientesTableOrderingComposer(
            $db: $db,
            $table: $db.pacientes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$MedicosTableOrderingComposer get medicoId {
    final $$MedicosTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.medicoId,
      referencedTable: $db.medicos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MedicosTableOrderingComposer(
            $db: $db,
            $table: $db.medicos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProcedimentosTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProcedimentosTable> {
  $$ProcedimentosTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get data =>
      $composableBuilder(column: $table.data, builder: (column) => column);

  GeneratedColumn<String> get tipo =>
      $composableBuilder(column: $table.tipo, builder: (column) => column);

  GeneratedColumn<String> get olho =>
      $composableBuilder(column: $table.olho, builder: (column) => column);

  GeneratedColumn<String> get dioptriaLente => $composableBuilder(
    column: $table.dioptriaLente,
    builder: (column) => column,
  );

  GeneratedColumn<String> get intercorrencia => $composableBuilder(
    column: $table.intercorrencia,
    builder: (column) => column,
  );

  GeneratedColumn<String> get observacao => $composableBuilder(
    column: $table.observacao,
    builder: (column) => column,
  );

  GeneratedColumn<int> get atualizadoEm => $composableBuilder(
    column: $table.atualizadoEm,
    builder: (column) => column,
  );

  GeneratedColumn<int> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  $$MutiroesTableAnnotationComposer get mutiraoId {
    final $$MutiroesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mutiraoId,
      referencedTable: $db.mutiroes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MutiroesTableAnnotationComposer(
            $db: $db,
            $table: $db.mutiroes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PacientesTableAnnotationComposer get pacienteId {
    final $$PacientesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.pacienteId,
      referencedTable: $db.pacientes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PacientesTableAnnotationComposer(
            $db: $db,
            $table: $db.pacientes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$MedicosTableAnnotationComposer get medicoId {
    final $$MedicosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.medicoId,
      referencedTable: $db.medicos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MedicosTableAnnotationComposer(
            $db: $db,
            $table: $db.medicos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProcedimentosTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProcedimentosTable,
          Procedimento,
          $$ProcedimentosTableFilterComposer,
          $$ProcedimentosTableOrderingComposer,
          $$ProcedimentosTableAnnotationComposer,
          $$ProcedimentosTableCreateCompanionBuilder,
          $$ProcedimentosTableUpdateCompanionBuilder,
          (Procedimento, $$ProcedimentosTableReferences),
          Procedimento,
          PrefetchHooks Function({
            bool mutiraoId,
            bool pacienteId,
            bool medicoId,
          })
        > {
  $$ProcedimentosTableTableManager(_$AppDatabase db, $ProcedimentosTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProcedimentosTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProcedimentosTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProcedimentosTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> data = const Value.absent(),
                Value<int> mutiraoId = const Value.absent(),
                Value<int> pacienteId = const Value.absent(),
                Value<int> medicoId = const Value.absent(),
                Value<String> tipo = const Value.absent(),
                Value<String> olho = const Value.absent(),
                Value<String?> dioptriaLente = const Value.absent(),
                Value<String?> intercorrencia = const Value.absent(),
                Value<String?> observacao = const Value.absent(),
                Value<int> atualizadoEm = const Value.absent(),
                Value<int> status = const Value.absent(),
              }) => ProcedimentosCompanion(
                id: id,
                data: data,
                mutiraoId: mutiraoId,
                pacienteId: pacienteId,
                medicoId: medicoId,
                tipo: tipo,
                olho: olho,
                dioptriaLente: dioptriaLente,
                intercorrencia: intercorrencia,
                observacao: observacao,
                atualizadoEm: atualizadoEm,
                status: status,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> data = const Value.absent(),
                required int mutiraoId,
                required int pacienteId,
                required int medicoId,
                required String tipo,
                required String olho,
                Value<String?> dioptriaLente = const Value.absent(),
                Value<String?> intercorrencia = const Value.absent(),
                Value<String?> observacao = const Value.absent(),
                required int atualizadoEm,
                Value<int> status = const Value.absent(),
              }) => ProcedimentosCompanion.insert(
                id: id,
                data: data,
                mutiraoId: mutiraoId,
                pacienteId: pacienteId,
                medicoId: medicoId,
                tipo: tipo,
                olho: olho,
                dioptriaLente: dioptriaLente,
                intercorrencia: intercorrencia,
                observacao: observacao,
                atualizadoEm: atualizadoEm,
                status: status,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ProcedimentosTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({mutiraoId = false, pacienteId = false, medicoId = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (mutiraoId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.mutiraoId,
                                    referencedTable:
                                        $$ProcedimentosTableReferences
                                            ._mutiraoIdTable(db),
                                    referencedColumn:
                                        $$ProcedimentosTableReferences
                                            ._mutiraoIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (pacienteId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.pacienteId,
                                    referencedTable:
                                        $$ProcedimentosTableReferences
                                            ._pacienteIdTable(db),
                                    referencedColumn:
                                        $$ProcedimentosTableReferences
                                            ._pacienteIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (medicoId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.medicoId,
                                    referencedTable:
                                        $$ProcedimentosTableReferences
                                            ._medicoIdTable(db),
                                    referencedColumn:
                                        $$ProcedimentosTableReferences
                                            ._medicoIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $$ProcedimentosTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProcedimentosTable,
      Procedimento,
      $$ProcedimentosTableFilterComposer,
      $$ProcedimentosTableOrderingComposer,
      $$ProcedimentosTableAnnotationComposer,
      $$ProcedimentosTableCreateCompanionBuilder,
      $$ProcedimentosTableUpdateCompanionBuilder,
      (Procedimento, $$ProcedimentosTableReferences),
      Procedimento,
      PrefetchHooks Function({bool mutiraoId, bool pacienteId, bool medicoId})
    >;
typedef $$CondutasGenericasTableCreateCompanionBuilder =
    CondutasGenericasCompanion Function({
      Value<int> id,
      Value<String?> data,
      required int mutiraoId,
      required int pacienteId,
      Value<int?> medicoId,
      Value<String?> conduta,
      Value<String?> observacao,
      required int atualizadoEm,
      Value<int> status,
    });
typedef $$CondutasGenericasTableUpdateCompanionBuilder =
    CondutasGenericasCompanion Function({
      Value<int> id,
      Value<String?> data,
      Value<int> mutiraoId,
      Value<int> pacienteId,
      Value<int?> medicoId,
      Value<String?> conduta,
      Value<String?> observacao,
      Value<int> atualizadoEm,
      Value<int> status,
    });

final class $$CondutasGenericasTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $CondutasGenericasTable,
          CondutaGenerica
        > {
  $$CondutasGenericasTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $MutiroesTable _mutiraoIdTable(_$AppDatabase db) =>
      db.mutiroes.createAlias(
        $_aliasNameGenerator(db.condutasGenericas.mutiraoId, db.mutiroes.id),
      );

  $$MutiroesTableProcessedTableManager get mutiraoId {
    final $_column = $_itemColumn<int>('mutirao_id')!;

    final manager = $$MutiroesTableTableManager(
      $_db,
      $_db.mutiroes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_mutiraoIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $PacientesTable _pacienteIdTable(_$AppDatabase db) =>
      db.pacientes.createAlias(
        $_aliasNameGenerator(db.condutasGenericas.pacienteId, db.pacientes.id),
      );

  $$PacientesTableProcessedTableManager get pacienteId {
    final $_column = $_itemColumn<int>('paciente_id')!;

    final manager = $$PacientesTableTableManager(
      $_db,
      $_db.pacientes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_pacienteIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $MedicosTable _medicoIdTable(_$AppDatabase db) =>
      db.medicos.createAlias(
        $_aliasNameGenerator(db.condutasGenericas.medicoId, db.medicos.id),
      );

  $$MedicosTableProcessedTableManager? get medicoId {
    final $_column = $_itemColumn<int>('medico_id');
    if ($_column == null) return null;
    final manager = $$MedicosTableTableManager(
      $_db,
      $_db.medicos,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_medicoIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$CondutasGenericasTableFilterComposer
    extends Composer<_$AppDatabase, $CondutasGenericasTable> {
  $$CondutasGenericasTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get data => $composableBuilder(
    column: $table.data,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get conduta => $composableBuilder(
    column: $table.conduta,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get observacao => $composableBuilder(
    column: $table.observacao,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get atualizadoEm => $composableBuilder(
    column: $table.atualizadoEm,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  $$MutiroesTableFilterComposer get mutiraoId {
    final $$MutiroesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mutiraoId,
      referencedTable: $db.mutiroes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MutiroesTableFilterComposer(
            $db: $db,
            $table: $db.mutiroes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PacientesTableFilterComposer get pacienteId {
    final $$PacientesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.pacienteId,
      referencedTable: $db.pacientes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PacientesTableFilterComposer(
            $db: $db,
            $table: $db.pacientes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$MedicosTableFilterComposer get medicoId {
    final $$MedicosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.medicoId,
      referencedTable: $db.medicos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MedicosTableFilterComposer(
            $db: $db,
            $table: $db.medicos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CondutasGenericasTableOrderingComposer
    extends Composer<_$AppDatabase, $CondutasGenericasTable> {
  $$CondutasGenericasTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get data => $composableBuilder(
    column: $table.data,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get conduta => $composableBuilder(
    column: $table.conduta,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get observacao => $composableBuilder(
    column: $table.observacao,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get atualizadoEm => $composableBuilder(
    column: $table.atualizadoEm,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  $$MutiroesTableOrderingComposer get mutiraoId {
    final $$MutiroesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mutiraoId,
      referencedTable: $db.mutiroes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MutiroesTableOrderingComposer(
            $db: $db,
            $table: $db.mutiroes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PacientesTableOrderingComposer get pacienteId {
    final $$PacientesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.pacienteId,
      referencedTable: $db.pacientes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PacientesTableOrderingComposer(
            $db: $db,
            $table: $db.pacientes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$MedicosTableOrderingComposer get medicoId {
    final $$MedicosTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.medicoId,
      referencedTable: $db.medicos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MedicosTableOrderingComposer(
            $db: $db,
            $table: $db.medicos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CondutasGenericasTableAnnotationComposer
    extends Composer<_$AppDatabase, $CondutasGenericasTable> {
  $$CondutasGenericasTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get data =>
      $composableBuilder(column: $table.data, builder: (column) => column);

  GeneratedColumn<String> get conduta =>
      $composableBuilder(column: $table.conduta, builder: (column) => column);

  GeneratedColumn<String> get observacao => $composableBuilder(
    column: $table.observacao,
    builder: (column) => column,
  );

  GeneratedColumn<int> get atualizadoEm => $composableBuilder(
    column: $table.atualizadoEm,
    builder: (column) => column,
  );

  GeneratedColumn<int> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  $$MutiroesTableAnnotationComposer get mutiraoId {
    final $$MutiroesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mutiraoId,
      referencedTable: $db.mutiroes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MutiroesTableAnnotationComposer(
            $db: $db,
            $table: $db.mutiroes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PacientesTableAnnotationComposer get pacienteId {
    final $$PacientesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.pacienteId,
      referencedTable: $db.pacientes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PacientesTableAnnotationComposer(
            $db: $db,
            $table: $db.pacientes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$MedicosTableAnnotationComposer get medicoId {
    final $$MedicosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.medicoId,
      referencedTable: $db.medicos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MedicosTableAnnotationComposer(
            $db: $db,
            $table: $db.medicos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CondutasGenericasTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CondutasGenericasTable,
          CondutaGenerica,
          $$CondutasGenericasTableFilterComposer,
          $$CondutasGenericasTableOrderingComposer,
          $$CondutasGenericasTableAnnotationComposer,
          $$CondutasGenericasTableCreateCompanionBuilder,
          $$CondutasGenericasTableUpdateCompanionBuilder,
          (CondutaGenerica, $$CondutasGenericasTableReferences),
          CondutaGenerica,
          PrefetchHooks Function({
            bool mutiraoId,
            bool pacienteId,
            bool medicoId,
          })
        > {
  $$CondutasGenericasTableTableManager(
    _$AppDatabase db,
    $CondutasGenericasTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CondutasGenericasTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CondutasGenericasTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CondutasGenericasTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> data = const Value.absent(),
                Value<int> mutiraoId = const Value.absent(),
                Value<int> pacienteId = const Value.absent(),
                Value<int?> medicoId = const Value.absent(),
                Value<String?> conduta = const Value.absent(),
                Value<String?> observacao = const Value.absent(),
                Value<int> atualizadoEm = const Value.absent(),
                Value<int> status = const Value.absent(),
              }) => CondutasGenericasCompanion(
                id: id,
                data: data,
                mutiraoId: mutiraoId,
                pacienteId: pacienteId,
                medicoId: medicoId,
                conduta: conduta,
                observacao: observacao,
                atualizadoEm: atualizadoEm,
                status: status,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> data = const Value.absent(),
                required int mutiraoId,
                required int pacienteId,
                Value<int?> medicoId = const Value.absent(),
                Value<String?> conduta = const Value.absent(),
                Value<String?> observacao = const Value.absent(),
                required int atualizadoEm,
                Value<int> status = const Value.absent(),
              }) => CondutasGenericasCompanion.insert(
                id: id,
                data: data,
                mutiraoId: mutiraoId,
                pacienteId: pacienteId,
                medicoId: medicoId,
                conduta: conduta,
                observacao: observacao,
                atualizadoEm: atualizadoEm,
                status: status,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CondutasGenericasTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({mutiraoId = false, pacienteId = false, medicoId = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (mutiraoId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.mutiraoId,
                                    referencedTable:
                                        $$CondutasGenericasTableReferences
                                            ._mutiraoIdTable(db),
                                    referencedColumn:
                                        $$CondutasGenericasTableReferences
                                            ._mutiraoIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (pacienteId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.pacienteId,
                                    referencedTable:
                                        $$CondutasGenericasTableReferences
                                            ._pacienteIdTable(db),
                                    referencedColumn:
                                        $$CondutasGenericasTableReferences
                                            ._pacienteIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (medicoId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.medicoId,
                                    referencedTable:
                                        $$CondutasGenericasTableReferences
                                            ._medicoIdTable(db),
                                    referencedColumn:
                                        $$CondutasGenericasTableReferences
                                            ._medicoIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $$CondutasGenericasTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CondutasGenericasTable,
      CondutaGenerica,
      $$CondutasGenericasTableFilterComposer,
      $$CondutasGenericasTableOrderingComposer,
      $$CondutasGenericasTableAnnotationComposer,
      $$CondutasGenericasTableCreateCompanionBuilder,
      $$CondutasGenericasTableUpdateCompanionBuilder,
      (CondutaGenerica, $$CondutasGenericasTableReferences),
      CondutaGenerica,
      PrefetchHooks Function({bool mutiraoId, bool pacienteId, bool medicoId})
    >;
typedef $$MutiraoCondutasTableCreateCompanionBuilder =
    MutiraoCondutasCompanion Function({
      required int mutiraoId,
      Value<String?> conduta,
      Value<int> rowid,
    });
typedef $$MutiraoCondutasTableUpdateCompanionBuilder =
    MutiraoCondutasCompanion Function({
      Value<int> mutiraoId,
      Value<String?> conduta,
      Value<int> rowid,
    });

final class $$MutiraoCondutasTableReferences
    extends
        BaseReferences<_$AppDatabase, $MutiraoCondutasTable, MutiraoConduta> {
  $$MutiraoCondutasTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $MutiroesTable _mutiraoIdTable(_$AppDatabase db) =>
      db.mutiroes.createAlias(
        $_aliasNameGenerator(db.mutiraoCondutas.mutiraoId, db.mutiroes.id),
      );

  $$MutiroesTableProcessedTableManager get mutiraoId {
    final $_column = $_itemColumn<int>('mutirao_id')!;

    final manager = $$MutiroesTableTableManager(
      $_db,
      $_db.mutiroes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_mutiraoIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$MutiraoCondutasTableFilterComposer
    extends Composer<_$AppDatabase, $MutiraoCondutasTable> {
  $$MutiraoCondutasTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get conduta => $composableBuilder(
    column: $table.conduta,
    builder: (column) => ColumnFilters(column),
  );

  $$MutiroesTableFilterComposer get mutiraoId {
    final $$MutiroesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mutiraoId,
      referencedTable: $db.mutiroes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MutiroesTableFilterComposer(
            $db: $db,
            $table: $db.mutiroes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MutiraoCondutasTableOrderingComposer
    extends Composer<_$AppDatabase, $MutiraoCondutasTable> {
  $$MutiraoCondutasTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get conduta => $composableBuilder(
    column: $table.conduta,
    builder: (column) => ColumnOrderings(column),
  );

  $$MutiroesTableOrderingComposer get mutiraoId {
    final $$MutiroesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mutiraoId,
      referencedTable: $db.mutiroes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MutiroesTableOrderingComposer(
            $db: $db,
            $table: $db.mutiroes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MutiraoCondutasTableAnnotationComposer
    extends Composer<_$AppDatabase, $MutiraoCondutasTable> {
  $$MutiraoCondutasTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get conduta =>
      $composableBuilder(column: $table.conduta, builder: (column) => column);

  $$MutiroesTableAnnotationComposer get mutiraoId {
    final $$MutiroesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mutiraoId,
      referencedTable: $db.mutiroes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MutiroesTableAnnotationComposer(
            $db: $db,
            $table: $db.mutiroes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MutiraoCondutasTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MutiraoCondutasTable,
          MutiraoConduta,
          $$MutiraoCondutasTableFilterComposer,
          $$MutiraoCondutasTableOrderingComposer,
          $$MutiraoCondutasTableAnnotationComposer,
          $$MutiraoCondutasTableCreateCompanionBuilder,
          $$MutiraoCondutasTableUpdateCompanionBuilder,
          (MutiraoConduta, $$MutiraoCondutasTableReferences),
          MutiraoConduta,
          PrefetchHooks Function({bool mutiraoId})
        > {
  $$MutiraoCondutasTableTableManager(
    _$AppDatabase db,
    $MutiraoCondutasTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MutiraoCondutasTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MutiraoCondutasTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MutiraoCondutasTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> mutiraoId = const Value.absent(),
                Value<String?> conduta = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MutiraoCondutasCompanion(
                mutiraoId: mutiraoId,
                conduta: conduta,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int mutiraoId,
                Value<String?> conduta = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MutiraoCondutasCompanion.insert(
                mutiraoId: mutiraoId,
                conduta: conduta,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$MutiraoCondutasTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({mutiraoId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (mutiraoId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.mutiraoId,
                                referencedTable:
                                    $$MutiraoCondutasTableReferences
                                        ._mutiraoIdTable(db),
                                referencedColumn:
                                    $$MutiraoCondutasTableReferences
                                        ._mutiraoIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$MutiraoCondutasTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MutiraoCondutasTable,
      MutiraoConduta,
      $$MutiraoCondutasTableFilterComposer,
      $$MutiraoCondutasTableOrderingComposer,
      $$MutiraoCondutasTableAnnotationComposer,
      $$MutiraoCondutasTableCreateCompanionBuilder,
      $$MutiraoCondutasTableUpdateCompanionBuilder,
      (MutiraoConduta, $$MutiraoCondutasTableReferences),
      MutiraoConduta,
      PrefetchHooks Function({bool mutiraoId})
    >;
typedef $$HistoricoSincronizacaoTableCreateCompanionBuilder =
    HistoricoSincronizacaoCompanion Function({
      Value<int> localTs,
      required int remoteTs,
      required int mutiraoId,
    });
typedef $$HistoricoSincronizacaoTableUpdateCompanionBuilder =
    HistoricoSincronizacaoCompanion Function({
      Value<int> localTs,
      Value<int> remoteTs,
      Value<int> mutiraoId,
    });

final class $$HistoricoSincronizacaoTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $HistoricoSincronizacaoTable,
          HistoricoSincronizacaoData
        > {
  $$HistoricoSincronizacaoTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $MutiroesTable _mutiraoIdTable(_$AppDatabase db) =>
      db.mutiroes.createAlias(
        $_aliasNameGenerator(
          db.historicoSincronizacao.mutiraoId,
          db.mutiroes.id,
        ),
      );

  $$MutiroesTableProcessedTableManager get mutiraoId {
    final $_column = $_itemColumn<int>('mutirao_id')!;

    final manager = $$MutiroesTableTableManager(
      $_db,
      $_db.mutiroes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_mutiraoIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$HistoricoSincronizacaoTableFilterComposer
    extends Composer<_$AppDatabase, $HistoricoSincronizacaoTable> {
  $$HistoricoSincronizacaoTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get localTs => $composableBuilder(
    column: $table.localTs,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get remoteTs => $composableBuilder(
    column: $table.remoteTs,
    builder: (column) => ColumnFilters(column),
  );

  $$MutiroesTableFilterComposer get mutiraoId {
    final $$MutiroesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mutiraoId,
      referencedTable: $db.mutiroes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MutiroesTableFilterComposer(
            $db: $db,
            $table: $db.mutiroes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$HistoricoSincronizacaoTableOrderingComposer
    extends Composer<_$AppDatabase, $HistoricoSincronizacaoTable> {
  $$HistoricoSincronizacaoTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get localTs => $composableBuilder(
    column: $table.localTs,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get remoteTs => $composableBuilder(
    column: $table.remoteTs,
    builder: (column) => ColumnOrderings(column),
  );

  $$MutiroesTableOrderingComposer get mutiraoId {
    final $$MutiroesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mutiraoId,
      referencedTable: $db.mutiroes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MutiroesTableOrderingComposer(
            $db: $db,
            $table: $db.mutiroes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$HistoricoSincronizacaoTableAnnotationComposer
    extends Composer<_$AppDatabase, $HistoricoSincronizacaoTable> {
  $$HistoricoSincronizacaoTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get localTs =>
      $composableBuilder(column: $table.localTs, builder: (column) => column);

  GeneratedColumn<int> get remoteTs =>
      $composableBuilder(column: $table.remoteTs, builder: (column) => column);

  $$MutiroesTableAnnotationComposer get mutiraoId {
    final $$MutiroesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mutiraoId,
      referencedTable: $db.mutiroes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MutiroesTableAnnotationComposer(
            $db: $db,
            $table: $db.mutiroes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$HistoricoSincronizacaoTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $HistoricoSincronizacaoTable,
          HistoricoSincronizacaoData,
          $$HistoricoSincronizacaoTableFilterComposer,
          $$HistoricoSincronizacaoTableOrderingComposer,
          $$HistoricoSincronizacaoTableAnnotationComposer,
          $$HistoricoSincronizacaoTableCreateCompanionBuilder,
          $$HistoricoSincronizacaoTableUpdateCompanionBuilder,
          (HistoricoSincronizacaoData, $$HistoricoSincronizacaoTableReferences),
          HistoricoSincronizacaoData,
          PrefetchHooks Function({bool mutiraoId})
        > {
  $$HistoricoSincronizacaoTableTableManager(
    _$AppDatabase db,
    $HistoricoSincronizacaoTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HistoricoSincronizacaoTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$HistoricoSincronizacaoTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$HistoricoSincronizacaoTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> localTs = const Value.absent(),
                Value<int> remoteTs = const Value.absent(),
                Value<int> mutiraoId = const Value.absent(),
              }) => HistoricoSincronizacaoCompanion(
                localTs: localTs,
                remoteTs: remoteTs,
                mutiraoId: mutiraoId,
              ),
          createCompanionCallback:
              ({
                Value<int> localTs = const Value.absent(),
                required int remoteTs,
                required int mutiraoId,
              }) => HistoricoSincronizacaoCompanion.insert(
                localTs: localTs,
                remoteTs: remoteTs,
                mutiraoId: mutiraoId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$HistoricoSincronizacaoTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({mutiraoId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (mutiraoId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.mutiraoId,
                                referencedTable:
                                    $$HistoricoSincronizacaoTableReferences
                                        ._mutiraoIdTable(db),
                                referencedColumn:
                                    $$HistoricoSincronizacaoTableReferences
                                        ._mutiraoIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$HistoricoSincronizacaoTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $HistoricoSincronizacaoTable,
      HistoricoSincronizacaoData,
      $$HistoricoSincronizacaoTableFilterComposer,
      $$HistoricoSincronizacaoTableOrderingComposer,
      $$HistoricoSincronizacaoTableAnnotationComposer,
      $$HistoricoSincronizacaoTableCreateCompanionBuilder,
      $$HistoricoSincronizacaoTableUpdateCompanionBuilder,
      (HistoricoSincronizacaoData, $$HistoricoSincronizacaoTableReferences),
      HistoricoSincronizacaoData,
      PrefetchHooks Function({bool mutiraoId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$MutiroesTableTableManager get mutiroes =>
      $$MutiroesTableTableManager(_db, _db.mutiroes);
  $$PermissoesTableTableManager get permissoes =>
      $$PermissoesTableTableManager(_db, _db.permissoes);
  $$ColaboradoresTableTableManager get colaboradores =>
      $$ColaboradoresTableTableManager(_db, _db.colaboradores);
  $$PacientesTableTableManager get pacientes =>
      $$PacientesTableTableManager(_db, _db.pacientes);
  $$MedicosTableTableManager get medicos =>
      $$MedicosTableTableManager(_db, _db.medicos);
  $$CondutasTableTableManager get condutas =>
      $$CondutasTableTableManager(_db, _db.condutas);
  $$ProcedimentosTableTableManager get procedimentos =>
      $$ProcedimentosTableTableManager(_db, _db.procedimentos);
  $$CondutasGenericasTableTableManager get condutasGenericas =>
      $$CondutasGenericasTableTableManager(_db, _db.condutasGenericas);
  $$MutiraoCondutasTableTableManager get mutiraoCondutas =>
      $$MutiraoCondutasTableTableManager(_db, _db.mutiraoCondutas);
  $$HistoricoSincronizacaoTableTableManager get historicoSincronizacao =>
      $$HistoricoSincronizacaoTableTableManager(
        _db,
        _db.historicoSincronizacao,
      );
}
