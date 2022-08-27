import 'package:flutter/material.dart';

import 'package:teste_score/app/modules/home/domain/entities/classroom.dart';
import 'package:teste_score/app/utils/formatters.dart';

class CardClassRoomWidget extends StatefulWidget {
  final ClassRoom classRoom;
  final int index;
  final Function() removeClassRoom;

  const CardClassRoomWidget({
    Key? key,
    required this.classRoom,
    required this.index,
    required this.removeClassRoom,
  }) : super(key: key);

  @override
  State<CardClassRoomWidget> createState() => _CardClassRoomWidgetState();
}

Widget returnIconOrPercentage(String status, double perc) {
  if (status == 'IN_PROGRESS') {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 5),
          width: 20,
          height: 20,
          child: CircularProgressIndicator(
            value: perc / 100,
            color: Colors.green,
            backgroundColor: Colors.red,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }

  return Row(
    children: const [
      Icon(
        Icons.check_outlined,
        color: Colors.green,
      ),
      SizedBox(
        width: 10,
      ),
    ],
  );
}

class _CardClassRoomWidgetState extends State<CardClassRoomWidget> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      minLeadingWidth: 0,
      title: Row(
        children: [
          widget.classRoom.status != 'NOT_STARTED'
              ? returnIconOrPercentage(
                  widget.classRoom.status,
                  widget.classRoom.percentage,
                )
              : const SizedBox(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.classRoom.name),
                Text(widget.classRoom.id),
              ],
            ),
          ),
        ],
      ),
      subtitle: Text(
        widget.classRoom.createdAt.DiaMesAnoDB(),
      ),
      trailing: TextButton(
        onPressed: widget.removeClassRoom,
        child: const Text('Excluir'),
      ),
    );
  }
}
