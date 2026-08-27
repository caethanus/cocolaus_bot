import 'package:uuid/uuid.dart';

class BaseEntity {
  String id;

  DateTime? criadoEm;

  DateTime? deletadoEm;

  BaseEntity({required this.id, this.criadoEm, this.deletadoEm});

  factory BaseEntity.novo() => BaseEntity(id: const Uuid().v4(), criadoEm: null, deletadoEm: null);
}
