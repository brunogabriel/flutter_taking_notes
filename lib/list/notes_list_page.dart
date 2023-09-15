import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_taking_notes/data/note_repository.dart';
import 'package:flutter_taking_notes/list/note_card.dart';
import 'package:flutter_taking_notes/list/result.dart';

import '../domain/note_repository.dart';
import '../edit/edit_note_page.dart';

class NotesListPage extends StatefulWidget {
  const NotesListPage({super.key});

  @override
  State<NotesListPage> createState() => _NotesListPageState();
}

class _NotesListPageState extends State<NotesListPage> {
  var _result = Result();
  final NoteRepository _repository = NoteReposositoryImp();

  @override
  void initState() {
    super.initState();
    refreshData();
  }

  @override
  void dispose() {
    _repository.dispose();
    super.dispose();
  }

  Future refreshData() async {
    setState(() {
      _result = _result.copyWith(newStatus: Status.load);
    });
    try {
      final notes = await _repository.getAll();
      setState(() {
        _result = _result.copyWith(newNotes: notes, newStatus: Status.success);
      });
    } catch (_) {
      setState(() {
        _result = _result.copyWith(newStatus: Status.failure);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => const EditNotePage(),
          ));
          refreshData();
        },
        child: Icon(
          Icons.note_add,
          color: Colors.black.withOpacity(0.5),
        ),
      ),
      body: Builder(
        builder: (context) {
          switch (_result.status) {
            case Status.load:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case Status.success:
              return StaggeredGridView.countBuilder(
                padding: const EdgeInsets.all(8),
                itemCount: _result.notes.length,
                staggeredTileBuilder: (index) => const StaggeredTile.fit(2),
                crossAxisCount: 4,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
                itemBuilder: (context, index) {
                  final note = _result.notes[index];
                  return GestureDetector(
                    onTap: () async {
                      await Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => EditNotePage(
                          note: note,
                        ),
                      ));
                      refreshData();
                    },
                    child: NoteCard(note: note, index: index),
                  );
                },
              );
            case Status.failure:
              return const Center(
                child: Text('There is something wrong!!!'),
              );
            default:
              return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
