enum EnumStatusDiaCoca {
  pendente(0, 'Pendente'),
  confirmado(1, 'Confirmado'),
  passado(2, 'Passado'),
  pulado(3, 'Pulado');

  final int id;
  final String description;

  const EnumStatusDiaCoca(this.id, this.description);
}
