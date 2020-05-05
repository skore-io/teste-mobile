import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:marcelo_esser_test/main.dart';
import 'package:marcelo_esser_test/model/lesson.dart';
import 'package:marcelo_esser_test/scenes/lessons/lessons_bloc.dart';
import 'package:marcelo_esser_test/scenes/lessons/lessons_screen.dart';
import 'package:marcelo_esser_test/widgets/dialogs/delete_lesson_dialog.dart';
import 'package:marcelo_esser_test/widgets/lessons/lessons_list_view_item.dart';
import 'package:mockito/mockito.dart';

import '../mocks/lessons_mock.dart';

void main() {
  testWidgets('Should show the lessons list when the screen is opended',
      (tester) async {
    final mockDao = LessonsDaoMock();
    final mockWebClient = LessonsWebClientMock();

    await tester.pumpWidget(MyApp(
      dao: mockDao,
      webClient: mockWebClient,
    ));

    final lessonScreen = find.byType(LessonsScreen);

    final LessonsBloc lessonBloc = BlocProvider.getBloc();

    ///mocking lessons on stream
    lessonBloc.inLessons.add(lessons());
    print(lessonBloc.hashCode);

    await tester.pumpAndSettle();

    ///finding the lessons_screen (confirming that it is already on the screen)
    print('lesson screen hash ${lessonScreen.hashCode}');
    expect(lessonScreen, findsOneWidget);

    ///checking if getAllLessons() is called
    verify(await mockWebClient.getAllLessons());

    ///checking if getAllLessons() is called
    verify(await mockDao.findAll());

    ///finding the "Aula Filosofia" item to delete it
    final lessonItem = find.byWidgetPredicate((widget) {
      if (widget is LessonItem) {
        return widget.lesson.id == '114_3O81FOuWLZIlSDnRJHm1_349798' &&
            widget.lesson.name == 'Aula Filosofia';
      }
      return false;
    });

    expect(lessonItem, findsOneWidget);

    final deleteItemButton = find.byKey(Key('114_3O81FOuWLZIlSDnRJHm1_349798'));
    expect(deleteItemButton, findsOneWidget);

    ///taping o delete button to realize the action
    await tester.tap(deleteItemButton);

    await tester.pumpAndSettle();

    ///checking if the delete dialgo is on screen
    final transactionAuthDialog = find.byType(DeleteLessonDialog);
    expect(transactionAuthDialog, findsOneWidget);

    final deleteButton = find.widgetWithText(FlatButton, 'Delete');
    expect(deleteButton, findsOneWidget);

    ///taping o delete button to realize the action
    await tester.tap(deleteButton);

    ///mocking lessons on stream
    lessonBloc.inLessons.add(lessons());

    await tester.pumpAndSettle();

    ///checking if the delete action is being performed
    verify(await mockDao.deleteLessonBy(id: '114_3O81FOuWLZIlSDnRJHm1_349798'));

    ///checking if the delete action is being performed after the delete action
    ///to show the list without that item
    verify(await mockDao.findAll());

    ///checking if returned to the lessons screen
    expect(lessonScreen, findsOneWidget);
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
