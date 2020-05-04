import 'package:flutter/material.dart';
import 'package:marcelo_esser_test/model/lesson.dart';

class LessonItem extends StatelessWidget {
  final Lesson lesson;
  final Function onDelete;

  const LessonItem({@required this.lesson, @required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          elevation: 2,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Container(
                  height: 56,
                  width: 56,
                  child: FlatButton(
                    key: Key(lesson.id),
                    color: Colors.transparent,
                    onPressed: () {
                      onDelete();
                    },
                    child: Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
                    child: Text(
                      'id: ${lesson.id}',
                      style: TextStyle(
                        fontSize: 10,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: Text(
                      lesson.name,
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Text(
                    'Criada em: ${lesson.getFormatedDate()}',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Visibility(
                  visible: isInProgress(),
                  child: Text(
                    '%${lesson.summary.percentage}',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
              Visibility(
                visible: isCompleted(),
                child: Icon(
                  Icons.done,
                  color: Colors.lightGreen,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  bool isCompleted() => lesson.status == 'COMPLETED';

  bool isInProgress() => lesson.status == 'IN_PROGRESS';
}