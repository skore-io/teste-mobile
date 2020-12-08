import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:teste_mobile/blocs/classes_bloc.dart';
import 'package:teste_mobile/constants/ui.dart';
import 'package:teste_mobile/models/class.dart';
import 'package:teste_mobile/screens/widgets/class_card.dart';
import 'package:teste_mobile/screens/widgets/progress.dart';

void main(){
  group('Progress', (){
    testWidgets('Progress bar widget when progess is null', (WidgetTester tester) async {
      await tester.pumpWidget(Progress());
      expect(find.byType(Container), findsOneWidget);
      expect(find.byType(Stack), findsNothing);
      expect(find.byType(CustomPaint), findsNothing);
    });
    testWidgets('Progress bar widget when progess is not null', (WidgetTester tester) async {
      await tester.pumpWidget(
        Directionality(
          textDirection: TextDirection.ltr,
          child: Progress(progress: 20,),
        ),
      );
      expect(find.byType(Container), findsNothing);
      expect(find.byType(Stack), findsOneWidget);
      expect(find.byType(CustomPaint), findsOneWidget);
    });
    testWidgets('Progress bar text when progess is not null', (WidgetTester tester) async {
      await tester.pumpWidget(
        Directionality(
          textDirection: TextDirection.ltr,
          child: Progress(progress: 20,),
        ),
      );
      expect(find.text('20%'), findsOneWidget);
    });
  });

  group('ClassCard', (){

    testWidgets('ClassCard has name, date and id', (WidgetTester tester) async {
      final classInfo = Class(
        companyId: '',
        createdAt: 1607452772000,
        name: 'Aula Flutter',
        id: 'class_id_123',
        status: Status.NOT_STARTED,
        summary: Summary(
          percentage: null
        )
      );
      await tester.pumpWidget(
        BlocProvider(
          bloc: ClassesBloc(),
          child: MaterialApp(
            home: ClassCard(classInfo: classInfo,),
          ),
        ),
      );
      // Has class name
      expect(find.text('Aula Flutter'), findsOneWidget);
      // Has date in the format "dd/MM/yyyy
      expect(find.text('08/12/2020'), findsOneWidget);
      // Has the class id
      expect(find.text('class_id_123'), findsOneWidget);
    });

    testWidgets('ClassCard widget when completed', (WidgetTester tester) async {
      final classInfo = Class(
          companyId: '',
          createdAt: 1607452772000,
          name: 'Aula Flutter',
          id: 'class_id_123',
          status: Status.COMPLETED,
          summary: Summary(
              percentage: 100
          )
      );
      await tester.pumpWidget(
        BlocProvider(
          bloc: ClassesBloc(),
          child: MaterialApp(
            home: ClassCard(classInfo: classInfo,)
          )
        )
      );
      // Has a check icon
      expect(find.byIcon(Icons.check), findsOneWidget);
      // Check icon is green
      expect((tester.firstWidget(find.byIcon(Icons.check)) as Icon).color, primary);
      // Has not Progress widget
      expect(find.byType(Progress), findsNothing);
    });

    testWidgets('ClassCard widget when not started', (WidgetTester tester) async {
      final classInfo = Class(
        companyId: '',
        createdAt: 1607452772000,
        name: 'Aula Flutter',
        id: 'class_id_123',
        status: Status.NOT_STARTED,
        summary: Summary(
          percentage: null
        )
      );
      await tester.pumpWidget(
        BlocProvider(
          bloc: ClassesBloc(),
          child: MaterialApp(
            home: ClassCard(classInfo: classInfo,),
          )
        )
      );
      // Has no icon
      expect(find.byIcon(Icons.check), findsNothing);
      // Has no progress
      expect(find.byType(Progress), findsNothing);
    });

    testWidgets('ClassCard widget when in progress', (WidgetTester tester) async {
      final classInfo = Class(
        companyId: '',
        createdAt: 1607452772000,
        name: 'Aula Flutter',
        id: 'class_id_123',
        status: Status.IN_PROGRESS,
        summary: Summary(
          percentage: 20
        )
      );
      await tester.pumpWidget(
        BlocProvider(
          bloc: ClassesBloc(),
          child: MaterialApp(
            home: ClassCard(classInfo: classInfo,),
          ),
        ),
      );
      // Has progress
      expect(find.byType(Progress), findsOneWidget);
      // Has a text with the progress
      expect(find.text('20%'), findsOneWidget);
      // Has no icon
      expect(find.byIcon(Icons.check), findsNothing);
    });

    testWidgets('Has a button to delete a class', (WidgetTester tester) async {
      final classInfo = Class(
          companyId: '',
          createdAt: 1607452772000,
          name: 'Aula Flutter',
          id: 'class_id_123',
          status: Status.IN_PROGRESS,
          summary: Summary(
              percentage: 20
          )
      );
      await tester.pumpWidget(
          BlocProvider(
            bloc: ClassesBloc(),
            child: MaterialApp (
              home: ClassCard(classInfo: classInfo,)
            )
          )
      );
      // Has an icon button
      expect(find.byType(IconButton), findsOneWidget);
      // Icon button has an icon delete_outline
      expect(find.byIcon(Icons.delete_outline), findsOneWidget);
    });

  });
}