import 'package:flutter/material.dart';
import 'package:marcelo_esser_test/model/lesson.dart';
import 'package:marcelo_esser_test/scenes/lessons/lessons_bloc.dart';
import 'package:marcelo_esser_test/widgets/lessons/lessons_list_view_item.dart';

class LessonsListView extends StatelessWidget {
  final List<Lesson> lessonList;
  final LessonsBloc lessonsBloc;

  const LessonsListView({
    @required this.lessonList,
    @required this.lessonsBloc,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final Lesson lesson = lessonList[index];
        return LessonItem(
          lesson: lesson,
          onDelete: () {
            lessonsBloc.delete(lesson.id);
          },
        );
      },
      itemCount: lessonList.length,
    );
  }
}
