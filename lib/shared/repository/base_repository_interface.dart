import 'package:cocolaus_bot/shared/entity/base_entity_interface.dart';
import 'package:sqlite3/sqlite3.dart';

abstract class IBaseRepository<E extends IBaseEntity> {
  Future<void> save(E entity);

  Future<void> insert(E entity);

  Future<void> update(E entity);

  Future<void> delete(String id);

  Future<List<E>> getAll();

  Future<E?> getById(String id);

  void create(Database database);
}