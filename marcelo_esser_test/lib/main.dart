import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:marcelo_esser_test/http/services/lessons_services.dart';
import 'package:marcelo_esser_test/scenes/lessons/lessons_bloc.dart';
import 'package:marcelo_esser_test/scenes/lessons/lessons_screen.dart';

import 'dao/lessons_dao.dart';

void main() {
  runApp(MyApp(
    dao: LessonsDao(),
    webClient: LessonsWebClient(),
  ));
}

class MyApp extends StatelessWidget {
  final LessonsDao dao;
  final LessonsWebClient webClient;

  const MyApp({@required this.dao, @required this.webClient});

  @override
  Widget build(BuildContext context) {
    final List<Bloc> blocs = List();
    final Bloc<LessonsBloc> lessonsBloc = new Bloc<LessonsBloc>((value) {
      return LessonsBloc(webClient: webClient, dao: dao);
    });
    blocs.add(lessonsBloc);

    return BlocProvider(
      blocs: blocs,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LessonsScreen(),
      ),
    );
  }
}
