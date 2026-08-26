import 'package:cocolaus_bot/shared/entity/base_entity_interface.dart';

abstract class IBaseRepository<E extends IBaseEntity> {
  Future<void> save(E e);
}