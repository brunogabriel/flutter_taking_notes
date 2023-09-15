class NoteSqliteEntity {
  const NoteSqliteEntity(this.id, this.title, this.content);

  final int id;
  final String title;
  final String content;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
    };
  }

  Map<String, dynamic> toInsertMap() {
    return {
      'id': null,
      'title': title,
      'content': content,
    };
  }
}
