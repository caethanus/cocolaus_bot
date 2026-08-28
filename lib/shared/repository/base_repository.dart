import 'package:cocolaus_bot/shared/database/bot_database.dart';
import 'package:cocolaus_bot/shared/entity/base_entity.dart';
import 'package:cocolaus_bot/shared/entity/base_entity_interface.dart';
import 'package:cocolaus_bot/shared/repository/base_repository_interface.dart';
import 'package:sqlite3/sqlite3.dart';

abstract class BaseRepository<E extends IBaseEntity> implements IBaseRepository<E> {
  static const criadoEm = 'criado_em';

  String get tableName;

  String get idColumnName => 'id_$tableName';

  Map<String, dynamic> toMap(E entity);

  E fromMap(Map<String, dynamic> map);

  E fromRow(Row row);

  BaseEntity baseFromMap(Map<String, dynamic> map) => BaseEntity(id: map[idColumnName], criadoEm: map[criadoEm] != null ? DateTime.parse(map[criadoEm]) : null,);

  @override
  Future<void> save(E entity) async {
    final database = BotDatabase();

    final values = toMap(entity);

    final columns = values.keys.join(', ');
    final placeholders = List.filled(values.length, '?').join(', ');

    database.connection.execute('''
    INSERT INTO $tableName ($columns)
    VALUES ($placeholders)
    ''', values.values.toList());
  }

  @override
  Future<void> delete(String id) async {
    final database = BotDatabase();

    database.connection.execute('''
    DELETE FROM $tableName WHERE id_discord = $id
    ''');
  }

  @override
  Future<List<E>> get() async {
    final database = BotDatabase();

    final select = database.connection.select('''
    SELECT * FROM $tableName;
    ''');

    return select.map(fromRow).toList();
  }
}
