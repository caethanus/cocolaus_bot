import 'package:drift/drift.dart';

class UsuarioDiscordTable extends Table {
  @override
  String? get tableName => 'usuarios_discord';

  @override
  Set<Column<Object>>? get primaryKey => {idDiscord};

  TextColumn get idDiscord => text()();
  TextColumn get nomeUsuarioDiscord => text()();
}