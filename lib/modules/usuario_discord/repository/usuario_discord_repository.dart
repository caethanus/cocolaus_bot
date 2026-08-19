import 'package:cocolaus_bot/modules/usuario_discord/entity/usuario_discord_entity.dart';
import 'package:cocolaus_bot/modules/usuario_discord/repository/usuario_discord_repository_interface.dart';
import 'package:cocolaus_bot/shared/entity/base_entity.dart';
import 'package:cocolaus_bot/shared/repository/base_repository.dart';
import 'package:drift/src/runtime/data_class.dart';

class UsuarioDiscordRepository extends BaseRepository<UsuarioDiscordEntity, UsuarioDiscordTableData, UsuarioDiscordTableCompanion> implements IUsuarioDiscordRepository {
  @override
  UsuarioDiscordEntity fromRow(row) {
    // TODO: implement fromRow
    throw UnimplementedError();
  }

  @override
  toCompanion(UsuarioDiscordEntity entity) {
    // TODO: implement toCompanion
    throw UnimplementedError();
  }
}
