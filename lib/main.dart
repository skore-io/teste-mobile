import 'package:flutter/material.dart';
import 'package:testemobileskore/pages/principal.dart';
import 'package:testemobileskore/util/resources.dart';

void main() {
  runApp(SkoreApp());
}

class SkoreApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Skore by kaique.dev',
      theme: ThemeData(
        primarySwatch: Resources.customColorSwatch,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: PrincipalPage(),
    );
  }
}
