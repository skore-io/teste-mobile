import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:teste_mobile/cubit/class_list_cubit.dart';
import 'package:teste_mobile/cubit/class_list_state.dart';
import 'package:teste_mobile/model/class_item_model.dart';
import 'package:teste_mobile/page/home_page.dart';
import 'package:teste_mobile/widget/class_item_widget.dart';
import 'package:teste_mobile/widget/loading_widget.dart';

class _MockClassListCubit extends MockCubit<ClassListState>
    implements ClassListCubit {}

late ClassListCubit _cubit;

void main() {
  setUp(() {
    _cubit = _MockClassListCubit();
  });

  setUpAll(() {
    registerFallbackValue(ClassListState.loading());
  });

  testWidgets('Find widget on loading', (tester) async {
    when<ClassListState>(() => _cubit.state).thenReturn(
      ClassListState.loading(),
    );

    await _createWidget(tester);

    expect(find.byType(LoadingWidget), findsOneWidget);
  });

  testWidgets('Find widget on generic error and tap it', (tester) async {
    when<Future<void>>(() => _cubit.loadList()).thenAnswer(
      (_) => Future.value(),
    );

    when<ClassListState>(() => _cubit.state).thenReturn(
      ClassListState.error(),
    );

    await _createWidget(tester);

    final button = find.byKey(HomePage.genericErrorKey);
    expect(button, findsOneWidget);

    await tester.ensureVisible(button);
    await tester.pump();

    await tester.tap(button);
    await tester.pump();

    verify(() => _cubit.loadList()).called(1);
  });

  testWidgets('Find widgets on fetch state', (tester) async {
    final classes = [
      ClassItemModel(
        companyId: '1',
        createdAt: DateTime.now(),
        name: 'Name',
        id: '1',
        status: ClassStatus.inProgress,
        percentage: 51,
      ),
      ClassItemModel(
        companyId: '1',
        createdAt: DateTime.now(),
        name: 'Name 2',
        id: '2',
        status: ClassStatus.inProgress,
        percentage: 34,
      ),
    ];

    when<ClassListState>(() => _cubit.state).thenReturn(
      ClassListState.fetched(classes: classes),
    );

    await _createWidget(tester);

    expect(find.text('Aulas'), findsOneWidget);
    expect(find.byType(ClassItemWidget), findsNWidgets(classes.length));
  });

  testWidgets('Find snackbar when class has been deleted', (tester) async {
    final states = StreamController<ClassListState>();

    final classes = [
      ClassItemModel(
        companyId: '1',
        createdAt: DateTime.now(),
        name: 'Name',
        id: '1',
        status: ClassStatus.inProgress,
        percentage: 51,
      ),
      ClassItemModel(
        companyId: '1',
        createdAt: DateTime.now(),
        name: 'Name 2',
        id: '2',
        status: ClassStatus.inProgress,
        percentage: 34,
      ),
    ];

    whenListen<ClassListState>(
      _cubit,
      states.stream,
      initialState: ClassListState.fetched(classes: classes),
    );

    await _createWidget(tester);

    states.add(
      ClassListState.deletedItem(classes: classes..removeAt(1)),
    );
    await tester.pump();
    await tester.pump();

    expect(find.text('Aula excluída!'), findsOneWidget);
    expect(find.byType(SnackBar), findsOneWidget);
  });
}

Future<void> _createWidget(WidgetTester tester) async {
  await tester.pumpWidget(
    MaterialApp(
      supportedLocales: const [
        Locale('pt', 'BR'),
      ],
      locale: const Locale('pt', 'BR'),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: BlocProvider<ClassListCubit>.value(
        value: _cubit,
        child: const HomePage(),
      ),
    ),
  );

  await tester.pump();
}
