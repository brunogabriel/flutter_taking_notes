import 'package:hive/hive.dart';

part 'hive_note_entity.g.dart';

@HiveType(typeId: 1)
class HiveNoteEntity {
  const HiveNoteEntity({
    required this.id,
    required this.title,
    required this.content,
  });

  @HiveField(0)
  final int id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String content;
}
