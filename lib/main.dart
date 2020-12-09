import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:teste_mobile/blocs/classes_bloc.dart';
import 'package:teste_mobile/screens/class_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Aulas',
      home: BlocProvider<ClassesBloc>(
        bloc: ClassesBloc(),
        child: ClassListScreen(),
      ),
    );
  }
}

