import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_taking_notes/data/drift/entity/note_entity.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'drift_db.g.dart';

@DriftDatabase(tables: [NoteEntity], include: {'tables.drift'})
class DriftDb extends _$DriftDb {
  DriftDb() : super(_openNativeDatabase());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openNativeDatabase() {
  return LazyDatabase(() async {
    final folder = await getApplicationDocumentsDirectory();
    final file = File(p.join(folder.path, 'notes.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
