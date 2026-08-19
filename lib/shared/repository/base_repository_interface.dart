import 'package:cocolaus_bot/shared/entity/base_entity.dart';

abstract class IBaseRepository<E extends BaseEntity> {
  Future<List<E>> getAll();

  Future<E?> getById(String id);

  Future<E> save(E e);

  Future<void> delete(String id);
}