// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_db.dart';

// ignore_for_file: type=lint
class PokemonEntity extends Table
    with TableInfo<PokemonEntity, PokemonEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  PokemonEntity(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL PRIMARY KEY');
  static const VerificationMeta _numberMeta = const VerificationMeta('number');
  late final GeneratedColumn<int> number = GeneratedColumn<int>(
      'number', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
      'url', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns => [name, number, url];
  @override
  String get aliasedName => _alias ?? 'pokemon_entity';
  @override
  String get actualTableName => 'pokemon_entity';
  @override
  VerificationContext validateIntegrity(Insertable<PokemonEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('number')) {
      context.handle(_numberMeta,
          number.isAcceptableOrUnknown(data['number']!, _numberMeta));
    } else if (isInserting) {
      context.missing(_numberMeta);
    }
    if (data.containsKey('url')) {
      context.handle(
          _urlMeta, url.isAcceptableOrUnknown(data['url']!, _urlMeta));
    } else if (isInserting) {
      context.missing(_urlMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {name};
  @override
  PokemonEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PokemonEntityData(
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      number: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}number'])!,
      url: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}url'])!,
    );
  }

  @override
  PokemonEntity createAlias(String alias) {
    return PokemonEntity(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class PokemonEntityData extends DataClass
    implements Insertable<PokemonEntityData> {
  final String name;
  final int number;
  final String url;
  const PokemonEntityData(
      {required this.name, required this.number, required this.url});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['name'] = Variable<String>(name);
    map['number'] = Variable<int>(number);
    map['url'] = Variable<String>(url);
    return map;
  }

  PokemonEntityCompanion toCompanion(bool nullToAbsent) {
    return PokemonEntityCompanion(
      name: Value(name),
      number: Value(number),
      url: Value(url),
    );
  }

  factory PokemonEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PokemonEntityData(
      name: serializer.fromJson<String>(json['name']),
      number: serializer.fromJson<int>(json['number']),
      url: serializer.fromJson<String>(json['url']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'name': serializer.toJson<String>(name),
      'number': serializer.toJson<int>(number),
      'url': serializer.toJson<String>(url),
    };
  }

  PokemonEntityData copyWith({String? name, int? number, String? url}) =>
      PokemonEntityData(
        name: name ?? this.name,
        number: number ?? this.number,
        url: url ?? this.url,
      );
  @override
  String toString() {
    return (StringBuffer('PokemonEntityData(')
          ..write('name: $name, ')
          ..write('number: $number, ')
          ..write('url: $url')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(name, number, url);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PokemonEntityData &&
          other.name == this.name &&
          other.number == this.number &&
          other.url == this.url);
}

class PokemonEntityCompanion extends UpdateCompanion<PokemonEntityData> {
  final Value<String> name;
  final Value<int> number;
  final Value<String> url;
  final Value<int> rowid;
  const PokemonEntityCompanion({
    this.name = const Value.absent(),
    this.number = const Value.absent(),
    this.url = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PokemonEntityCompanion.insert({
    required String name,
    required int number,
    required String url,
    this.rowid = const Value.absent(),
  })  : name = Value(name),
        number = Value(number),
        url = Value(url);
  static Insertable<PokemonEntityData> custom({
    Expression<String>? name,
    Expression<int>? number,
    Expression<String>? url,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (name != null) 'name': name,
      if (number != null) 'number': number,
      if (url != null) 'url': url,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PokemonEntityCompanion copyWith(
      {Value<String>? name,
      Value<int>? number,
      Value<String>? url,
      Value<int>? rowid}) {
    return PokemonEntityCompanion(
      name: name ?? this.name,
      number: number ?? this.number,
      url: url ?? this.url,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (number.present) {
      map['number'] = Variable<int>(number.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PokemonEntityCompanion(')
          ..write('name: $name, ')
          ..write('number: $number, ')
          ..write('url: $url, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $NoteEntityTable extends NoteEntity
    with TableInfo<$NoteEntityTable, NoteTable> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NoteEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 2, maxTextLength: 64),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _contentMeta =
      const VerificationMeta('content');
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
      'content', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, title, content];
  @override
  String get aliasedName => _alias ?? 'note_entity';
  @override
  String get actualTableName => 'note_entity';
  @override
  VerificationContext validateIntegrity(Insertable<NoteTable> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NoteTable map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NoteTable(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      content: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content'])!,
    );
  }

  @override
  $NoteEntityTable createAlias(String alias) {
    return $NoteEntityTable(attachedDatabase, alias);
  }
}

class NoteTable extends DataClass implements Insertable<NoteTable> {
  final int id;
  final String title;
  final String content;
  const NoteTable(
      {required this.id, required this.title, required this.content});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['content'] = Variable<String>(content);
    return map;
  }

  NoteEntityCompanion toCompanion(bool nullToAbsent) {
    return NoteEntityCompanion(
      id: Value(id),
      title: Value(title),
      content: Value(content),
    );
  }

  factory NoteTable.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NoteTable(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      content: serializer.fromJson<String>(json['content']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'content': serializer.toJson<String>(content),
    };
  }

  NoteTable copyWith({int? id, String? title, String? content}) => NoteTable(
        id: id ?? this.id,
        title: title ?? this.title,
        content: content ?? this.content,
      );
  @override
  String toString() {
    return (StringBuffer('NoteTable(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('content: $content')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, content);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NoteTable &&
          other.id == this.id &&
          other.title == this.title &&
          other.content == this.content);
}

class NoteEntityCompanion extends UpdateCompanion<NoteTable> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> content;
  const NoteEntityCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.content = const Value.absent(),
  });
  NoteEntityCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String content,
  })  : title = Value(title),
        content = Value(content);
  static Insertable<NoteTable> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? content,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (content != null) 'content': content,
    });
  }

  NoteEntityCompanion copyWith(
      {Value<int>? id, Value<String>? title, Value<String>? content}) {
    return NoteEntityCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NoteEntityCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('content: $content')
          ..write(')'))
        .toString();
  }
}

abstract class _$DriftDb extends GeneratedDatabase {
  _$DriftDb(QueryExecutor e) : super(e);
  late final PokemonEntity pokemonEntity = PokemonEntity(this);
  late final $NoteEntityTable noteEntity = $NoteEntityTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [pokemonEntity, noteEntity];
}
