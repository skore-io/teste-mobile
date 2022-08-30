import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:skore_mobile_challenge/data/data_sources/lesson_data_source.dart';
import 'package:skore_mobile_challenge/domain/models/lesson.dart';
import 'package:skore_mobile_challenge/domain/repositories/lesson_repository.dart';

class LessonRepositoryImpl implements LessonRepository {
  final LessonDataSource dataSource;

  List<Lesson> lessonList = List.empty();

  LessonRepositoryImpl({required this.dataSource});

  @override
  Future<List<Lesson>> populateLessonList() async {
    debugPrint('Populated lesson list...');
    final jsonData = await dataSource.loadJsonFile();
    final decodedJsonData = json.decode(jsonData);
    lessonList = List<Lesson>.from(decodedJsonData.map((l) => Lesson.fromJson(l)));

    lessonList.sort((a, b) => a.createdAt.compareTo(b.createdAt));

    return lessonList;
  }

  @override
  Future<List<Lesson>> getLessonList() async => lessonList;

  @override
  Future removeLesson(String id) async {
    debugPrint('Removing lesson with id: $id');
    lessonList.removeWhere((element) => element.id == id);
  }
}
