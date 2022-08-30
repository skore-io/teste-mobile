import 'package:skore_mobile_challenge/domain/models/lesson.dart';

abstract class LessonRepository {
  Future<List<Lesson>> populateLessonList();
  Future<List<Lesson>> getLessonList();
  Future removeLesson(String id);
}
