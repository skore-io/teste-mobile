import 'package:flutter/material.dart';
import 'package:teste_mobile/src/ui/lesson/lessons.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Teste Mobile',
      theme: ThemeData.dark(),
      home: LessonsPage(),
    );
  }
}
