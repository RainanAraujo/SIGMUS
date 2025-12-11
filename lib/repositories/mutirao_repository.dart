import 'package:drift/drift.dart';
import 'package:sigmus/database/app_database.dart';
import 'package:sigmus/models/interfaces/model.dart';
import 'package:sigmus/repositories/interfaces/repository.dart';

class MutiraoRepository implements IRepository<Mutirao, MutiroesCompanion> {
  final AppDatabase _db;
  MutiraoRepository(this._db);

  Future<void> setPermissoes(
    int id,
    Map<String, List<String>> permissoes,
  ) async {
    await (_db.delete(
      _db.permissoes,
    )..where((p) => p.mutiraoId.equals(id))).go();

    final perms = permissoes.entries.map((entry) {
      return PermissoesCompanion.insert(
        mutiraoId: id,
        email: entry.key,
        permissoes: entry.value,
      );
    }).toList();

    await _db.batch((batch) {
      batch.insertAll(_db.permissoes, perms);
    });

    await update(
      id,
      MutiroesCompanion(
        atualizadoEm: Value(DateTime.now().millisecondsSinceEpoch),
      ),
    );
  }

  Future<Map<String, List<String>>> getPermissoes(int id) async {
    final res = await (_db.select(
      _db.permissoes,
    )..where((p) => p.mutiraoId.equals(id))).get();

    return res.fold<Map<String, List<String>>>({}, (prev, item) {
      prev[item.email] = item.permissoes;
      return prev;
    });
  }

  Future<void> setCondutas(int id, List<String> condutas) async {
    await (_db.delete(
      _db.mutiraoCondutas,
    )..where((mc) => mc.mutiraoId.equals(id))).go();

    final conds = condutas
        .map(
          (c) =>
              MutiraoCondutasCompanion.insert(mutiraoId: id, conduta: Value(c)),
        )
        .toList();

    await _db.batch((batch) {
      batch.insertAll(_db.mutiraoCondutas, conds);
    });

    await update(
      id,
      MutiroesCompanion(
        atualizadoEm: Value(DateTime.now().millisecondsSinceEpoch),
      ),
    );
  }

  Future<List<String?>> getCondutas(int id) async {
    final res = await (_db.select(
      _db.mutiraoCondutas,
    )..where((mc) => mc.mutiraoId.equals(id))).get();
    return res.map((item) => item.conduta).toList();
  }

  @override
  Future<Mutirao> create(MutiroesCompanion item) async {
    final id = Value(
      item.id.present ? item.id.value : DateTime.now().millisecondsSinceEpoch,
    );
    final newItem = await _db
        .into(_db.mutiroes)
        .insertReturning(item.copyWith(id: id));
    return newItem;
  }

  @override
  Future<Mutirao?> update(int id, MutiroesCompanion item) async {
    final updatedItems = await (_db.update(
      _db.mutiroes,
    )..where((m) => m.id.equals(id))).writeReturning(item);
    if (updatedItems.isNotEmpty) {
      final result = updatedItems.first;
      return result;
    }
    return null;
  }

  @override
  Future<Mutirao> upsert(MutiroesCompanion item) async {
    return _db
        .into(_db.mutiroes)
        .insertReturning(item, mode: InsertMode.insertOrReplace);
  }

  @override
  Future<bool> delete(int id) async {
    final result = await (_db.delete(
      _db.mutiroes,
    )..where((m) => m.id.equals(id))).go();
    if (result > 0) {
      return true;
    }
    return false;
  }

  @override
  Future<Mutirao?> getById(int id) async {
    return (_db.select(
      _db.mutiroes,
    )..where((m) => m.id.equals(id))).getSingleOrNull();
  }

  @override
  Future<List<Mutirao>> getAll() async {
    return (_db.select(
      _db.mutiroes,
    )..where((m) => m.status.equals(ModelStatus.deleted.index).not())).get();
  }
}
