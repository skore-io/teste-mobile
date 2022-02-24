import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_challenge/ui/pages/lessons_list_page.dart';

Widget createLessonsListPage() => const MaterialApp(
      home: LessonsListPage(),
    );

void main() {
  group("Testing LessonsListPage Widgets", () {
    testWidgets("should remove a lesson when tap on delete button",
        (tester) async {
      await tester.pumpWidget(createLessonsListPage());
      await tester.pumpAndSettle();
      int totalItems = tester.widgetList(find.byIcon(Icons.delete)).length;
      await tester.tap(find.byIcon(Icons.delete).first);
      await tester.pumpAndSettle();
      expect(tester.widgetList(find.byIcon(Icons.delete)).length,
          lessThan(totalItems));
    });
  });
}
