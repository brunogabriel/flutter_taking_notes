import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_taking_notes/data/note_repository.dart';

import '../../data/model/note.dart';
import '../domain/note_repository.dart';
import 'note_form.dart';

class EditNotePage extends StatefulWidget {
  const EditNotePage({Key? key, this.note}) : super(key: key);

  final Note? note;

  bool get isUpdating => note != null;

  @override
  State<EditNotePage> createState() => _EditNotePageState();
}

class _EditNotePageState extends State<EditNotePage> {
  final _formKey = GlobalKey<FormState>();
  final NoteRepository _repository = NoteReposositoryImp();

  late String title;
  late String description;

  @override
  void initState() {
    super.initState();
    title = widget.note?.title ?? '';
    description = widget.note?.content ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => _save(),
        child: const Icon(Icons.save),
      ),
      appBar: AppBar(
        title: Text(widget.isUpdating ? 'Update Note' : 'Create Note'),
        actions: [
          IconButton(
            onPressed: () async {
              if (widget.note != null) {
                await _repository.delete(widget.note!);
              }
              if (!mounted) return;
              Navigator.of(context).pop();
            },
            icon: const Icon(CupertinoIcons.trash),
          )
        ],
      ),
      body: Form(
        key: _formKey,
        child: NoteForm(
          title: title,
          description: description,
          onChangedTitle: (title) => setState(() => this.title = title),
          onChangedDescription: (description) =>
              setState(() => this.description = description),
        ),
      ),
    );
  }

  void _save() async {
    final isValid = _formKey.currentState?.validate();
    if (isValid == true) {
      final noteCandidate =
          widget.note?.copyWith(newTitle: title, newContent: description) ??
              Note(null, title, description);

      if (widget.isUpdating) {
        await _repository.update(noteCandidate);
      } else {
        await _repository.save(noteCandidate);
      }
      if (!mounted) return;
      Navigator.of(context).pop();
    }
  }
}
