import 'package:cocolaus_bot/modules/pessoa/repository/pessoa_repository.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:synchronized/synchronized.dart';

class BotDatabase {
  final String _nomeDatabase = 'cocolaus.db';
  final int _versaoDatabase = 1;
  final _lock = Lock();
  static Database? _db;

  BotDatabase();

  Future<Database> getDb() async {
    if (_db == null) {
      await _lock.synchronized(() async {
        final pathDb = await getDatabasesPath();
        final path = join(pathDb, _nomeDatabase);
        _db = await openDatabase(path, version: _versaoDatabase, onCreate: _onCreate, onConfigure: _onConfigureBeforeOpenDatabase);
        await _onConfigureAfterOpenDatabase(_db!);
      });
    }
    return _db!;
  }

  Future<void> _onConfigureBeforeOpenDatabase(Database db) async {
    await db.execute("PRAGMA foreign_keys = OFF");
  }

  Future<void> _onConfigureAfterOpenDatabase(Database db) async {
    await db.execute("PRAGMA foreign_keys = ON");
  }

  Future<void> _onCreate(Database db, int version) async {
    var batch = db.batch();
    PessoaRepository().create(batch);
    await batch.commit();
  }

  Future<void> close() async {
    if (_db != null) {
      await _db!.close();
      _db = null;
    }
  }
}
