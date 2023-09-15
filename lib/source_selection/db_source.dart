enum DBSource {
  memory('Memory'),
  sqLite('Pure Sqlite'),
  drift('Drift'),
  hive('Hive');

  const DBSource(this.name);
  final String name;
}
