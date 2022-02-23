import 'dart:math';

import 'package:flutter/material.dart';

class PercentIndicator extends StatelessWidget {
  final int currentPercent;
  const PercentIndicator(this.currentPercent, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      foregroundPainter: CirclePercentProgress(currentPercent),
      child: SizedBox(
        width: 40.0,
        height: 40.0,
        child: Center(
          child: currentPercent < 100
              ? Text(
                  '$currentPercent%',
                  style: const TextStyle(
                    fontSize: 12.0,
                  ),
                )
              : const Icon(
                  Icons.check,
                  color: Colors.green,
                ),
        ),
      ),
    );
  }
}

class CirclePercentProgress extends CustomPainter {
  int currentPercent;
  CirclePercentProgress(this.currentPercent);

  @override
  void paint(Canvas canvas, Size size) {
    Paint circle = Paint()
      ..strokeWidth = 2
      ..color = currentPercent < 100 ? Colors.yellow : Colors.green
      ..style = PaintingStyle.stroke;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width / 2, size.height / 2) - 2;
    double angle = 2 * pi * (currentPercent / 100);

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      angle,
      false,
      circle,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
