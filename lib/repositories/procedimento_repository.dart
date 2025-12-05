import 'package:drift/drift.dart';
import 'package:sigmus/database/app_database.dart';
import 'package:sigmus/models/interfaces/model.dart';
import 'package:sigmus/repositories/interfaces/repository.dart';

class ProcedimentoRepository
    implements IRepository<Procedimento, ProcedimentosCompanion> {
  final AppDatabase _db;
  ProcedimentoRepository(this._db);

  @override
  Future<Procedimento> create(ProcedimentosCompanion item) async {
    final id = Value(
      item.id.present ? item.id.value : DateTime.now().millisecondsSinceEpoch,
    );
    final newItem = await _db
        .into(_db.procedimentos)
        .insertReturning(item.copyWith(id: id));
    return newItem;
  }

  @override
  Future<Procedimento?> update(int id, ProcedimentosCompanion item) async {
    final updatedItems = await (_db.update(
      _db.procedimentos,
    )..where((p) => p.id.equals(id))).writeReturning(item);
    if (updatedItems.isNotEmpty) {
      final result = updatedItems.first;
      return result;
    }
    return null;
  }

  @override
  Future<Procedimento> upsert(ProcedimentosCompanion item) async {
    return _db
        .into(_db.procedimentos)
        .insertReturning(item, mode: InsertMode.insertOrReplace);
  }

  @override
  Future<bool> delete(int id) async {
    final result = await (_db.delete(
      _db.procedimentos,
    )..where((p) => p.id.equals(id))).go();
    if (result > 0) {
      return true;
    }
    return false;
  }

  @override
  Future<Procedimento?> getById(int id) async {
    return (_db.select(
      _db.procedimentos,
    )..where((p) => p.id.equals(id))).getSingleOrNull();
  }

  @override
  Future<List<Procedimento>> getAll({int? mutiraoId}) async {
    final query = _db.select(_db.procedimentos)
      ..where((p) => p.status.equals(ModelStatus.deleted.index).not());

    if (mutiraoId != null) {
      query.where((p) => p.mutiraoId.equals(mutiraoId));
    }

    return query.get();
  }
}
