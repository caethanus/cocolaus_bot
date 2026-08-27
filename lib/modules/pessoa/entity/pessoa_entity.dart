import 'package:cocolaus_bot/shared/entity/base_entity.dart';
import 'package:cocolaus_bot/shared/entity/base_entity_interface.dart';

class PessoaEntity implements IBaseEntity {
  @override
  BaseEntity base;

  String nome;

  String idDiscord;

  PessoaEntity({required this.base, required this.nome, required this.idDiscord});
}