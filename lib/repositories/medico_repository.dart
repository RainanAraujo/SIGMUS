import 'package:drift/drift.dart';
import 'package:sigmus/database/app_database.dart';
import 'package:sigmus/models/interfaces/model.dart';
import 'package:sigmus/repositories/interfaces/repository.dart';

class MedicoRepository implements IRepository<Medico, MedicosCompanion> {
  final AppDatabase _db;
  MedicoRepository(this._db);

  @override
  Future<Medico> create(MedicosCompanion item) async {
    final id = Value(
      item.id.present ? item.id.value : DateTime.now().millisecondsSinceEpoch,
    );
    final newItem = await _db
        .into(_db.medicos)
        .insertReturning(item.copyWith(id: id));
    return newItem;
  }

  @override
  Future<Medico?> update(int id, MedicosCompanion item) async {
    final updatedItems = await (_db.update(
      _db.medicos,
    )..where((m) => m.id.equals(id))).writeReturning(item);
    if (updatedItems.isNotEmpty) {
      final result = updatedItems.first;
      return result;
    }
    return null;
  }

  @override
  Future<Medico> upsert(MedicosCompanion item) async {
    return _db
        .into(_db.medicos)
        .insertReturning(item, mode: InsertMode.insertOrReplace);
  }

  @override
  Future<bool> delete(int id) async {
    final result = await (_db.delete(
      _db.medicos,
    )..where((m) => m.id.equals(id))).go();
    if (result > 0) {
      return true;
    }
    return false;
  }

  @override
  Future<Medico?> getById(int id) async {
    return (_db.select(
      _db.medicos,
    )..where((m) => m.id.equals(id))).getSingleOrNull();
  }

  @override
  Future<Medico?> getByCrm(String crm) async {
    return (_db.select(
      _db.medicos,
    )..where((m) => m.crm.equals(crm))).getSingleOrNull();
  }

  @override
  Future<List<Medico>> getAll({int? mutiraoId}) async {
    final query = _db.select(_db.medicos)
      ..where((m) => m.status.equals(ModelStatus.deleted.index).not());

    if (mutiraoId != null) {
      query.where((m) => m.mutiraoId.equals(mutiraoId));
    }

    return query.get();
  }
}
