import 'package:drift/drift.dart';
import 'package:sigmus/database/app_database.dart';
import 'package:sigmus/models/interfaces/model.dart';
import 'package:sigmus/repositories/interfaces/repository.dart';

class CondutaRepository implements IRepository<Conduta, CondutasCompanion> {
  final AppDatabase _db;
  CondutaRepository(this._db);

  @override
  Future<Conduta> create(CondutasCompanion item) async {
    final id = Value(
      item.id.present ? item.id.value : DateTime.now().millisecondsSinceEpoch,
    );
    final newItem = await _db
        .into(_db.condutas)
        .insertReturning(item.copyWith(id: id));
    return newItem;
  }

  @override
  Future<Conduta?> update(int id, CondutasCompanion item) async {
    final updatedItems = await (_db.update(
      _db.condutas,
    )..where((c) => c.id.equals(id))).writeReturning(item);
    if (updatedItems.isNotEmpty) {
      final result = updatedItems.first;
      return result;
    }
    return null;
  }

  @override
  Future<Conduta> upsert(CondutasCompanion item) async {
    return _db
        .into(_db.condutas)
        .insertReturning(item, mode: InsertMode.insertOrReplace);
  }

  @override
  Future<bool> delete(int id) async {
    final result = await (_db.delete(
      _db.condutas,
    )..where((c) => c.id.equals(id))).go();
    if (result > 0) {
      return true;
    }
    return false;
  }

  @override
  Future<Conduta?> getById(int id) async {
    return (_db.select(
      _db.condutas,
    )..where((c) => c.id.equals(id))).getSingleOrNull();
  }

  @override
  Future<List<Conduta>> getAll({int? mutiraoId}) async {
    final query = _db.select(_db.condutas)
      ..where((c) => c.status.equals(ModelStatus.deleted.index).not());

    if (mutiraoId != null) {
      query.where((c) => c.mutiraoId.equals(mutiraoId));
    }

    return query.get();
  }
}
