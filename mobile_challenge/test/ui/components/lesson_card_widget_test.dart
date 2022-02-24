import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_challenge/models/lesson_model.dart';
import 'package:mobile_challenge/ui/components/lesson_card_widget.dart';
import 'package:mobile_challenge/utils/lesson_status.dart';

Widget createLessonCardWidget(lesson) =>
    MaterialApp(home: LessonCardWidget(lesson: lesson, onDelete: () {}));

void main() {
  group("Testing LessonCardWidget", () {
    testWidgets(
        "given a completed lesson when lessonCard is created then leadingWidget should be a green check icon",
        (tester) async {
      LessonModel lesson = LessonModel(
        companyId: "114",
        createdAt: 1568918240759,
        name: "Aula Filosofia",
        id: "114_3O81FOuWLZIlSDnRJHm1_349798",
        status: LessonStatus.completed,
        summary: Summary(percentage: 100),
      );

      await tester.pumpWidget(createLessonCardWidget(lesson));
      Key key = Key("leading_widget_${lesson.id}");
      final leadingWidget = find.byKey(key);
      expect(leadingWidget, findsOneWidget);
      expect(leadingWidget.evaluate().single.widget, isA<Icon>());
    });

    testWidgets(
        "given a not started lesson when lessonCard is created then leadingWidget should be a SizedBox",
        (tester) async {
      LessonModel lesson = LessonModel(
        companyId: "114",
        createdAt: 1578343188529,
        name: "Aula Trigonometria",
        id: "114_3Lj7okST2yBSYXUUByg2_349798",
        status: LessonStatus.notStarted,
        summary: Summary(percentage: 0),
      );

      await tester.pumpWidget(createLessonCardWidget(lesson));
      Key key = Key("leading_widget_${lesson.id}");
      final leadingWidget = find.byKey(key);
      expect(leadingWidget, findsOneWidget);
      expect(leadingWidget.evaluate().single.widget, isA<SizedBox>());
    });

    testWidgets(
        "given an in progress lesson when lessonCard is created then leadingWidget should be a progress indicator",
        (tester) async {
      LessonModel lesson = LessonModel(
        companyId: "114",
        createdAt: 1571323199864,
        name: "Aula Álgebra",
        id: "114_0v62DokeArxPA9oDSBst_349785",
        status: LessonStatus.inProgress,
        summary: Summary(percentage: 20),
      );
      await tester.pumpWidget(createLessonCardWidget(lesson));
      final leadingWidget = find.byType(CircularProgressIndicator);
      expect(leadingWidget, findsOneWidget);
    });
  });
}
