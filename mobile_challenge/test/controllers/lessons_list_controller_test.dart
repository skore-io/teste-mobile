import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_challenge/controllers/lessons_list_controller.dart';
import 'package:mobile_challenge/models/lesson_model.dart';
import 'package:mobile_challenge/repositories/lesson_repository_mock.dart';
import 'package:mobile_challenge/utils/lessons_mocked_list.dart';

void main() async {
  group("Testing LessonsListController", () {
    test("should remove a lesson from the list", () {
      final controller = LessonsListController(LessonRepositoryMock());
      controller.lessons.value = lessonsList;
      LessonModel lesson = lessonsList[0].copyWith();
      controller.deleteLesson(lesson);
      expect(controller.lessons.value.contains(lesson), isFalse);
    });
  });
}
