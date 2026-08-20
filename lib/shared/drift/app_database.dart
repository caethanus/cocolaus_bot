import 'package:cocolaus_bot/modules/usuario_discord/table/usuario_discord/usuario_discord_table.dart';
import 'package:drift/drift.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [UsuarioDiscordTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.e, {bool logStatements = false});

  @override
  int get schemaVersion => 1;

// Example migration
// @override
// MigrationStrategy get migration {
//   return MigrationStrategy(
//     onCreate: (Migrator m) async {
//       await m.createAll();
//     },
//     onUpgrade: (Migrator m, int from, int to) async {
//       // Run migration steps
//     },
//   );
// }
}