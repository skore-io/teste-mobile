import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/lesson_model.dart';
import 'lesson_repository.dart';

class LessonRepositoryMock implements LessonRepository {
  @override
  Future<List<LessonModel>> getLessons() async {
    var value = await rootBundle.loadString('assets/lessons.json');
    List json = jsonDecode(value);

    return json.map((e) => LessonModel.fromJson(e)).toList();
  }
}
