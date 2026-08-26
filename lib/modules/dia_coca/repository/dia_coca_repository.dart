import 'package:cocolaus_bot/modules/dia_coca/entity/dia_coca.dart';
import 'package:cocolaus_bot/modules/dia_coca/repository/dia_coca_repository_interface.dart';
import 'package:cocolaus_bot/shared/repository/base_repository.dart';
import 'package:sqflite/sqflite.dart';

class DiaCocaRepository extends BaseRepository<DiaCocaEntity> implements IDiaCocaRepository {
  @override
  String get tableName => 'dias_coca';

  @override
  void create(Batch batch) {
    batch.execute('''
    CREATE TABLE IF NOT EXISTS $tableName (
    $idColumnName TEXT PRIMARY KEY,
    ${BaseRepository.criadoEm} TEXT,
    ${BaseRepository.deletadoEm} TEXT,
    id_pessoa_semana TEXT NOT NULL,
    data TEXT NOT NULL,
    status_dia_coca INT NOT NULL    
    );
    ''');
  }

  @override
  DiaCocaEntity fromMap(Map<String, dynamic> map) => DiaCocaEntity(base: baseFromMap(map), idPessoaSemana: map['idPessoaSemana'], data: map['data'], statusDiaCoca: map['statusDiaCoca']);

  @override
  Map<String, dynamic> toMap(DiaCocaEntity entity) => {
    idColumnName: entity.base.id,
    BaseRepository.criadoEm: entity.base.criadoEm,
    BaseRepository.deletadoEm: entity.base.deletadoEm,
    'idPessoaSemana': entity.idPessoaSemana,
    'data': entity.data,
    'statusDiaCoca': entity.statusDiaCoca
  };
}
