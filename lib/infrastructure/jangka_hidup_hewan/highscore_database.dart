import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'highscore_table.dart';

part 'highscore_database.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file =
        File(p.join(dbFolder.path, 'highscoreJangkaHidupHewan.sqlite'));
    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [HighScores])
class JangkaHidupHewanHighScoreDatabase
    extends _$JangkaHidupHewanHighScoreDatabase {
  JangkaHidupHewanHighScoreDatabase._internal() : super(_openConnection());

  static final JangkaHidupHewanHighScoreDatabase _instance =
      JangkaHidupHewanHighScoreDatabase._internal();

  factory JangkaHidupHewanHighScoreDatabase() => _instance;

  @override
  int get schemaVersion => 3;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onUpgrade: (migrator, from, to) async {
          if (from == 1) {
            // Tambahkan kolom 'category' dengan nilai default
            await migrator.addColumn(
              highScores,
              highScores.category,
            );

            // Isi nilai default untuk kolom 'category' di semua baris
            await customStatement(
              "UPDATE high_scores SET category = 'tinggi_hewan'",
            );
          }
        },
      );
  Future<List<HighScore>> getHighScores(String category) async {
    return (select(highScores)
          ..where((tbl) => tbl.category.equals(category))
          ..orderBy([(t) => OrderingTerm.desc(t.score)]))
        .get();
  }

  Future<void> addScore(String category, int score) async {
    into(highScores).insert(
      HighScoresCompanion(
        category: Value(category),
        score: Value(score),
      ),
    );
  }
}
