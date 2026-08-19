import 'package:cocolaus_bot/shared/entity/base_entity.dart';

class UsuarioDiscordEntity extends BaseEntity {
  String idDiscord;
  String nomeUsuarioDiscord;

  UsuarioDiscordEntity({required this.idDiscord, required this.nomeUsuarioDiscord, required super.id, required super.criadoEm});
}
