import 'package:flutter/material.dart';

import 'package:teste_mobile/constants/ui.dart';

class ProgressCircle extends CustomPainter {

  final double angle;
  ProgressCircle({this.angle});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = secondary
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;
    canvas.drawArc(Rect.fromLTWH(0, 0, size.width, size.height), 0, angle, false, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
