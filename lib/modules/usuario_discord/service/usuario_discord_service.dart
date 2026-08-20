import 'package:cocolaus_bot/modules/usuario_discord/entity/usuario_discord_entity.dart';
import 'package:cocolaus_bot/modules/usuario_discord/repository/usuario_discord_repository.dart';
import 'package:cocolaus_bot/modules/usuario_discord/service/usuario_discord_service_interface.dart';
import 'package:cocolaus_bot/shared/service/base_service.dart';

class UsuarioDiscordService extends BaseService<UsuarioDiscordEntity, UsuarioDiscordRepository> implements IUsuarioDiscordService {
  final UsuarioDiscordRepository _repository;

  UsuarioDiscordService(this._repository) : super(_repository);
}
