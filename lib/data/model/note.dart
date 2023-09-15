import 'package:equatable/equatable.dart';

class Note extends Equatable {
  const Note(this.id, this.title, this.content);

  final int? id;
  final String title;
  final String content;

  Note copyWith({int? newId, String? newTitle, String? newContent}) {
    return Note(
      newId ?? id,
      newTitle ?? title,
      newContent ?? content,
    );
  }

  @override
  List<Object?> get props => [id, title, content];
}
