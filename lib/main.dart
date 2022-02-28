import 'package:flutter/material.dart';
import 'package:flutter_uol_skore_teste/models/aulas_model.dart';
import 'dart:convert';

import 'package:flutter_uol_skore_teste/page/page_aulas.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PageAulas(),
    );
  }
}

