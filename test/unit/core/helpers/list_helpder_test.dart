import 'package:flutter_test/flutter_test.dart';
import 'package:skore/core/helpers/list_helpder.dart';
import 'package:skore/domain/enums/lesson_status.dart';
import 'package:skore/domain/models/lesson_model.dart';
import 'package:skore/domain/models/summary_model.dart';

void main() {
  group('Group of tests for list helper', () {
    test('Should return a sorted list by date when the user want to see the classes', () {
      final list = [
        LessonModel('A', LessonStatus.notStarted, SummaryModel(), DateTime.now().add(const Duration(seconds: 5))),
        LessonModel('B', LessonStatus.notStarted, SummaryModel(), DateTime.now()),
      ];

      final result = ListHelper.sortByDate(list);

      expect(result.first.name, 'B');
      expect(result.last.name, 'A');
    });
  });
}
