import 'package:cocolaus_bot/modules/usuario_discord/entity/usuario_discord_entity.dart';
import 'package:cocolaus_bot/modules/usuario_discord/repository/usuario_discord_repository_interface.dart';
import 'package:cocolaus_bot/shared/drift/app_database.dart';
import 'package:cocolaus_bot/shared/repository/base_repository.dart';
import 'package:drift/drift.dart';

class UsuarioDiscordRepository extends BaseRepository<UsuarioDiscordEntity, UsuarioDiscordTableData, UsuarioDiscordTableCompanion> implements IUsuarioDiscordRepository {
  final AppDatabase _db;

  final TableInfo<Table, UsuarioDiscordTableData> _table;

  UsuarioDiscordRepository(this._db, this._table) : super(_db, _table);

  @override
  UsuarioDiscordEntity fromRow(row) => UsuarioDiscordEntity(idDiscord: row.idDiscord, nomeUsuarioDiscord: row.nomeUsuarioDiscord, id: row.id, criadoEm: row.criadoEm);

  @override
  toCompanion(UsuarioDiscordEntity entity) => UsuarioDiscordTableCompanion(id: Value(entity.id), criadoEm: Value(entity.criadoEm), idDiscord: Value(entity.idDiscord), nomeUsuarioDiscord: Value(entity.nomeUsuarioDiscord));
}
