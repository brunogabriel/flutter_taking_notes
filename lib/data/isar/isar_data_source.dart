import 'dart:async';

import 'package:flutter_taking_notes/data/data_source.dart';
import 'package:flutter_taking_notes/data/isar/entity/isar_note_entity.dart';
import 'package:flutter_taking_notes/data/model/note.dart';
import 'package:isar/isar.dart';

class IsarDataSource implements DataSource {
  const IsarDataSource(this._isar);

  final Isar _isar;

  @override
  FutureOr<void> delete(Note model) async {
    _isar.writeTxnSync(
      () => _isar.isarNoteEntitys.deleteSync(model.id!),
    );
  }

  @override
  FutureOr<void> dispose() => _isar.close();

  @override
  FutureOr<List<Note>> getAll() async {
    final notes = await _isar.txn(
      () async => await _isar.isarNoteEntitys.where().findAll(),
    );
    return List.generate(
      notes.length,
      (index) => Note(
        notes[index].id,
        notes[index].title,
        notes[index].content,
      ),
    );
  }

  @override
  FutureOr<void> save(Note model) async {
    await _isar.writeTxn(
      () async => await _isar.isarNoteEntitys.put(
        IsarNoteEntity(
          title: model.title,
          content: model.content,
        ),
      ),
    );
  }

  @override
  FutureOr<void> update(Note model) async {
    await _isar.writeTxn(() async {
      final entity = await _isar.isarNoteEntitys.get(model.id!);
      final updatedEntity = entity
        ?..title = model.title
        ..content = model.content;
      _isar.isarNoteEntitys.put(updatedEntity!);
    });
  }
}
