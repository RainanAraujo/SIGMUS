import 'package:drift/drift.dart';
import 'package:sigmus/database/app_database.dart';

class HistoricoSincronizacaoRepository {
  final AppDatabase _db;
  HistoricoSincronizacaoRepository(this._db);

  Future<void> create(HistoricoSincronizacaoCompanion item) async {
    await _db.into(_db.historicoSincronizacao).insert(item);
  }

  Future<HistoricoSincronizacaoData?> getLast(int mutiraoId) async {
    return (_db.select(_db.historicoSincronizacao)
          ..where((h) => h.mutiraoId.equals(mutiraoId))
          ..orderBy([(h) => OrderingTerm.desc(h.localTs)])
          ..limit(1))
        .getSingleOrNull();
  }

  Future<List<HistoricoSincronizacaoData>> getAll(int mutiraoId) async {
    return (_db.select(
      _db.historicoSincronizacao,
    )..where((h) => h.mutiraoId.equals(mutiraoId))).get();
  }
}
