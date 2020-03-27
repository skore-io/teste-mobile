import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:teste_mobile/src/model/lesson.dart';
import 'package:teste_mobile/src/provider/lesson_provider.dart';

class LessonsPage extends StatefulWidget {
  @override
  _LessonsPageState createState() => _LessonsPageState();
}

class _LessonsPageState extends State<LessonsPage> {
  final _dtFormat = DateFormat('dd/MM/yyyy');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aulas'),
      ),
      body: ChangeNotifierProvider<LessonProvider>(
        create: (context) => LessonProvider(),
        child: Consumer<LessonProvider>(
          builder: (context, lessonsProvider, _) {
            var lessons = lessonsProvider.lesson;
            if (lessons == null)
              return Center(child: CircularProgressIndicator());

            return Center(
              child: ListView.builder(
                itemCount: lessons.length,
                itemBuilder: (context, index) {
                  var lesson = lessons[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  lesson.name,
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w800),
                                ),
                                Text(
                                  _dtFormat.format(lesson.createdAt),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            _progresso(lesson),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: OutlineButton(
                                onPressed: () =>
                                    lessonsProvider.removeLesson(lesson),
                                child: Text(
                                  'Excluir',
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Id: ${lesson.id}',
                                style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w600,
                                    color: Theme.of(context)
                                        .primaryTextTheme
                                        .bodyText1
                                        .color
                                        .withOpacity(.6)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _progresso(Lesson lesson) {
    var progress = lesson.status == 'IN_PROGRESS';
    var notStarted = lesson.status == 'NOT_STARTED';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Container(
            width: progress ? 160 : 110,
            decoration: BoxDecoration(
                color: progress
                    ? Colors.orangeAccent
                    : notStarted ? Colors.red : Colors.green,
                borderRadius: BorderRadius.all(Radius.circular(5))),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  if (!progress && notStarted == false)
                    Icon(
                      Icons.done,
                    ),
                  Text(
                    progress
                        ? '${lesson.summary.percentage}% Concluído'
                        : notStarted ? 'Não Iniciado' : 'Concluído',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        if (lesson.summary.percentage != null)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: LinearProgressIndicator(
              value: lesson.summary.percentage / 100,
            ),
          ),
      ],
    );
  }
}
