import 'package:drift/drift.dart';

@DataClassName('NoteTable')
class NoteEntity extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 2, max: 64)();
  TextColumn get content => text().named('content')();
}
