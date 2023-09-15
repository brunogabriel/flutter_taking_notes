import 'dart:async';

import 'package:flutter_taking_notes/data/data_source.dart';
import 'package:flutter_taking_notes/data/memory/entity/memory_note_entity.dart';
import 'package:flutter_taking_notes/data/model/note.dart';

class MemoryDataSource implements DataSource {
  var _counter = 0;
  final _notes = <MemoryNoteEntity>{};

  @override
  FutureOr<void> delete(Note model) {
    final entity = MemoryNoteEntity.fromNote(model);
    _notes.removeWhere((element) => element == entity);
  }

  @override
  void dispose() {}

  @override
  FutureOr<List<Note>> getAll() {
    final result =
        _notes.toList().map((e) => Note(e.id, e.title, e.content)).toList();
    result.sort((a, b) => (a.id ?? 0).compareTo((b.id ?? 0)));
    return result;
  }

  @override
  FutureOr<void> save(Note model) {
    _counter++;
    _notes.add(MemoryNoteEntity.fromNote(model).copyWith(newId: _counter));
  }

  @override
  FutureOr<void> update(Note model) {
    _notes.removeWhere((element) => element.id == model.id);
    _notes.add(MemoryNoteEntity.fromNote(model));
  }
}
