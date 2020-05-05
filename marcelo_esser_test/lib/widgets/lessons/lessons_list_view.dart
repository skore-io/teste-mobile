import 'package:flutter/material.dart';
import 'package:marcelo_esser_test/model/lesson.dart';
import 'package:marcelo_esser_test/widgets/lessons/lessons_list_view_item.dart';

class LessonsListView extends StatelessWidget {
  final List<Lesson> lessonList;
  final Function(Lesson lesson) onDelete;

  const LessonsListView({@required this.lessonList, @required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final Lesson lesson = lessonList[index];
        return LessonItem(
          onDelete: (lesson) {
            onDelete(lesson);
          },
          lesson: lesson,
        );
      },
      itemCount: lessonList.length,
    );
  }
}
