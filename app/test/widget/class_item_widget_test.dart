import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:teste_mobile/model/class_item_model.dart';
import 'package:teste_mobile/utils/date_functions.dart';
import 'package:teste_mobile/widget/class_item_widget.dart';

void main() {
  testWidgets('Find widgets for status: .inProgress', (tester) async {
    final model = ClassItemModel(
      id: '114_0v62DokeArxPA9oDSBst_349785',
      status: ClassStatus.inProgress,
      name: 'Aula Álgebra',
      companyId: '114',
      createdAt: DateTime.fromMillisecondsSinceEpoch(1571323199864),
      percentage: 20,
    );

    await _createWidget(tester, model: model);

    expect(find.text(model.id), findsOneWidget);
    expect(find.text(model.name), findsOneWidget);
    expect(
      find.text(
        formatDateTimeAsString(
          context: tester.allStates.last.context,
          dateTime: model.createdAt,
        ),
      ),
      findsOneWidget,
    );

    final progressBar = find.byType(LinearProgressIndicator);
    expect(progressBar, findsOneWidget);
    final progressBarWidget = tester.widget<LinearProgressIndicator>(
      progressBar,
    );
    expect(progressBarWidget.value, equals((model.percentage! / 100)));

    expect(find.text('${model.percentage!}%'), findsOneWidget);
  });

  testWidgets('Find widgets for status: .completed', (tester) async {
    final model = ClassItemModel(
      id: '114_0v62DokeArxPA9oDSBst_349785',
      status: ClassStatus.completed,
      name: 'Aula Álgebra',
      companyId: '114',
      createdAt: DateTime.fromMillisecondsSinceEpoch(1571323199864),
      percentage: 100,
    );

    await _createWidget(tester, model: model);

    expect(find.text(model.id), findsOneWidget);
    expect(find.text(model.name), findsOneWidget);
    expect(
      find.text(
        formatDateTimeAsString(
          context: tester.allStates.last.context,
          dateTime: model.createdAt,
        ),
      ),
      findsOneWidget,
    );
    expect(find.byIcon(Icons.check), findsOneWidget);
  });

  testWidgets('Find widgets for status: .notStated', (tester) async {
    final model = ClassItemModel(
      id: '114_0v62DokeArxPA9oDSBst_349785',
      status: ClassStatus.notStated,
      name: 'Aula Álgebra',
      companyId: '114',
      createdAt: DateTime.fromMillisecondsSinceEpoch(1571323199864),
      percentage: 100,
    );

    await _createWidget(tester, model: model);

    expect(find.text(model.id), findsOneWidget);
    expect(find.text(model.name), findsOneWidget);
    expect(
      find.text(
        formatDateTimeAsString(
          context: tester.allStates.last.context,
          dateTime: model.createdAt,
        ),
      ),
      findsOneWidget,
    );
    expect(find.byIcon(Icons.check), findsNothing);
    expect(find.byType(LinearProgressIndicator), findsNothing);
  });

  testWidgets('Test delete button push', (tester) async {
    bool isDeleted = false;

    final model = ClassItemModel(
      id: '114_0v62DokeArxPA9oDSBst_349785',
      status: ClassStatus.notStated,
      name: 'Aula Álgebra',
      companyId: '114',
      createdAt: DateTime.fromMillisecondsSinceEpoch(1571323199864),
      percentage: 100,
    );

    await _createWidget(
      tester,
      model: model,
      onDelete: (_) {
        isDeleted = true;
      },
    );

    final button = find.byKey(Key('Button${model.id}'), skipOffstage: false);

    await tester.ensureVisible(button);
    await tester.pump();
    await tester.tap(button);
    await tester.pump();

    expect(isDeleted, isTrue);
  });
}

Future<void> _createWidget(
  WidgetTester tester, {
  required ClassItemModel model,
  Function(String)? onDelete,
}) async {
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
      home: ClassItemWidget(
        onDelete: onDelete ?? (_) {},
        classModel: model,
      ),
    ),
  );

  await tester.pump();
}
