import 'package:flutter/material.dart';
import 'package:skore/core/helpers/date_helper.dart';
import 'package:skore/core/helpers/percentage_helper.dart';
import 'package:skore/domain/enums/lesson_status.dart';
import 'package:skore/domain/models/lesson_model.dart';

class LessonTileWidget extends StatefulWidget {
  final LessonModel lessonModel;
  final Function() onDelete;

  const LessonTileWidget({Key? key, required this.lessonModel, required this.onDelete}) : super(key: key);

  @override
  _LessonTileWidgetState createState() => _LessonTileWidgetState();
}

class _LessonTileWidgetState extends State<LessonTileWidget> {
  double get componentBorderRadius => 12;
  double get componentMargin => 20;
  double get componentDescriptionItemsPadding => 16;
  double get componentDescriptionItemsSize => 90;

  String get componentLorem => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.';

  TextStyle get titleStyle => const TextStyle(fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: const Key('lessonTileWidget'),
      margin: EdgeInsets.all(componentMargin),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(componentBorderRadius),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(componentBorderRadius),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Flexible(
            //   flex: 2,
            //   child: ClipRRect(
            //     borderRadius: BorderRadius.circular(componentBorderRadius),
            //     child: const RandomImageWidget(),
            //   ),
            // ),
            Expanded(
              flex: 3,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: componentDescriptionItemsPadding),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.lessonModel.name,
                      style: titleStyle,
                      key: const Key('lessonName'),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      widget.lessonModel.id ?? '',
                      overflow: TextOverflow.ellipsis,
                      key: const Key('lessonId'),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      DateHelper.getDateFormated(widget.lessonModel.createdAt),
                      key: const Key('lessonCreationDate'),
                    ),
                    const SizedBox(height: 6),
                    Text(componentLorem, overflow: TextOverflow.ellipsis),
                    const SizedBox(height: 4),
                    buildLessonStatusComponent(),
                  ],
                ),
              ),
            ),
            Flexible(
              child: buildActionComponent(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildLessonStatusComponent() {
    final canShowProgressBar = widget.lessonModel.status == LessonStatus.inProgress;
    if (!canShowProgressBar) return const Offstage();

    final summaryPercentage = widget.lessonModel.summary.percentage;
    return LinearProgressIndicator(
      backgroundColor: Colors.grey,
      value: PercentageHelper.getPercentageOfInt(summaryPercentage?.toDouble() ?? 0, 1),
      key: const Key('lessonProgressBar'),
    );
  }

  Widget buildActionComponent() {
    final isLessonCompleted = widget.lessonModel.status == LessonStatus.completed;

    return SizedBox(
      height: componentDescriptionItemsSize,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          children: [
            isLessonCompleted
                ? const Icon(
                    Icons.done,
                    key: Key('lessonDone'),
                  )
                : const Icon(
                    Icons.play_arrow_outlined,
                  ),
            const SizedBox(width: 10),
            GestureDetector(
              onTap: widget.onDelete,
              child: const Icon(
                Icons.delete_outline_rounded,
                key: Key('lessonDeleteButton'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
