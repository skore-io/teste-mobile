import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:skore/core/widgets/tiles/lesson_tile_widget.dart';
import 'package:skore/domain/enums/lesson_status.dart';
import 'package:skore/domain/models/lesson_model.dart';
import 'package:skore/domain/models/summary_model.dart';

void main() {
  testWidgets('Should show name/creation/date/id of lesson when the user wants to see the list', (
    WidgetTester tester,
  ) async {
    final lessonModel = LessonModel('A', LessonStatus.notStarted, SummaryModel(), DateTime.now());

    await tester.pumpWidget(
      MaterialApp(
        home: LessonTileWidget(
          lessonModel: lessonModel,
          onDelete: () {},
        ),
      ),
    );

    expect(find.byKey(const Key('lessonName')), findsOneWidget);
  });

  testWidgets('Should show just done icon when the lesson is completed', (
    WidgetTester tester,
  ) async {
    final lessonModel = LessonModel('A', LessonStatus.completed, SummaryModel(), DateTime.now());

    await tester.pumpWidget(
      MaterialApp(
        home: LessonTileWidget(
          lessonModel: lessonModel,
          onDelete: () {},
        ),
      ),
    );

    final doneIcon = find.byKey(const Key('lessonDone'));
    final progressBar = find.byKey(const Key('lessonProgressBar'));

    expect(doneIcon, findsOneWidget);
    expect(progressBar, findsNothing);
  });

  testWidgets('Should show progress bar when the lesson is in progress', (
    WidgetTester tester,
  ) async {
    final lessonModel = LessonModel('A', LessonStatus.inProgress, SummaryModel(percentage: 80), DateTime.now());

    await tester.pumpWidget(
      MaterialApp(
        home: LessonTileWidget(
          lessonModel: lessonModel,
          onDelete: () {},
        ),
      ),
    );

    final doneIcon = find.byKey(const Key('lessonDone'));
    final progressBar = find.byKey(const Key('lessonProgressBar'));

    expect(doneIcon, findsNothing);
    expect(progressBar, findsOneWidget);
  });

  testWidgets('Should show nothing when the lesson is not started', (
    WidgetTester tester,
  ) async {
    final lessonModel = LessonModel('A', LessonStatus.notStarted, SummaryModel(), DateTime.now());

    await tester.pumpWidget(
      MaterialApp(
        home: LessonTileWidget(
          lessonModel: lessonModel,
          onDelete: () {},
        ),
      ),
    );

    final doneIcon = find.byKey(const Key('lessonDone'));
    final progressBar = find.byKey(const Key('lessonProgressBar'));

    expect(doneIcon, findsNothing);
    expect(progressBar, findsNothing);
  });
}
