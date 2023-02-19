import 'dart:math';

import 'package:flutter/material.dart';
import 'package:prokit_flutter/fullApps/recipe/utils/RCColors.dart';

class RCCircularProgress extends CustomPainter {
  Color arcColor;
  int value;

  RCCircularProgress(this.arcColor, this.value);

  @override
  void paint(Canvas canvas, Size size) {
    Paint circle = Paint()
      ..strokeWidth = 6
      ..color = rcSecondaryColor
      ..style = PaintingStyle.stroke;

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = 50;
    canvas.drawCircle(center, radius, circle);

    Paint arc = Paint()
      ..strokeWidth = 6
      ..color = arcColor
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    double angle = 2 * pi * (value / 100);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), 30, angle, false, arc);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
