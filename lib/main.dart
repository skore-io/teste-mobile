import 'package:flutter/material.dart';
import 'package:teste_mobile/modules/home/view/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Classes List',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomePage(title: 'My classes list'),
    );
  }
}
