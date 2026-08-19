import 'package:cocolaus_bot/shared/entity/base_entity.dart';
import 'package:cocolaus_bot/shared/repository/base_repository_interface.dart';
import 'package:cocolaus_bot/shared/service/base_service_interface.dart';

abstract class BaseService<E extends BaseEntity, R extends IBaseRepository<E>> implements IBaseService<E> {
  final R repository;

  BaseService(this.repository);

  @override
  Future<List<E>> getAll() async => await repository.getAll();

  @override
  Future<E?> getById(String id) async => repository.getById(id);

  @override
  Future<E> save(E e) async => await repository.save(e);

  @override
  Future<void> delete(String id) async => await repository.delete(id);
}
