import 'package:cocolaus_bot/shared/entity/base_entity.dart';
import 'package:cocolaus_bot/shared/repository/base_repository_interface.dart';
import 'package:collection/collection.dart';
import 'package:drift/drift.dart';

abstract class BaseRepository<E extends BaseEntity, D extends DataClass, U extends UpdateCompanion<D>> implements IBaseRepository<E> {
  final GeneratedDatabase _db;
  final TableInfo<Table, D> _table;

  String get tableName => _table.actualTableName;

  Future<List<D>> get rows => _db.select(_table).get();

  BaseRepository(this._db, this._table);

  E fromRow(D row);

  U toCompanion(E entity);

  @override
  Future<List<E>> getAll() async {
    final registers = await rows;
    return registers.map((r) => fromRow(r)).toList();
  }

  @override
  Future<E?> getById(String id) async {
    final registers = await getAll();
    return registers.firstWhereOrNull((e) => e.id == id);
  }

  @override
  Future<E> save(E e) async {
    final exists = await getById(e.id);

    if (exists != null) {
      _db.update(_table).write(toCompanion(e));
    } else {
      _db.into(_table).insert(toCompanion(e));
    }

    return e;
  }

  @override
  Future<void> delete(String id) async {
    final e = await getById(id);
    if (e != null) {
      await _db.delete(_table).delete(toCompanion(e));
    }
  }
}
