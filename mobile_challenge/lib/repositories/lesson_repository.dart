import '../models/lesson_model.dart';

abstract class LessonRepository {
  Future<List<LessonModel>> getLessons();
}
