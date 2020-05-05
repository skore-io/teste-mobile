import 'package:flutter/material.dart';
import 'package:marcelo_esser_test/model/lesson.dart';

class DeleteLessonDialog extends StatelessWidget {
  final Function() onConfirm;
  final Lesson lesson;

  const DeleteLessonDialog({@required this.lesson, @required this.onConfirm});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Alert'),
      content: Text('Do you want to delete the "${lesson.name}" lesson?'),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Cancel'),
        ),
        FlatButton(
          onPressed: () {
            onConfirm();
            Navigator.pop(context);
          },
          child: Text('Delete'),
        ),
      ],
    );
  }
}
