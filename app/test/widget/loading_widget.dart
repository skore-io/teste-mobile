import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:teste_mobile/widget/loading_widget.dart';

void main() {
  testWidgets('Find widgets', (tester) async {
    await _createWidget(tester);

    expect(find.text('Aulas'), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}

Future<void> _createWidget(WidgetTester tester) async {
  await tester.pumpWidget(
    const MaterialApp(
      supportedLocales: [
        Locale('pt', 'BR'),
      ],
      locale: Locale('pt', 'BR'),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: LoadingWidget(),
    ),
  );

  await tester.pump();
}
