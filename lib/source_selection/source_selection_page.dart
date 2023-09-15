import 'package:flutter/material.dart';
import 'package:flutter_taking_notes/data/drift/drift_data_source.dart';
import 'package:flutter_taking_notes/data/memory/memory_data_source.dart';
import 'package:flutter_taking_notes/data/note_repository.dart';
import 'package:flutter_taking_notes/data/sqlite/sqlite_data_source.dart';
import 'package:flutter_taking_notes/data/sqlite/sqlite_db.dart';
import 'package:flutter_taking_notes/list/notes_list_page.dart';

import '../data/drift/drift_db.dart';

class SourceSelectionPage extends StatefulWidget {
  const SourceSelectionPage({super.key});

  @override
  State<SourceSelectionPage> createState() => _SourceSelectionPageState();
}

class _SourceSelectionPageState extends State<SourceSelectionPage> {
  late NoteReposositoryImp _reposositoryImp;

  final _methods = ['Memory', 'Pure Sqlite', 'Drift'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Select persistence strategy')),
        body: ListView.separated(
            itemBuilder: (context, index) => ListTile(
                  title: Text(_methods[index]),
                  trailing: const Icon(Icons.arrow_right),
                  onTap: () async {
                    _reposositoryImp = NoteReposositoryImp();
                    if (index == 0) {
                      initInMemory();
                    } else if (index == 1) {
                      await initPureSqlite();
                    } else if (index == 2) {
                      await initDrift();
                    }

                    assert(index < 3);
                    if (!mounted) return;
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (_) => const NotesListPage(),
                    ));
                  },
                ),
            separatorBuilder: (_, __) => const SizedBox(height: 16),
            itemCount: _methods.length));
  }

  Future<void> initPureSqlite() async {
    final pureSqlite = SqliteDb();
    await pureSqlite.init();
    _reposositoryImp.selectDataSource(SqliteDataSource(pureSqlite));
  }

  Future<void> initDrift() async {
    final driftDb = DriftDb();
    _reposositoryImp.selectDataSource(DriftDataSource(driftDb));
  }

  void initInMemory() {
    _reposositoryImp.selectDataSource(MemoryDataSource());
  }
}
