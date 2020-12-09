import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:teste_mobile/main.dart';

void main(){

  group('Delete button', (){

    testWidgets('Delete button tap actually deletes class from list', (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());
      // Pump again as now it is built with the streambuilder
      await tester.pump();

      int count = (tester.firstWidget(find.byType(ListView)) as ListView).semanticChildCount;
      await tester.tap(find.byIcon(Icons.delete_outline).first);
      await tester.pump();
      int newCount = (tester.firstWidget(find.byType(ListView)) as ListView).semanticChildCount;

      assert(newCount < count);
      assert(newCount == count - 1);
    });

    testWidgets('Delete button tap deletes correct item', (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());
      // Pump again as now it is built with the streambuilder
      await tester.pump();

      String id = (tester.firstWidget(find.byType(ListTile)) as ListTile).key.toString();
      await tester.tap(find.byIcon(Icons.delete_outline).first);
      await tester.pump();

      expect(find.text(id), findsNothing);
    });

  });
}