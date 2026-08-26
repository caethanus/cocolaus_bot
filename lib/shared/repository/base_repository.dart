import 'package:cocolaus_bot/shared/database/bot_database.dart';
import 'package:cocolaus_bot/shared/entity/base_entity.dart';
import 'package:cocolaus_bot/shared/entity/base_entity_interface.dart';
import 'package:cocolaus_bot/shared/repository/base_repository_interface.dart';
import 'package:sqflite/sqflite.dart';

abstract class BaseRepository<E extends IBaseEntity> implements IBaseRepository<E> {
  static const criadoEm = 'criado_em';
  static const deletadoEm = 'deletado_em';

  String get tableName;

  String get idColumnName => 'id_$tableName';

  Map<String, dynamic> toMap(E entity);

  E fromMap(Map<String, dynamic> map);

  void create(Batch batch);

  BaseEntity baseFromMap(Map<String, dynamic> map) => BaseEntity(id: map[idColumnName], criadoEm: map[criadoEm] != null ? DateTime.parse(map[criadoEm]) : null, deletadoEm: map[deletadoEm] != null ? DateTime.parse(map[deletadoEm]) : null);

  @override
  Future<void> save(E e) async {
    var values = toMap(e);
    var db = await BotDatabase().getDb();
    await db.insert(tableName, values);
  }

}
