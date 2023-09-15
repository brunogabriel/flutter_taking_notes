import 'package:flutter_taking_notes/data/data_source.dart';
import 'package:flutter_taking_notes/data/model/note.dart';

import '../domain/note_repository.dart';

class NoteReposositoryImp implements NoteRepository {
  NoteReposositoryImp._internal() {}

  factory NoteReposositoryImp() {
    return _instance;
  }
  static final NoteReposositoryImp _instance = NoteReposositoryImp._internal();
  late final DataSource _selectedDataSource;

  void selectDataSource(DataSource newDataSource) {
    _selectedDataSource = newDataSource;
  }

  @override
  Future<void> delete(Note note) async {
    _selectedDataSource.delete(note);
  }

  @override
  void dispose() => _selectedDataSource.dispose();

  @override
  Future<List<Note>> getAll() async => _selectedDataSource.getAll();

  @override
  Future<void> save(Note note) async => _selectedDataSource.save(note);

  @override
  Future<void> update(Note note) async => _selectedDataSource.update(note);
}
