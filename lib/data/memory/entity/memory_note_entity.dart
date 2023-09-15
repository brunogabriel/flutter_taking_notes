import 'package:flutter_taking_notes/data/model/note.dart';

class MemoryNoteEntity {
  factory MemoryNoteEntity.fromNote(Note note) =>
      MemoryNoteEntity(note.id ?? 0, note.title, note.content);

  MemoryNoteEntity(this.id, this.title, this.content);

  MemoryNoteEntity copyWith(
      {int? newId, String? newTitle, String? newContent}) {
    return MemoryNoteEntity(
      newId ?? id,
      newTitle ?? title,
      newContent ?? content,
    );
  }

  final int id;
  final String title;
  final String content;
}
