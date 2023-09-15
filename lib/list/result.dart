import 'package:flutter_taking_notes/data/model/note.dart';

class Result {
  Result({
    this.status = Status.initial,
    this.notes = const [],
  });

  Result copyWith({
    Status? newStatus,
    List<Note>? newNotes,
  }) {
    return Result(
      status: newStatus ?? status,
      notes: newNotes ?? notes,
    );
  }

  final Status status;
  final List<Note> notes;
}

enum Status {
  initial,
  load,
  success,
  failure;
}
