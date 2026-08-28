import 'dart:io';

import 'package:cocolaus_bot/modules/dia_coca/repository/dia_coca_repository.dart';
import 'package:cocolaus_bot/modules/pessoa/repository/pessoa_repository.dart';
import 'package:sqlite3/sqlite3.dart';

class BotDatabase {
  static Database? _db;

  BotDatabase();

  Database get connection {
    _db ??= _openDatabase();
    return _db!;
  }

  Database _openDatabase() {
    final directory = Directory('${Directory.current.path}\\db');

    if (!directory.existsSync()) {
      directory.createSync(recursive: true);
    }

    final path = '${directory.path}\\cocolaus.db';

    final database = sqlite3.open(path);

    database.execute('PRAGMA foreign_keys = ON;');

    _migrate(database);

    return database;
  }

  void close() {
    _db?.close();
    _db = null;
  }

  void _migrate(Database database) {
    final result = database.select('PRAGMA user_version;');

    var currentVersion = result.first['user_version'] as int;

    if (currentVersion < 1) {
      PessoaRepository().create(database);
      DiaCocaRepository().create(database);

      database.execute('''
      CREATE UNIQUE INDEX IF NOT EXISTS idx_dias_coca_data
      ON dias_coca(data)
      WHERE data IS NOT NULL;
      ''');

      database.execute('''
      CREATE TRIGGER IF NOT EXISTS trg_dia_coca_insert
      AFTER INSERT ON dias_coca
      BEGIN
          UPDATE dias_coca
          SET data = (
              WITH RECURSIVE sextas(data) AS (
                  SELECT date(
                      'now',
                      '+' || (
                          (5 - CAST(strftime('%w', 'now') AS INTEGER) + 7) % 7
                      ) || ' days'
                  )

                  UNION ALL

                  SELECT date(data, '+7 days')
                  FROM sextas
                  WHERE data < date('now', '+365 days')
              )
              SELECT sextas.data || 'T00:00:00.000'
              FROM sextas
              WHERE NOT EXISTS (
                  SELECT 1
                  FROM dias_coca
                  WHERE dias_coca.data = sextas.data || 'T00:00:00.000'
                    AND dias_coca.id_dias_coca != NEW.id_dias_coca
              )
              ORDER BY sextas.data
              LIMIT 1
          )
          WHERE id_dias_coca = NEW.id_dias_coca;
      END;
      ''');

      database.execute('PRAGMA user_version = 1;');
      currentVersion = 1;
    }
  }
}