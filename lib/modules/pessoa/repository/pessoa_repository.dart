import 'package:cocolaus_bot/modules/pessoa/entity/pessoa_entity.dart';
import 'package:cocolaus_bot/modules/pessoa/repository/pessoa_repository_interface.dart';
import 'package:cocolaus_bot/shared/database/bot_database.dart';
import 'package:cocolaus_bot/shared/entity/base_entity.dart';
import 'package:cocolaus_bot/shared/repository/base_repository.dart';
import 'package:sqlite3/sqlite3.dart';

class PessoaRepository extends BaseRepository<PessoaEntity> implements IPessoaRepository {
  @override
  String get tableName => 'pessoas';

  @override
  void create(Database database) {
    database.execute('''
      CREATE TABLE IF NOT EXISTS $tableName (
      $idColumnName TEXT PRIMARY KEY,
      ${BaseRepository.criadoEm} TEXT,
      nome TEXT NOT NULL,
      id_discord TEXT NOT NULL
      );
    ''');
  }

  @override
  PessoaEntity fromMap(Map<String, dynamic> map) => PessoaEntity(base: baseFromMap(map), nome: map['nome'], idDiscord: map['id_discord']);

  @override
  Map<String, dynamic> toMap(PessoaEntity entity) => {idColumnName: entity.base.id, BaseRepository.criadoEm: entity.base.criadoEm, 'nome': entity.nome, 'id_discord': entity.idDiscord};

  @override
  PessoaEntity fromRow(Row row) => PessoaEntity(
    base: BaseEntity(id: row['id'], criadoEm: DateTime.parse(row['criado_em'])),
    nome: row['nome'],
    idDiscord: row['id_discord'],
  );

  @override
  Future<String> getNomePessoaByIdPessoa(String idPessoa) async {
    final db = BotDatabase().connection;

    final nomePessoa = db.select('''
    SELECT nome FROM $tableName WHERE id_discord = ?
    ''', [idPessoa]);

    if(nomePessoa.isEmpty) return '';

    return nomePessoa.first['nome'].toString();
  }
}
