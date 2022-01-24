import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/models/class_model.dart';

class ClassListTile extends StatelessWidget {
  const ClassListTile({
    Key? key,
    required this.oneClass,
    required this.onDelete,
  }) : super(key: key);

  final ClassModel oneClass;
  final void Function() onDelete;

  String getCreatedDate(DateTime createdAt) {
    String day = createdAt.day.toString();
    String month = createdAt.month.toString();
    String year = createdAt.year.toString();

    if (day.length == 1) day = "0$day";
    if (month.length == 1) month = "0$month";

    return "$day/$month/$year";
  }

  Widget completedStatus() => Container(
        alignment: Alignment.centerLeft,
        child: Icon(
          Icons.check_circle_outline_outlined,
          color: Colors.green,
          size: 28.0,
        ),
      );

  Widget inProgressStatus(double percentage) => Container(
        child: Text(
          "$percentage %",
        ),
      );

  Widget notStartedStatus() => Container();

  Widget getStatus(ClassStatus status, double percentage) {
    switch (status) {
      case ClassStatus.COMPLETED:
        return completedStatus();
      case ClassStatus.IN_PROGRESS:
        return inProgressStatus(percentage);
      default:
        return notStartedStatus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: key,
      width: Get.width,
      // height: 100.0,
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              Expanded(
                flex: 8,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    oneClass.name,
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    getCreatedDate(oneClass.createdAt),
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: getStatus(oneClass.status, oneClass.percentage),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 25.0),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    alignment: Alignment.centerRight,
                    onPressed: onDelete,
                    icon: Icon(
                      Icons.delete_outline,
                      color: Colors.red,
                      size: 28.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                flex: 12,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    oneClass.id,
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: 13.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
