import 'package:flutter/material.dart';
import 'package:teste_mobile/model/class_model.dart';

/// ClassItem is responsable to render each item
/// of the list on [HomeModule]
class ClassItem extends StatelessWidget {
  const ClassItem(
      {Key? key,
      required this.item,
      required this.canDelete,
      required this.deleteFunction})
      : super(key: key);

  final Class item;
  final bool canDelete;
  final Function deleteFunction;

  @override
  Widget build(BuildContext context) {
    /// Render leftside status
    ///
    /// Could be and icon if completed, percentage progress or
    /// nothing if class was not started yet
    Widget renderStatus() {
      if (item.status == 'COMPLETED') {
        return Icon(
          Icons.check,
          color: Colors.green,
        );
      } else if (item.status == 'IN_PROGRESS' &&
          item.summary.percentage != null) {
        return Text('${item.summary.percentage}%');
      } else {
        return SizedBox();
      }
    }

    /// Render center info - class details
    Widget renderClassInfo() {
      final DateTime timeStamp =
          DateTime.fromMillisecondsSinceEpoch(item.createdAt);
      final String date =
          '${timeStamp.day}/${timeStamp.month.toString().padLeft(2, '0')}/${timeStamp.year}';
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: item.name,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
                TextSpan(
                  text: ' •$date',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          Text(item.id),
        ],
      );
    }

    /// Render delete button
    ///
    /// This will happen if delete mode is activated by [HomePage]
    Widget renderDeletButton() {
      if (canDelete) {
        return IconButton(
          onPressed: () => deleteFunction.call(item),
          icon: Icon(
            Icons.delete,
            color: Colors.red,
          ),
        );
      }
      return SizedBox();
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Row(
        children: [
          Container(
            width: 50,
            alignment: Alignment.center,
            child: renderStatus(),
          ),
          Expanded(
            child: renderClassInfo(),
          ),
          SizedBox(
            child: renderDeletButton(),
            height: 30,
          ),
        ],
      ),
    );
  }
}
