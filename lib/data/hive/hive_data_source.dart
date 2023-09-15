import 'dart:async';

import 'package:flutter_taking_notes/data/data_source.dart';
import 'package:flutter_taking_notes/data/hive/entity/hive_note_entity.dart';
import 'package:flutter_taking_notes/data/model/note.dart';
import 'package:hive/hive.dart';

class HiveDataSource implements DataSource {
  const HiveDataSource(this._box);

  final String _box;

  @override
  FutureOr<void> delete(Note model) async {
    final notesBox = await Hive.openBox<HiveNoteEntity>(_box);
    return notesBox.delete(model.id!);
  }

  @override
  FutureOr<void> dispose() => Hive.close();

  @override
  FutureOr<List<Note>> getAll() async {
    final notesBox = await Hive.openBox<HiveNoteEntity>(_box);
    final notes = notesBox.values.toList();
    return List.generate(
      notesBox.length,
      (index) => Note(
        notes[index].id,
        notes[index].title,
        notes[index].content,
      ),
    );
  }

  @override
  FutureOr<void> save(Note model) async {
    final notesBox = await Hive.openBox<HiveNoteEntity>(_box);
    await notesBox.put(
      notesBox.length,
      HiveNoteEntity(
        id: notesBox.length,
        title: model.title,
        content: model.content,
      ),
    );
  }

  @override
  FutureOr<void> update(Note model) async {
    final notesBox = await Hive.openBox<HiveNoteEntity>(_box);
    return notesBox.put(
      model.id!,
      HiveNoteEntity(
        id: model.id!,
        title: model.title,
        content: model.content,
      ),
    );
  }
}
