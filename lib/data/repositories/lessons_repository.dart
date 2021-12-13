import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

import 'package:skore/data/serializers/lesson_serializer.dart';
import 'package:skore/domain/models/lesson_model.dart';
import 'package:skore/domain/transients/lessons_store.dart';

abstract class ILessonsRepository {
  Future<List<LessonModel>> fetchAllLessons();
  Future<List<LessonModel>> deleteLesson(String id);
}

@Injectable(as: ILessonsRepository)
class LessonsRepositoryImpl implements ILessonsRepository {
  final LessonsStore lessonsStore;

  LessonsRepositoryImpl({
    required this.lessonsStore,
  });

  @override
  Future<List<LessonModel>> fetchAllLessons() async {
    await Future.delayed(const Duration(seconds: 1));

    final result = json.decode(await rootBundle.loadString('assets/skore_mock.json'));

    return result.map((lesson) => LessonSerializer.fromMap(lesson)).toList().cast<LessonModel>();
  }

  @override
  Future<List<LessonModel>> deleteLesson(String id) async {
    //trash code, API DELETE
    await Future.delayed(const Duration(seconds: 1));

    return lessonsStore.lessonsList..removeWhere((lesson) => lesson.id == id);
  }
}
