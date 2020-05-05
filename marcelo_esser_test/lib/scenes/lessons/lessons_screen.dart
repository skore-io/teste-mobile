import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:marcelo_esser_test/model/lesson.dart';
import 'package:marcelo_esser_test/widgets/centerd_loader.dart';
import 'package:marcelo_esser_test/widgets/dialogs/delete_lesson_dialog.dart';
import 'package:marcelo_esser_test/widgets/lessons/lessons_list_view.dart';

import 'lessons_bloc.dart';

class LessonsScreen extends StatefulWidget {
  @override
  _LessonsScreenState createState() => _LessonsScreenState();
}

class _LessonsScreenState extends State<LessonsScreen> {
  @override
  Widget build(BuildContext context) {
    final LessonsBloc lessonsBloc = BlocProvider.getBloc();
    lessonsBloc.getAndSaveAllLessons();

    return Scaffold(
      appBar: AppBar(
        title: Text('Lessons'),
      ),
      body: StreamBuilder<List<Lesson>>(
        initialData: List(),
        stream: lessonsBloc.outLessons,
        builder: (context, snapshot) {
          final List<Lesson> lessonList = snapshot.data;
          print(snapshot.connectionState);
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Center(
                child: CenteredLoader(),
              );
              break;
            case ConnectionState.active:
            case ConnectionState.done:
              if (lessonList.isNotEmpty) {
                return LessonsListView(
                  lessonList: lessonList,
                  onDelete: (lesson) {
                    delete(lesson, context, lessonsBloc);
                  },
                );
              } else {
                return Center(
                  child: Text(
                    'Não á itens na lista',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                );
              }
              break;
          }
          return Text('Unknown error');
        },
      ),
    );
  }

  delete(Lesson lesson, BuildContext context, LessonsBloc bloc) async {
    await showDialog(
        context: context,
        builder: (contextDialog) {
          return DeleteLessonDialog(
            lesson: lesson,
            onConfirm: () {
              bloc.delete(lesson.id);
            },
          );
        });
  }
}
