import 'package:cocolaus_bot/modules/dia_coca/entity/dia_coca.dart';
import 'package:cocolaus_bot/modules/dia_coca/repository/dia_coca_repository_interface.dart';
import 'package:cocolaus_bot/shared/database/bot_database.dart';
import 'package:cocolaus_bot/shared/entity/base_entity.dart';
import 'package:cocolaus_bot/shared/repository/base_repository.dart';
import 'package:sqlite3/src/result_set.dart';

class DiaCocaRepository extends BaseRepository<DiaCocaEntity> implements IDiaCocaRepository {
  final BotDatabase botDatabase;

  DiaCocaRepository(this.botDatabase);

  @override
  String get tableName => 'dias_coca';

  @override
  BotDatabase get database => botDatabase;

  @override
  void create() {
    database.connection.execute('''
    CREATE TABLE IF NOT EXISTS $tableName (
    $idColumnName TEXT PRIMARY KEY,
    ${BaseRepository.criadoEm} TEXT,
    id_pessoa_semana TEXT NOT NULL,
    data TEXT NOT NULL,
    status_dia_coca INT NOT NULL    
    );
    ''');
  }

  @override
  DiaCocaEntity fromMap(Map<String, dynamic> map) => DiaCocaEntity(base: baseFromMap(map), idPessoaSemana: map['id_pessoa_semana'], data: map['data'], statusDiaCoca: map['status_dia_coca']);

  @override
  Map<String, dynamic> toMap(DiaCocaEntity entity) => {idColumnName: entity.base.id, BaseRepository.criadoEm: entity.base.criadoEm, 'id_pessoa_semana': entity.idPessoaSemana, 'data': entity.data, 'status_dia_coca': entity.statusDiaCoca};

  @override
  DiaCocaEntity fromRow(Row row) => DiaCocaEntity(
    base: BaseEntity(id: row['id'], criadoEm: DateTime.parse(row['criado_em'])),
    data: row['data'],
    idPessoaSemana: row['id_pessoa_semana'],
    statusDiaCoca: row['status_dia_coca'],
  );
}
