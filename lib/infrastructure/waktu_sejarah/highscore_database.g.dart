// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'highscore_database.dart';

// ignore_for_file: type=lint
class $HighScoresTable extends HighScores
    with TableInfo<$HighScoresTable, HighScore> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HighScoresTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _scoreMeta = const VerificationMeta('score');
  @override
  late final GeneratedColumn<int> score = GeneratedColumn<int>(
      'score', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'category', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, score, category];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'high_scores';
  @override
  VerificationContext validateIntegrity(Insertable<HighScore> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('score')) {
      context.handle(
          _scoreMeta, score.isAcceptableOrUnknown(data['score']!, _scoreMeta));
    } else if (isInserting) {
      context.missing(_scoreMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  HighScore map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HighScore(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      score: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}score'])!,
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category'])!,
    );
  }

  @override
  $HighScoresTable createAlias(String alias) {
    return $HighScoresTable(attachedDatabase, alias);
  }
}

class HighScore extends DataClass implements Insertable<HighScore> {
  final int id;
  final int score;
  final String category;
  const HighScore(
      {required this.id, required this.score, required this.category});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['score'] = Variable<int>(score);
    map['category'] = Variable<String>(category);
    return map;
  }

  HighScoresCompanion toCompanion(bool nullToAbsent) {
    return HighScoresCompanion(
      id: Value(id),
      score: Value(score),
      category: Value(category),
    );
  }

  factory HighScore.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HighScore(
      id: serializer.fromJson<int>(json['id']),
      score: serializer.fromJson<int>(json['score']),
      category: serializer.fromJson<String>(json['category']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'score': serializer.toJson<int>(score),
      'category': serializer.toJson<String>(category),
    };
  }

  HighScore copyWith({int? id, int? score, String? category}) => HighScore(
        id: id ?? this.id,
        score: score ?? this.score,
        category: category ?? this.category,
      );
  HighScore copyWithCompanion(HighScoresCompanion data) {
    return HighScore(
      id: data.id.present ? data.id.value : this.id,
      score: data.score.present ? data.score.value : this.score,
      category: data.category.present ? data.category.value : this.category,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HighScore(')
          ..write('id: $id, ')
          ..write('score: $score, ')
          ..write('category: $category')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, score, category);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HighScore &&
          other.id == this.id &&
          other.score == this.score &&
          other.category == this.category);
}

class HighScoresCompanion extends UpdateCompanion<HighScore> {
  final Value<int> id;
  final Value<int> score;
  final Value<String> category;
  const HighScoresCompanion({
    this.id = const Value.absent(),
    this.score = const Value.absent(),
    this.category = const Value.absent(),
  });
  HighScoresCompanion.insert({
    this.id = const Value.absent(),
    required int score,
    required String category,
  })  : score = Value(score),
        category = Value(category);
  static Insertable<HighScore> custom({
    Expression<int>? id,
    Expression<int>? score,
    Expression<String>? category,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (score != null) 'score': score,
      if (category != null) 'category': category,
    });
  }

  HighScoresCompanion copyWith(
      {Value<int>? id, Value<int>? score, Value<String>? category}) {
    return HighScoresCompanion(
      id: id ?? this.id,
      score: score ?? this.score,
      category: category ?? this.category,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (score.present) {
      map['score'] = Variable<int>(score.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HighScoresCompanion(')
          ..write('id: $id, ')
          ..write('score: $score, ')
          ..write('category: $category')
          ..write(')'))
        .toString();
  }
}

abstract class _$WaktuSejarahHighScoreDatabase extends GeneratedDatabase {
  _$WaktuSejarahHighScoreDatabase(QueryExecutor e) : super(e);
  $WaktuSejarahHighScoreDatabaseManager get managers =>
      $WaktuSejarahHighScoreDatabaseManager(this);
  late final $HighScoresTable highScores = $HighScoresTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [highScores];
}

typedef $$HighScoresTableCreateCompanionBuilder = HighScoresCompanion Function({
  Value<int> id,
  required int score,
  required String category,
});
typedef $$HighScoresTableUpdateCompanionBuilder = HighScoresCompanion Function({
  Value<int> id,
  Value<int> score,
  Value<String> category,
});

class $$HighScoresTableFilterComposer
    extends Composer<_$WaktuSejarahHighScoreDatabase, $HighScoresTable> {
  $$HighScoresTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get score => $composableBuilder(
      column: $table.score, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnFilters(column));
}

class $$HighScoresTableOrderingComposer
    extends Composer<_$WaktuSejarahHighScoreDatabase, $HighScoresTable> {
  $$HighScoresTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get score => $composableBuilder(
      column: $table.score, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnOrderings(column));
}

class $$HighScoresTableAnnotationComposer
    extends Composer<_$WaktuSejarahHighScoreDatabase, $HighScoresTable> {
  $$HighScoresTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get score =>
      $composableBuilder(column: $table.score, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);
}

class $$HighScoresTableTableManager extends RootTableManager<
    _$WaktuSejarahHighScoreDatabase,
    $HighScoresTable,
    HighScore,
    $$HighScoresTableFilterComposer,
    $$HighScoresTableOrderingComposer,
    $$HighScoresTableAnnotationComposer,
    $$HighScoresTableCreateCompanionBuilder,
    $$HighScoresTableUpdateCompanionBuilder,
    (
      HighScore,
      BaseReferences<_$WaktuSejarahHighScoreDatabase, $HighScoresTable,
          HighScore>
    ),
    HighScore,
    PrefetchHooks Function()> {
  $$HighScoresTableTableManager(
      _$WaktuSejarahHighScoreDatabase db, $HighScoresTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HighScoresTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HighScoresTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HighScoresTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> score = const Value.absent(),
            Value<String> category = const Value.absent(),
          }) =>
              HighScoresCompanion(
            id: id,
            score: score,
            category: category,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int score,
            required String category,
          }) =>
              HighScoresCompanion.insert(
            id: id,
            score: score,
            category: category,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$HighScoresTableProcessedTableManager = ProcessedTableManager<
    _$WaktuSejarahHighScoreDatabase,
    $HighScoresTable,
    HighScore,
    $$HighScoresTableFilterComposer,
    $$HighScoresTableOrderingComposer,
    $$HighScoresTableAnnotationComposer,
    $$HighScoresTableCreateCompanionBuilder,
    $$HighScoresTableUpdateCompanionBuilder,
    (
      HighScore,
      BaseReferences<_$WaktuSejarahHighScoreDatabase, $HighScoresTable,
          HighScore>
    ),
    HighScore,
    PrefetchHooks Function()>;

class $WaktuSejarahHighScoreDatabaseManager {
  final _$WaktuSejarahHighScoreDatabase _db;
  $WaktuSejarahHighScoreDatabaseManager(this._db);
  $$HighScoresTableTableManager get highScores =>
      $$HighScoresTableTableManager(_db, _db.highScores);
}
