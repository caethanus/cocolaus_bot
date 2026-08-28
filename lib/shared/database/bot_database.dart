import 'dart:io';

import 'package:cocolaus_bot/modules/dia_coca/repository/dia_coca_repository.dart';
import 'package:cocolaus_bot/modules/dia_coca/repository/dia_coca_repository_interface.dart';
import 'package:cocolaus_bot/modules/pessoa/repository/pessoa_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:sqlite3/sqlite3.dart';

class BotDatabase {
  final Database connection;

  BotDatabase() : connection = _openDatabase() {
    migrate();
  }

  static Database _openDatabase() {
    final directory = Directory('${Directory.current.path}\\db');

    if (!directory.existsSync()) {
      directory.createSync(recursive: true);
    }

    final path = '${directory.path}\\cocolaus.db';

    final database = sqlite3.open(path);

    database.execute('PRAGMA foreign_keys = ON;');

    return database;
  }

  void close() => connection.close();

  void migrate() {
    final result = connection.select('PRAGMA user_version;');

    var currentVersion = result.first['user_version'] as int;

    if (currentVersion < 1) {
      PessoaRepository().create(connection);
      DiaCocaRepository().create(connection);

      connection.execute('PRAGMA user_version = 1;');
      currentVersion = 1;
    }
  }
}
