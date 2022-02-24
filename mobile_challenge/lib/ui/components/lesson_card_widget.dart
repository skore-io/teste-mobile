import 'package:flutter/material.dart';
import 'package:mobile_challenge/utils/lesson_status.dart';

import '../../models/lesson_model.dart';

class LessonCardWidget extends StatelessWidget {
  final LessonModel lesson;
  final VoidCallback onDelete;

  const LessonCardWidget({
    Key? key,
    required this.lesson,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(lesson.name.toString()),
        subtitle: Text("${lesson.dateFormated}\n${lesson.id.toString()}"),
        leading: _buildLeadingIcon(),
        isThreeLine: true,
        trailing: IconButton(
          onPressed: onDelete,
          icon: const Icon(Icons.delete),
        ),
      ),
    );
  }

  Widget _buildLeadingIcon() {
    Widget leading;
    Key key = Key("leading_widget_${lesson.id}");
    if (lesson.status == LessonStatus.completed) {
      leading = Icon(
        Icons.check,
        key: key,
        color: Colors.green,
      );
    } else if (lesson.status == LessonStatus.inProgress) {
      leading = Stack(
        key: key,
        children: [
          CircularProgressIndicator(value: lesson.summary.percentage! / 100.0),
          Positioned(
            top: 10,
            left: 5,
            child: Text(
              "${lesson.summary.percentage!}%",
              style: const TextStyle(fontSize: 10),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      );
    } else {
      leading = SizedBox(key: key);
    }
    return leading;
  }
}
