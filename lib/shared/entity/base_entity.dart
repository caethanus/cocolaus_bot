class BaseEntity {
  String id;

  DateTime? criadoEm;

  DateTime? deletadoEm;

  BaseEntity({required this.id, required this.criadoEm, required this.deletadoEm});
}
