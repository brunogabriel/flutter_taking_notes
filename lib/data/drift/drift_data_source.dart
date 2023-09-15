import 'dart:async';

import 'package:drift/drift.dart';
import 'package:flutter_taking_notes/data/data_source.dart';
import 'package:flutter_taking_notes/data/drift/drift_db.dart';
import 'package:flutter_taking_notes/data/model/note.dart';

class DriftDataSource implements DataSource {
  DriftDataSource(this._db);

  final DriftDb _db;

  @override
  FutureOr<void> delete(Note model) async {
    _db.delete(_db.noteEntity)
      ..where((tbl) => tbl.id.equals(model.id ?? 0))
      ..go();
  }

  @override
  FutureOr<void> dispose() async {
    await _db.close();
  }

  @override
  FutureOr<List<Note>> getAll() async {
    final result =
        await _db.select(_db.noteEntity).get().onError((_, __) => []);

    return result
        .map((entity) => Note(entity.id, entity.title, entity.content))
        .toList();
  }

  @override
  FutureOr<void> save(Note model) async {
    await _db.into(_db.noteEntity).insertOnConflictUpdate(
        NoteEntityCompanion.insert(title: model.title, content: model.content));
  }

  @override
  FutureOr<void> update(Note model) async {
    await (_db.update(_db.noteEntity)
          ..where((tbl) => tbl.id.equals(model.id ?? 0)))
        .write(NoteEntityCompanion(
            id: Value(model.id ?? 0),
            title: Value(model.title),
            content: Value(model.content)));
  }
}
