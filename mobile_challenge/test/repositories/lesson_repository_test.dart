import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_challenge/models/lesson_model.dart';
import 'package:mobile_challenge/repositories/lesson_repository.dart';
import 'package:mobile_challenge/utils/lessons_mocked_list.dart';
import 'package:mocktail/mocktail.dart';

class LessonRepositoryImpl extends Mock implements LessonRepository {}

void main() {
  LessonRepositoryImpl lessonRepository = LessonRepositoryImpl();
  group("Testing LessonRepository", () {
    test("should return a lessons list", () async {
      when(() => lessonRepository.getLessons())
          .thenAnswer((_) async => lessonsList);
      final lessons = await lessonRepository.getLessons();

      expect(lessons, isNotEmpty);
      expect(lessons, isA<List<LessonModel>>());
    });
  });
}
