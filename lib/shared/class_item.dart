import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teste_mobile/model/class_model.dart';

class ClassItem extends StatelessWidget {
  const ClassItem({Key? key, required this.item, this.canDelete})
      : super(key: key);

  final Class item;
  final bool? canDelete;

  @override
  Widget build(BuildContext context) {
    Widget renderStatus() {
      return SizedBox();
    }

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

    Widget renderDeletButton() {
      return SizedBox();
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [renderStatus(), renderClassInfo(), renderDeletButton()],
      ),
    );
  }
}
