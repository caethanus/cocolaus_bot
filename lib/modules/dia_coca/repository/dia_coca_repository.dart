import 'package:cocolaus_bot/modules/dia_coca/entity/dia_coca.dart';
import 'package:cocolaus_bot/modules/dia_coca/enums/enum_status_dia_coca.dart';
import 'package:cocolaus_bot/modules/dia_coca/repository/dia_coca_repository_interface.dart';
import 'package:cocolaus_bot/shared/entity/base_entity.dart';
import 'package:cocolaus_bot/shared/repository/base_repository.dart';
import 'package:sqlite3/sqlite3.dart';

class DiaCocaRepository extends BaseRepository<DiaCocaEntity> implements IDiaCocaRepository {
  @override
  String get tableName => 'dias_coca';

  @override
  void create(Database database) {
    database.execute('''
    CREATE TABLE IF NOT EXISTS $tableName (
    $idColumnName TEXT PRIMARY KEY,
    ${BaseRepository.criadoEm} TEXT,
    nome_pessoa TEXT NOT NULL,
    data TEXT,
    status_dia_coca INT NOT NULL    
    );
    ''');
  }

  @override
  DiaCocaEntity fromMap(Map<String, dynamic> map) => DiaCocaEntity(
    base: baseFromMap(map),
    nomePessoa: map['nome_pessoa'],
    data: map['data'] != null ? DateTime.parse(map['data']) : null,
    statusDiaCoca: EnumStatusDiaCoca.values.firstWhere((e) => e.id == map['status_dia_coca'], orElse: () => EnumStatusDiaCoca.pendente),
  );

  @override
  Map<String, dynamic> toMap(DiaCocaEntity entity) => {
    idColumnName: entity.base.id,
    BaseRepository.criadoEm: entity.base.criadoEm?.toIso8601String(),
    'nome_pessoa': entity.nomePessoa,
    'data': entity.data,
    'status_dia_coca': entity.statusDiaCoca.id,
  };

  @override
  DiaCocaEntity fromRow(Row row) => DiaCocaEntity(
    base: BaseEntity(id: row[idColumnName], criadoEm: row[BaseRepository.criadoEm] != null ? DateTime.parse(row[BaseRepository.criadoEm]) : null),
    data: row['data'] != null ? DateTime.parse(row['data']) : null,
    nomePessoa: row['nome_pessoa'],
    statusDiaCoca: EnumStatusDiaCoca.values.firstWhere((e) => e.id == row['status_dia_coca'], orElse: () => EnumStatusDiaCoca.pendente),
  );
}
