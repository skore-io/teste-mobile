import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:marcelo_esser_test/main.dart';
import 'package:marcelo_esser_test/model/lesson.dart';
import 'package:marcelo_esser_test/scenes/lessons/lessons_bloc.dart';
import 'package:marcelo_esser_test/scenes/lessons/lessons_screen.dart';
import 'package:marcelo_esser_test/widgets/lessons/lessons_list_view_item.dart';

import '../mocks/lessons_mock.dart';

void main() {
  testWidgets('Should display the lessons screen when MyApp is loaded',
      (tester) async {
    final mockDao = LessonsDaoMock();
    final mockWebClient = LessonsWebClientMock();

    await tester.pumpWidget(MyApp(
      dao: mockDao,
      webClient: mockWebClient,
    ));

    final lessonScreen = find.byType(LessonsScreen);

    expect(lessonScreen, findsOneWidget);
  });

  testWidgets('Should find the "Aula Filosofia" lesson when the list is showed',
      (tester) async {
    final mockDao = LessonsDaoMock();
    final mockWebClient = LessonsWebClientMock();

    await tester.pumpWidget(
      MyApp(
        dao: mockDao,
        webClient: mockWebClient,
      ),
    );

    ///mocking lessons on stream
    final LessonsBloc lessonBloc = BlocProvider.getBloc();
    lessonBloc.inLessons.add(lessons());

    await tester.pumpAndSettle();

    final findPhilosophyClass = find.byWidgetPredicate((widget) {
      if (widget is LessonItem) {
        return widget.lesson.name == "Aula Filosofia" &&
            widget.lesson.id == "114_3O81FOuWLZIlSDnRJHm1_349798";
      }
      return false;
    });

    expect(findPhilosophyClass, findsOneWidget);
  });
}

List<Lesson> lessons() {
  return [
    Lesson.fromJson({
      "company_id": "114",
      "created_at": 1571323199864,
      "name": "Aula Álgebra",
      "id": "114_0v62DokeArxPA9oDSBst_349785",
      "status": "IN_PROGRESS",
      "summary": {"percentage": 20}
    }),
    Lesson.fromJson({
      "company_id": "114",
      "created_at": 1578343188529,
      "name": "Aula Trigonometria",
      "id": "114_3Lj7okST2yBSYXUUByg2_349798",
      "status": "NOT_STARTED",
      "summary": {"percentage": null}
    }),
    Lesson.fromJson({
      "company_id": "114",
      "created_at": 1568918240759,
      "name": "Aula Filosofia",
      "id": "114_3O81FOuWLZIlSDnRJHm1_349798",
      "status": "COMPLETED",
      "summary": {"percentage": 100}
    }),
    Lesson.fromJson({
      "company_id": "114",
      "created_at": 1574361972593,
      "name": "Aula Geografia",
      "id": "114_46keopvfEUvlNP7bd049_349798",
      "status": "IN_PROGRESS",
      "summary": {"percentage": 75}
    }),
    Lesson.fromJson({
      "company_id": "114",
      "created_at": 1571946887159,
      "name": "Aula História",
      "id": "114_5FK4ExJCz3vW4XmS0KVr_349798",
      "status": "NOT_STARTED",
      "summary": {"percentage": null}
    })
  ];
}
