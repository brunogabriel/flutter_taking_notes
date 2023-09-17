import 'package:isar/isar.dart';

part 'isar_note_entity.g.dart';

@collection
class IsarNoteEntity {
  IsarNoteEntity({
    required this.title,
    required this.content,
  });

  Id id = Isar.autoIncrement;
  String title;
  String content;
}
