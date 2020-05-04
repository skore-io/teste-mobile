import 'package:flutter/material.dart';
import 'package:marcelo_esser_test/model/lesson.dart';
import 'package:marcelo_esser_test/model/summary.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

const _summaryTableName = 'summaryTable';
const _lessonTableName = 'lessonTable';

const _lessonId = 'id';
const _lessonName = 'name';
const _lessonStatus = 'status';
const _lessonCompanyId = 'companyid';
const _lessonCreatedAt = 'createdat';
const _summaryKey = 'summarykey';
const _summaryId = 'summaryid';
const _summaryPercentage = 'summarypercentage';

class LessonsDao {
  static const String _lessonTable = 'CREATE TABLE $_lessonTableName ('
      '$_lessonId TEXT PRIMARY KEY, '
      '$_lessonName TEXT, '
      '$_lessonCompanyId TEXT,'
      '$_lessonStatus TEXT,'
      '$_lessonCreatedAt INTEGER,'
      '$_summaryKey INTEGER,'
      'FOREIGN KEY($_summaryKey) REFERENCES $_summaryTableName($_summaryId))';

  static const String _summaryTable = 'CREATE TABLE $_summaryTableName ('
      '$_summaryId INTEGER PRIMARY KEY AUTOINCREMENT,'
      '$_summaryPercentage INTEGER)';

  Future<Database> createDatabase() async {
    final String path = join(await getDatabasesPath(), 'skoremobiletest.db');

    return openDatabase(path, onCreate: (db, version) async {
      await db.execute(LessonsDao._summaryTable);
      db.execute(LessonsDao._lessonTable);
    }, version: 1, onDowngrade: onDatabaseDowngradeDelete);
  }

  Future<int> saveLesson(Lesson lesson) async {
    final Database db = await createDatabase();

    final Map<String, dynamic> lessonMap = Map();

    final int summaryRow = await _saveSummary(lesson.summary, db);

    final List<Map<String, dynamic>> result =
        await db.query('$_summaryTableName');

    final summaryObj = result[summaryRow - 1];

    lessonMap[_lessonId] = lesson.id.toString();
    lessonMap[_lessonName] = lesson.name.toString();
    lessonMap[_lessonCompanyId] = lesson.companyId;
    lessonMap[_lessonStatus] = lesson.status;
    lessonMap[_lessonCreatedAt] = lesson.createdAt;
    lessonMap[_summaryKey] = summaryObj[_summaryId];

    return db.insert(_lessonTableName, lessonMap);
  }

  /// Saving the summary and returning their position at table
  Future<int> _saveSummary(Summary summary, Database db) async {
    final Map<String, dynamic> summaryMap = Map();
    summaryMap[_summaryPercentage] = summary.percentage;
    return db.insert(_summaryTableName, summaryMap);
  }

  Future<List<Lesson>> findAll() async {
    final Database db = await createDatabase();

    final List<Summary> summaries = await _findAllSummaries(db);

    final List<Map<String, dynamic>> result = await db.query(_lessonTableName);

    final List<Lesson> lessons = [];

    for (Map<String, dynamic> row in result) {
      lessons.add(
        Lesson(
            row[_lessonCompanyId],
            row[_lessonCreatedAt],
            row[_lessonName],
            row[_lessonId],
            row[_lessonStatus],
            summaries.firstWhere((element) => element.id == row[_summaryKey]),
            row[_summaryKey]),
      );
    }

    return lessons;
  }

  Future<int> deleteLessonBy({@required String id}) async {
    final Database db = await createDatabase();

    return await db.delete(
      _lessonTableName,
      where: '$_lessonId = ?',
      whereArgs: [id],
    );
  }

  Future<List<Summary>> _findAllSummaries(Database db) async {
    final List<Map<String, dynamic>> result = await db.query(_summaryTableName);
    List<Summary> summaries = [];
    for (var value in result) {
      final percentage = value[_summaryPercentage];

      summaries.add(
        Summary(
          percentage: percentage,
          id: value[_summaryId],
        ),
      );
    }

    return summaries;
  }
}
