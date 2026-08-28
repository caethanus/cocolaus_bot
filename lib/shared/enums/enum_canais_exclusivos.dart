enum EnumCanaisExclusivos {
  coffe(description: 'Coffe', id: '1526932553129394257'),
  geral(description: 'Geral', id: '1412125393141366847');

  const EnumCanaisExclusivos({required this.description, required this.id});

  final String description;
  final String id;
}
