import 'package:drift/drift.dart';

abstract class IRepository<T extends DataClass, C extends Insertable<T>> {
  Future<T> create(C item);
  Future<T?> update(int id, C item);
  Future<T> upsert(C item);
  Future<bool> delete(int id);
  Future<T?> getById(int id);
  Future<List<T>> getAll();
}
