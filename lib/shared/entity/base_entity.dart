import 'package:uuid/uuid.dart';

class BaseEntity {
  String id;

  DateTime? criadoEm;

  BaseEntity({required this.id, this.criadoEm,});

  factory BaseEntity.novo() => BaseEntity(id: const Uuid().v4(), criadoEm: null);
}
