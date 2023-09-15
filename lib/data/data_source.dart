import 'dart:async';

import 'model/note.dart';

abstract class DataSource {
  FutureOr<void> save(Note model);
  FutureOr<List<Note>> getAll();
  FutureOr<void> update(Note model);
  FutureOr<void> delete(Note model);
  FutureOr<void> dispose();
}
