import 'package:drift/drift.dart';

class HighScores extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get score => integer()();
  TextColumn get category => text()();
}
