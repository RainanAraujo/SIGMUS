import 'package:drift/drift.dart';
import 'package:sigmus/database/app_database.dart';
import 'package:sigmus/models/interfaces/model.dart';
import 'package:sigmus/repositories/interfaces/repository.dart';

class CondutaGenericaRepository
    implements IRepository<CondutaGenerica, CondutasGenericasCompanion> {
  final AppDatabase _db;
  CondutaGenericaRepository(this._db);

  @override
  Future<CondutaGenerica> create(CondutasGenericasCompanion item) async {
    final id = Value(
      item.id.present ? item.id.value : DateTime.now().millisecondsSinceEpoch,
    );
    final newItem = await _db
        .into(_db.condutasGenericas)
        .insertReturning(item.copyWith(id: id));
    return newItem;
  }

  @override
  Future<CondutaGenerica?> update(
    int id,
    CondutasGenericasCompanion item,
  ) async {
    final updatedItems = await (_db.update(
      _db.condutasGenericas,
    )..where((c) => c.id.equals(id))).writeReturning(item);
    if (updatedItems.isNotEmpty) {
      final result = updatedItems.first;
      return result;
    }
    return null;
  }

  @override
  Future<CondutaGenerica> upsert(CondutasGenericasCompanion item) async {
    return _db
        .into(_db.condutasGenericas)
        .insertReturning(item, mode: InsertMode.insertOrReplace);
  }

  @override
  Future<bool> delete(int id) async {
    final result = await (_db.delete(
      _db.condutasGenericas,
    )..where((c) => c.id.equals(id))).go();
    if (result > 0) {
      return true;
    }
    return false;
  }

  @override
  Future<CondutaGenerica?> getById(int id) async {
    return (_db.select(
      _db.condutasGenericas,
    )..where((c) => c.id.equals(id))).getSingleOrNull();
  }

  @override
  Future<List<CondutaGenerica>> getAll({int? mutiraoId}) async {
    final query = _db.select(_db.condutasGenericas)
      ..where((c) => c.status.equals(ModelStatus.deleted.index).not());

    if (mutiraoId != null) {
      query.where((c) => c.mutiraoId.equals(mutiraoId));
    }

    return query.get();
  }
}
