import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:skore_mobile_challenge/domain/models/lesson.dart';
import 'package:skore_mobile_challenge/domain/models/lesson_status.dart';
import 'package:skore_mobile_challenge/presentation/widgets/removal_button/removal_button.dart';

class LessonListItem extends StatelessWidget {
  final Lesson lesson;
  final Function(String) onPressRemoveButton;

  const LessonListItem({Key? key, required this.lesson, required this.onPressRemoveButton}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('dd/MM/yyyy');
    final value = lesson.summary.percentage / 100;
    final progressBarColor = Colors.lightGreen.withAlpha(90);
    const transparent = Colors.transparent;

    return Card(
      child: Row(
        children: [
          Expanded(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  stops: [0.0, value, value, 1],
                  colors: [progressBarColor, progressBarColor, transparent, transparent],
                ),
              ),
              child: ListTile(
                title: Text(lesson.name),
                subtitle: Text('${dateFormat.format(lesson.createdAt)}\n${lesson.id}'),
                trailing: SizedBox(
                  width: 40,
                  child: Center(child: _buildStatus(lesson.status, lesson.summary.percentage)),
                ),
                visualDensity: VisualDensity.compact,
                isThreeLine: true,
              ),
            ),
          ),
          _buildRemovalButton(lesson.id),
        ],
      ),
    );
  }

  Widget _buildStatus(LessonStatus status, int percentage) {
    if (status == LessonStatus.inProgress) {
      return Text(
        '$percentage%',
        style: const TextStyle(fontSize: 20),
      );
    }

    if (status == LessonStatus.completed) {
      return const Icon(
        Icons.check,
        color: Colors.green,
        size: 42,
      );
    }
    return const SizedBox.shrink();
  }

  Widget _buildRemovalButton(String lessonId) {
    return SizedBox(
      width: 60,
      child: RemovalButton(onPress: () => onPressRemoveButton(lessonId)),
    );
  }
}
