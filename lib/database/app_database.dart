import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'app_database.g.dart';

@DataClassName('Mutirao')
class Mutiroes extends Table {
  IntColumn get id => integer()();
  TextColumn get tipo => text()();
  TextColumn get dataInicio => text().named('data_inicio')();
  TextColumn get dataFinal => text().named('data_final')();
  TextColumn get estado => text()();
  TextColumn get municipio => text()();
  TextColumn get local => text()();
  TextColumn get demandante => text()();
  TextColumn get contratante => text()();
  IntColumn get atualizadoEm => integer().named('atualizado_em')();
  IntColumn get status => integer().withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('Permissao')
class Permissoes extends Table {
  IntColumn get mutiraoId =>
      integer().customConstraint('REFERENCES mutiroes(id) ON DELETE CASCADE')();
  TextColumn get email => text()();
  TextColumn get permissoes => text()();
  @override
  Set<Column> get primaryKey => {mutiraoId, email};
}

@DataClassName('Colaborador')
class Colaboradores extends Table {
  IntColumn get id => integer()();
  IntColumn get mutiraoId => integer()();
  TextColumn get nome => text()();
  TextColumn get funcao => text()();
  IntColumn get atualizadoEm => integer().named('atualizado_em')();
  IntColumn get status => integer().withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('Paciente')
class Pacientes extends Table {
  IntColumn get id => integer()();

  TextColumn get cpf => text().nullable()();
  TextColumn get cns => text().nullable()();
  TextColumn get nome => text().nullable()();
  TextColumn get tel => text().nullable()();
  TextColumn get dataNascimento => text().nullable()();
  TextColumn get uf => text().nullable()();
  TextColumn get municipio => text().nullable()();
  TextColumn get endereco => text().nullable()();
  TextColumn get nomeDaMae => text().nullable()();

  IntColumn get atualizadoEm => integer().named('atualizado_em')();
  IntColumn get status => integer().withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('Medico')
class Medicos extends Table {
  IntColumn get id => integer()();
  IntColumn get mutiraoId => integer().references(Mutiroes, #id)();
  TextColumn get nome => text()();
  TextColumn get crm => text()();
  IntColumn get atualizadoEm => integer().named('atualizado_em')();
  IntColumn get status => integer().withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('Conduta')
class Condutas extends Table {
  IntColumn get id => integer()();
  TextColumn get data => text().nullable()();
  IntColumn get mutiraoId => integer().references(Mutiroes, #id)();
  IntColumn get pacienteId => integer().references(Pacientes, #id)();
  IntColumn get medicoId => integer().nullable()();

  TextColumn get tipo => text().nullable()();
  TextColumn get dados => text().nullable()();

  IntColumn get atualizadoEm => integer().named('atualizado_em')();
  IntColumn get status => integer().withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('Procedimento')
class Procedimentos extends Table {
  IntColumn get id => integer()();
  TextColumn get data => text().nullable()();
  IntColumn get mutiraoId => integer().references(Mutiroes, #id)();
  IntColumn get pacienteId => integer().references(Pacientes, #id)();
  IntColumn get medicoId => integer().references(Medicos, #id)();

  TextColumn get tipo => text()();
  TextColumn get olho => text()();
  TextColumn get dioptriaLente => text().nullable()();
  TextColumn get intercorrencia => text().nullable()();
  TextColumn get observacao => text().nullable()();
  IntColumn get atualizadoEm => integer().named('atualizado_em')();
  IntColumn get status => integer().withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('CondutaGenerica')
class CondutasGenericas extends Table {
  IntColumn get id => integer()();
  TextColumn get data => text().nullable()();
  IntColumn get mutiraoId => integer().references(Mutiroes, #id)();
  IntColumn get pacienteId => integer().references(Pacientes, #id)();
  IntColumn get medicoId => integer().nullable().references(Medicos, #id)();

  TextColumn get conduta => text().nullable()();
  TextColumn get observacao => text().nullable()();

  IntColumn get atualizadoEm => integer().named('atualizado_em')();
  IntColumn get status => integer().withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('MutiraoConduta')
class MutiraoCondutas extends Table {
  IntColumn get mutiraoId => integer().references(Mutiroes, #id)();
  TextColumn get conduta => text().nullable()();

  @override
  Set<Column> get primaryKey => {mutiraoId, conduta};
}

class HistoricoSincronizacao extends Table {
  IntColumn get localTs => integer()();
  IntColumn get remoteTs => integer()();
  IntColumn get mutiraoId => integer().references(Mutiroes, #id)();

  @override
  Set<Column> get primaryKey => {localTs};
}

@DriftDatabase(
  tables: [
    Mutiroes,
    Permissoes,
    Colaboradores,
    Pacientes,
    Medicos,
    Condutas,
    Procedimentos,
    CondutasGenericas,
    MutiraoCondutas,
    HistoricoSincronizacao,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final directory = await getApplicationSupportDirectory();
    final file = File(p.join(directory.path, 'db.sqlite'));

    return NativeDatabase(file, logStatements: false);
  });
}
