

import 'dart:io';

import 'package:sqlite3/sqlite3.dart';

class BotDatabase {
  final Database connection;

  BotDatabase() : connection = _openDatabase();

  static Database _openDatabase() {
    final directory = Directory(
      '${Directory.current.path}\\db',
    );

    if (!directory.existsSync()) {
      directory.createSync(recursive: true);
    }

    final path = '${directory.path}\\cocolaus.db';

    final database = sqlite3.open(path);

    database.execute('PRAGMA foreign_keys = ON;');

    return database;
  }

  void close() => connection.close();
}