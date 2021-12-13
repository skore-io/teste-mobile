import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:skore/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();

  testWidgets('Integration test to user delete one lesson when needs', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    final lessonsTile = find.byKey(const Key('lessonTileWidget'), skipOffstage: false);
    expect(lessonsTile, findsNWidgets(5));

    final deleteButtons = find.byKey(const Key('lessonDeleteButton'));
    expect(deleteButtons, findsWidgets);

    await tester.tap(deleteButtons.first);
    await tester.pumpAndSettle();

    final nowLessonsTile = find.byKey(const Key('lessonTileWidget'), skipOffstage: false);
    expect(nowLessonsTile, findsWidgets);

    expect(nowLessonsTile, findsNWidgets(4));
  });
}
