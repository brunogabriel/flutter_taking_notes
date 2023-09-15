import '../data/model/note.dart';

abstract class NoteRepository {
  Future<void> save(Note note);
  Future<List<Note>> getAll();
  Future<void> update(Note note);
  Future<void> delete(Note note);
  void dispose();
}
