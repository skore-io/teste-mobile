import 'package:flutter/material.dart';
import 'package:teste_mobile/screens/widgets/progress_circle.dart';
import 'dart:math';

class Progress extends StatelessWidget {

  final int progress;

  Progress({this.progress});

  @override
  Widget build(BuildContext context) {
    if(progress == null) return Container();
    final position = progress / 100 * pi * 2;
    return Stack(
      children: [
        CustomPaint(
          size: Size(50, 50),
          painter: ProgressCircle(angle: position),
        ),
        Center(
          child: Text(
            '$progress%'
          ),
        )
      ]
    );
  }
}