import 'package:cocolaus_bot/modules/pessoa/entity/pessoa_entity.dart';
import 'package:cocolaus_bot/modules/pessoa/repository/pessoa_repository_interface.dart';
import 'package:cocolaus_bot/shared/repository/base_repository.dart';
import 'package:sqflite/sqflite.dart';

class PessoaRepository extends BaseRepository<PessoaEntity> implements IPessoaRepository {
  @override
  String get tableName => 'pessoas';

  @override
  void create(Batch batch) async {
    batch.execute('''
      CREATE TABLE IF NOT EXISTIS $tableName (
      $idColumnName TEXT PRIMARY KEY,
      ${BaseRepository.criadoEm} TEXT,
      ${BaseRepository.deletadoEm} TEXT,
      nome TEXT NOT NULL,
      id_discord TEXT NOT NULL
      );
    ''');
  }

  @override
  PessoaEntity fromMap(Map<String, dynamic> map) => PessoaEntity(base: baseFromMap(map), nome: map['nome'], idDiscord: map['idDiscord']);

  @override
  Map<String, dynamic> toMap(PessoaEntity entity) => {idColumnName: entity.base.id, BaseRepository.criadoEm: entity.base.criadoEm, BaseRepository.deletadoEm: entity.base.deletadoEm, 'nome': entity.nome, 'idDiscord': entity.idDiscord};
}
