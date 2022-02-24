import 'package:flutter/material.dart';

import '../../controllers/lessons_list_controller.dart';
import '../../models/lesson_model.dart';
import '../../repositories/lesson_repository_mock.dart';
import '../components/lesson_card_widget.dart';

class LessonsListPage extends StatefulWidget {
  const LessonsListPage({Key? key}) : super(key: key);

  @override
  State<LessonsListPage> createState() => _LessonsListPageState();
}

class _LessonsListPageState extends State<LessonsListPage> {
  final _controller = LessonsListController(LessonRepositoryMock());

  @override
  void initState() {
    super.initState();
    _controller.getLessons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lessons")),
      body: ValueListenableBuilder<List<LessonModel>>(
        valueListenable: _controller.lessons,
        builder: (context, list, child) {
          _controller.sortLessonsByCreatedAt();
          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              return LessonCardWidget(
                lesson: list[index],
                onDelete: () => _controller.deleteLesson(list[index]),
              );
            },
          );
        },
      ),
    );
  }
}
