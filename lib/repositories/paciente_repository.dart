import 'package:drift/drift.dart';
import 'package:sigmus/database/app_database.dart';
import 'package:sigmus/models/interfaces/model.dart';
import 'package:sigmus/repositories/interfaces/repository.dart';

class PacienteRepository implements IRepository<Paciente, PacientesCompanion> {
  final AppDatabase _db;
  PacienteRepository(this._db);

  @override
  Future<Paciente> create(PacientesCompanion item) async {
    final id = Value(
      item.id.present ? item.id.value : DateTime.now().millisecondsSinceEpoch,
    );
    final newItem = await _db
        .into(_db.pacientes)
        .insertReturning(item.copyWith(id: id));
    return newItem;
  }

  @override
  Future<Paciente?> update(int id, PacientesCompanion item) async {
    final updatedItems = await (_db.update(
      _db.pacientes,
    )..where((p) => p.id.equals(id))).writeReturning(item);
    if (updatedItems.isNotEmpty) {
      final result = updatedItems.first;
      return result;
    }
    return null;
  }

  @override
  Future<Paciente> upsert(PacientesCompanion item) async {
    return _db
        .into(_db.pacientes)
        .insertReturning(item, mode: InsertMode.insertOrReplace);
  }

  @override
  Future<bool> delete(int id) async {
    final result = await (_db.delete(
      _db.pacientes,
    )..where((p) => p.id.equals(id))).go();
    if (result > 0) {
      return true;
    }
    return false;
  }

  @override
  Future<Paciente?> getById(int id) async {
    return (_db.select(
      _db.pacientes,
    )..where((p) => p.id.equals(id))).getSingleOrNull();
  }

  @override
  Future<List<Paciente>> getAll({int? mutiraoId}) async {
    final query = _db.select(_db.pacientes)
      ..where((p) => p.status.equals(ModelStatus.deleted.index).not());

    if (mutiraoId != null) {
      final joinedQuery = query.join([
        leftOuterJoin(
          _db.condutas,
          _db.pacientes.id.equalsExp(_db.condutas.pacienteId),
        ),
        leftOuterJoin(
          _db.procedimentos,
          _db.pacientes.id.equalsExp(_db.procedimentos.pacienteId),
        ),
        leftOuterJoin(
          _db.condutasGenericas,
          _db.pacientes.id.equalsExp(_db.condutasGenericas.pacienteId),
        ),
      ]);

      joinedQuery.where(
        _db.condutas.mutiraoId.isNotNull() |
            _db.procedimentos.mutiraoId.isNotNull() |
            _db.condutasGenericas.mutiraoId.isNotNull(),
      );

      return joinedQuery.map((row) => row.readTable(_db.pacientes)).get();
    }

    return query.get();
  }
}
