import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqliteDb {
  late Database database;
  Future<void> init() async {
    final newDb =
        await openDatabase(join(await getDatabasesPath(), 'notes_pure.sqlite'),
            onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE notes(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, content TEXT)',
      );
    }, version: 1);
    database = newDb;
  }
}
