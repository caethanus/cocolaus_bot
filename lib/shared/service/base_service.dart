import 'package:cocolaus_bot/shared/entity/base_entity_interface.dart';
import 'package:cocolaus_bot/shared/repository/base_repository_interface.dart';
import 'package:cocolaus_bot/shared/service/base_service_interface.dart';

class BaseService<E extends IBaseEntity, R extends IBaseRepository<E>> implements IBaseService<E> {
  final R repository;

  BaseService(this.repository);

  @override
  Future<void> save(E e) async => await repository.save(e);

  @override
  Future<void> delete(String id) async => await repository.delete(id);

  @override
  Future<List<E>> get() async => await repository.get();
}