import 'package:flutter/material.dart';

import '../model/class_item_model.dart';
import '../utils/date_functions.dart';

class ClassItemWidget extends StatefulWidget {
  ClassItemWidget({
    required this.classModel,
    required this.onDelete,
  }) : super(key: Key(classModel.id));

  final ClassItemModel classModel;
  final Function(String) onDelete;

  @override
  State<ClassItemWidget> createState() => _ClassItemWidgetState();
}

class _ClassItemWidgetState extends State<ClassItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(widget.classModel.id),
      background: makeDeleteButton(),
      behavior: HitTestBehavior.deferToChild,
      onDismissed: (_) => widget.onDelete(widget.classModel.id),
      child: Card(
        child: makeProgressIndicatorLayout(context),
      ),
    );
  }

  Column makeProgressIndicatorLayout(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          makeMainColumn(context),
          makeProgressIndicator(),
        ],
      );

  Widget makeMainColumn(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 5,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            makeNameAndDate(context),
            const SizedBox(height: 5),
            makeIdAndIcon(),
          ],
        ),
      );

  Widget makeNameAndDate(BuildContext context) => Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            widget.classModel.name,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          Text(
            formatDateTimeAsString(
              context: context,
              dateTime: widget.classModel.createdAt,
            ),
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      );

  Widget makeIdAndIcon() => Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          makeStatusIcon(),
          const Spacer(),
          Text(
            widget.classModel.id,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      );

  Widget makeStatusIcon() {
    if (widget.classModel.status == ClassStatus.completed) {
      return const Icon(
        Icons.check,
        color: Colors.green,
      );
    } else if (widget.classModel.status == ClassStatus.inProgress &&
        widget.classModel.percentage != null) {
      return Text(
        '${widget.classModel.percentage?.toString()}%',
        style: const TextStyle(
          fontSize: 14,
          color: Colors.blueAccent,
        ),
      );
    } else {
      return const SizedBox();
    }
  }

  Widget makeProgressIndicator() {
    if (widget.classModel.percentage != null &&
        widget.classModel.status == ClassStatus.inProgress) {
      return LinearProgressIndicator(
        value: (widget.classModel.percentage!.toDouble() / 100),
      );
    } else {
      return const SizedBox();
    }
  }

  Widget makeDeleteButton() => Container(
        color: Colors.red,
        child: const Icon(
          Icons.delete,
          color: Colors.white,
        ),
      );
}
