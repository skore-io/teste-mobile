import 'package:flutter/material.dart';
import 'package:skore_mobile_challenge/core/service_locator.dart';
import 'package:skore_mobile_challenge/data/repositories/lesson_repository_impl.dart';
import 'package:skore_mobile_challenge/domain/models/lesson.dart';
import 'package:skore_mobile_challenge/presentation/widgets/lesson_list_item/lesson_list_item.dart';

class LessonList extends StatefulWidget {
  const LessonList({Key? key}) : super(key: key);

  @override
  State<LessonList> createState() => _LessonListState();
}

class _LessonListState extends State<LessonList> {
  final lessonRepository = locator<LessonRepositoryImpl>();

  @override
  void initState() {
    super.initState();
    populateData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: lessonRepository.getLessonList(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final lessonList = snapshot.data as List<Lesson>;

          return ListView.builder(
            shrinkWrap: false,
            itemCount: lessonList.length,
            itemBuilder: (context, index) {
              return LessonListItem(
                lesson: lessonList[index],
                onPressRemoveButton: (id) => removeLesson(id),
              );
            },
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }

  Future<void> populateData() async {
    try {
      await lessonRepository.populateLessonList();
    } catch (error) {
      debugPrint('Error while trying to populate list');
    }

    setState(() {});
  }

  void removeLesson(String id) {
    lessonRepository.removeLesson(id);
    setState(() {});
  }
}
