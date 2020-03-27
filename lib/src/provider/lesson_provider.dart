import 'package:flutter/widgets.dart';
import 'package:teste_mobile/src/model/lesson.dart';
import 'package:teste_mobile/src/repository/lesson_repository.dart';

class LessonProvider with ChangeNotifier {
  Lesson _lesson;

  LessonProvider() : _lesson = Lesson.fromJson(data);

  get lesson => lesson;
}
