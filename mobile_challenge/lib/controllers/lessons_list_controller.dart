import 'package:flutter/foundation.dart';

import '../models/lesson_model.dart';
import '../repositories/lesson_repository.dart';

class LessonsListController extends ChangeNotifier {
  final LessonRepository _lessonRepository;

  LessonsListController(this._lessonRepository);

  ValueNotifier<List<LessonModel>> lessons =
      ValueNotifier<List<LessonModel>>([]);

  Future<void> getLessons() async {
    lessons.value = await _lessonRepository.getLessons();
  }

  void sortLessonsByCreatedAt() {
    lessons.value.sort((a, b) => a.createdAt.compareTo(b.createdAt));
    notifyListeners();
  }

  void deleteLesson(LessonModel lesson) {
    lessons.value.remove(lesson);
    lessons.notifyListeners();
  }
}
