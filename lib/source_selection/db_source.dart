enum DBSource {
  memory('Memory'),
  sqLite('Pure Sqlite'),
  drift('Drift'),
  isar('Isar');

  const DBSource(this.name);
  final String name;
}
