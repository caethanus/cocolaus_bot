import 'package:sqlite3/sqlite3.dart';

class BotDatabase {
  late final Database connection;

  BotDatabase({String path = 'cocolaus.db'}) {
    connection = sqlite3.open(path);
    connection.execute('PRAGMA foreign_keys = ON;');
  }

  void close() => connection.close();
}
