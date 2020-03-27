import 'package:flutter/widgets.dart';
import 'package:teste_mobile/src/model/lesson.dart';
import 'package:teste_mobile/src/repository/lesson_repository.dart';

class LessonProvider with ChangeNotifier {
  List<Lesson> _lessons;

  LessonProvider() {
    _lessons =
        List<Lesson>.from(data.map((item) => Lesson.fromJson(item)).toList());
    _lessons.sort((a, b) => a.createdAt.compareTo(b.createdAt));
  }

  List<Lesson> get lesson => _lessons;

  void removeLesson(Lesson lesson) {
    _lessons.remove(lesson);
    notifyListeners();
  }
}
