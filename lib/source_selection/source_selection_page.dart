import 'package:flutter/material.dart';
import 'package:flutter_taking_notes/data/drift/drift_data_source.dart';
import 'package:flutter_taking_notes/data/isar/entity/isar_note_entity.dart';
import 'package:flutter_taking_notes/data/isar/isar_data_source.dart';
import 'package:flutter_taking_notes/data/memory/memory_data_source.dart';
import 'package:flutter_taking_notes/data/note_repository.dart';
import 'package:flutter_taking_notes/data/sqlite/sqlite_data_source.dart';
import 'package:flutter_taking_notes/data/sqlite/sqlite_db.dart';
import 'package:flutter_taking_notes/list/notes_list_page.dart';
import 'package:flutter_taking_notes/source_selection/db_source.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../data/drift/drift_db.dart';

class SourceSelectionPage extends StatefulWidget {
  const SourceSelectionPage({super.key});

  @override
  State<SourceSelectionPage> createState() => _SourceSelectionPageState();
}

class _SourceSelectionPageState extends State<SourceSelectionPage> {
  late NoteReposositoryImp _reposositoryImp;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select persistence strategy')),
      body: ListView.separated(
        itemBuilder: (context, index) => ListTile(
          title: Text(DBSource.values[index].name),
          trailing: const Icon(Icons.arrow_right),
          onTap: () async {
            _reposositoryImp = NoteReposositoryImp();
            switch (DBSource.values[index]) {
              case DBSource.memory:
                initInMemory();
              case DBSource.sqLite:
                await initPureSqlite();
              case DBSource.drift:
                await initDrift();
              case DBSource.isar:
                await initIsar();
            }
            if (!mounted) return;
            Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => const NotesListPage(),
            ));
          },
        ),
        separatorBuilder: (_, __) => const SizedBox(height: 16),
        itemCount: DBSource.values.length,
      ),
    );
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

  Future<void> initIsar() async {
    final dir = await getApplicationDocumentsDirectory();
    final isar = await Isar.open([IsarNoteEntitySchema], directory: dir.path);
    _reposositoryImp.selectDataSource(IsarDataSource(isar));
  }

  void initInMemory() {
    _reposositoryImp.selectDataSource(MemoryDataSource());
  }
}
