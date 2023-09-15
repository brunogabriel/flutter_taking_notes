import 'dart:async';

import 'package:flutter_taking_notes/data/data_source.dart';
import 'package:flutter_taking_notes/data/model/note.dart';
import 'package:flutter_taking_notes/data/sqlite/entity/note_sqlite_entity.dart';
import 'package:flutter_taking_notes/data/sqlite/sqlite_db.dart';
import 'package:sqflite/sqflite.dart';

class SqliteDataSource implements DataSource {
  SqliteDataSource(this._db);

  final SqliteDb _db;

  @override
  FutureOr<void> delete(Note model) async {
    await _db.database.delete(
      'notes',
      where: 'id = ?',
      whereArgs: [model.id ?? 0], // whereArgs to avoid sql injection
    );
  }

  @override
  FutureOr<void> dispose() {}

  @override
  FutureOr<List<Note>> getAll() async {
    final notes = await _db.database.query('notes');

    return List.generate(
      notes.length,
      (index) => Note(
        notes[index]['id'] as int,
        notes[index]['title'] as String,
        notes[index]['content'] as String,
      ),
    );
  }

  @override
  FutureOr<void> save(Note model) async {
    await _db.database.insert(
      'notes',
      NoteSqliteEntity(model.id ?? -1, model.title, model.content)
          .toInsertMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  FutureOr<void> update(Note model) async {
    await _db.database.update(
      'notes',
      NoteSqliteEntity(model.id ?? 0, model.title, model.content).toMap(),
      where: 'id  = ?',
      whereArgs: [model.id ?? 0],
    );
  }
}
