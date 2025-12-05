import 'package:drift/drift.dart';
import 'package:sigmus/database/app_database.dart';
import 'package:sigmus/models/interfaces/model.dart';
import 'package:sigmus/repositories/interfaces/repository.dart';

class ColaboradorRepository
    implements IRepository<Colaborador, ColaboradoresCompanion> {
  final AppDatabase _db;
  ColaboradorRepository(this._db);

  @override
  Future<Colaborador> create(ColaboradoresCompanion item) async {
    final id = Value(
      item.id.present ? item.id.value : DateTime.now().millisecondsSinceEpoch,
    );
    final newItem = await _db
        .into(_db.colaboradores)
        .insertReturning(item.copyWith(id: id));
    return newItem;
  }

  @override
  Future<Colaborador?> update(int id, ColaboradoresCompanion item) async {
    final updatedItems = await (_db.update(
      _db.colaboradores,
    )..where((c) => c.id.equals(id))).writeReturning(item);
    if (updatedItems.isNotEmpty) {
      final result = updatedItems.first;
      return result;
    }
    return null;
  }

  @override
  Future<Colaborador> upsert(ColaboradoresCompanion item) async {
    return _db
        .into(_db.colaboradores)
        .insertReturning(item, mode: InsertMode.insertOrReplace);
  }

  @override
  Future<bool> delete(int id) async {
    final result = await (_db.delete(
      _db.colaboradores,
    )..where((c) => c.id.equals(id))).go();
    if (result > 0) {
      return true;
    }
    return false;
  }

  @override
  Future<Colaborador?> getById(int id) async {
    return (_db.select(
      _db.colaboradores,
    )..where((c) => c.id.equals(id))).getSingleOrNull();
  }

  @override
  Future<List<Colaborador>> getAll({int? mutiraoId}) async {
    final query = _db.select(_db.colaboradores)
      ..where((c) => c.status.equals(ModelStatus.deleted.index).not());

    if (mutiraoId != null) {
      query.where((c) => c.mutiraoId.equals(mutiraoId));
    }

    return query.get();
  }
}
