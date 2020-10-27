import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:class_planner/bloc/class_bloc.dart';
import 'package:class_planner/view/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        blocs: [Bloc((i) => ClassBloc())],
        child: MaterialApp(
          title: 'Class Planner',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: Home(),
        ));
  }
}
