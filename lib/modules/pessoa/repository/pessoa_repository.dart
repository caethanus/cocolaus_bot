import 'package:cocolaus_bot/modules/pessoa/entity/pessoa_entity.dart';
import 'package:cocolaus_bot/modules/pessoa/repository/pessoa_repository_interface.dart';
import 'package:cocolaus_bot/shared/database/bot_database.dart';
import 'package:cocolaus_bot/shared/repository/base_repository.dart';

class PessoaRepository extends BaseRepository<PessoaEntity> implements IPessoaRepository {
  final BotDatabase botDatabase;

  PessoaRepository(this.botDatabase);

  @override
  String get tableName => 'pessoas';

  @override
  BotDatabase get database => botDatabase;

  @override
  void create() {
    database.connection.execute('''
      CREATE TABLE IF NOT EXISTS $tableName (
      $idColumnName TEXT PRIMARY KEY,
      ${BaseRepository.criadoEm} TEXT,
      ${BaseRepository.deletadoEm} TEXT,
      nome TEXT NOT NULL,
      id_discord TEXT NOT NULL
      );
    ''');
  }

  @override
  PessoaEntity fromMap(Map<String, dynamic> map) => PessoaEntity(base: baseFromMap(map), nome: map['nome'], idDiscord: map['id_discord']);

  @override
  Map<String, dynamic> toMap(PessoaEntity entity) => {idColumnName: entity.base.id, BaseRepository.criadoEm: entity.base.criadoEm, BaseRepository.deletadoEm: entity.base.deletadoEm, 'nome': entity.nome, 'id_discord': entity.idDiscord};
}
