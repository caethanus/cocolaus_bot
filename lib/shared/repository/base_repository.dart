import 'package:cocolaus_bot/shared/database/bot_database.dart';
import 'package:cocolaus_bot/shared/entity/base_entity.dart';
import 'package:cocolaus_bot/shared/entity/base_entity_interface.dart';
import 'package:cocolaus_bot/shared/repository/base_repository_interface.dart';
import 'package:sqlite3/sqlite3.dart';

abstract class BaseRepository<E extends IBaseEntity> implements IBaseRepository<E> {
  static const criadoEm = 'criado_em';

  String get tableName;

  String get idColumnName => 'id_$tableName';

  Database get database => BotDatabase().connection;

  Map<String, dynamic> toMap(E entity);

  E fromMap(Map<String, dynamic> map);

  E fromRow(Row row);

  BaseEntity baseFromMap(Map<String, dynamic> map) => BaseEntity(id: map[idColumnName], criadoEm: map[criadoEm] != null ? DateTime.parse(map[criadoEm]) : null);

  @override
  Future<void> insert(E entity) async {
    final database = BotDatabase().connection;

    final values = toMap(entity);

    final columns = values.keys.join(', ');
    final placeholders = List.filled(values.length, '?').join(', ');

    database.execute('''
    INSERT INTO $tableName ($columns)
    VALUES ($placeholders)
    ''', values.values.toList());
  }

  @override
  Future<void> update(E entity) async {
    final database = BotDatabase().connection;

    final values = toMap(entity);

    final id = values.remove(idColumnName);

    final setClause = values.keys.map((coluna) => '$coluna = ?').join(', ');

    database.execute(
      '''
    UPDATE $tableName
    SET $setClause
    WHERE $idColumnName = ?
    ''',
      [...values.values, id],
    );
  }

  @override
  Future<void> delete(String id) async {
    final database = BotDatabase();

    database.connection.execute('''
    DELETE FROM $tableName WHERE id_discord = $id
    ''');
  }

  @override
  Future<List<E>> getAll() async {
    final database = BotDatabase().connection;

    final select = database.select('''
    SELECT * FROM $tableName;
    ''');

    return select.map(fromRow).toList();
  }

  @override
  Future<E?> getById(String id) async {
    final result = database.select('''
    SELECT * FROM $tableName WHERE $idColumnName == ?
     ''', [id]);

    if(result.isEmpty) {
      return null;
    }

    return fromRow(result.first);
  }

  @override
  Future<void> save(E entity) async {
    final entityById = await getById(entity.base.id);

    if (entityById != null) {
      await update(entityById);
    } else {
      await insert(entity);
    }
  }
}
