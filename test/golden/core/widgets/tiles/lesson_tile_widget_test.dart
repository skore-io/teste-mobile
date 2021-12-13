import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:skore/core/widgets/tiles/lesson_tile_widget.dart';
import 'package:skore/domain/enums/lesson_status.dart';
import 'package:skore/domain/models/lesson_model.dart';
import 'package:skore/domain/models/summary_model.dart';

void main() {
  testGoldens('LessonTileWidget - Multiples Scenarios', (WidgetTester tester) async {
    final tileInProgress = LessonModel('A', LessonStatus.notStarted, SummaryModel(), DateTime.now());
    final tileInNotStarted = LessonModel('A', LessonStatus.notStarted, SummaryModel(), DateTime.now());
    final tileInCompleted = LessonModel('A', LessonStatus.completed, SummaryModel(), DateTime.now());

    final builder = GoldenBuilder.column()
      ..addScenario('IN_PROGRESS', LessonTileWidget(lessonModel: tileInProgress, onDelete: () {}))
      ..addScenario('NOT_STARTED', LessonTileWidget(lessonModel: tileInNotStarted, onDelete: () {}))
      ..addScenario('COMPLETED', LessonTileWidget(lessonModel: tileInCompleted, onDelete: () {}));

    await tester.pumpWidgetBuilder(builder.build(), surfaceSize: const Size(500, 600));
    await screenMatchesGolden(tester, 'lesson_tile_widget_mutiples_states');
  });
}
