import 'dart:math';

import 'package:flutter/material.dart';
import 'package:todolist/utils/colors.dart';

class HalfMoonPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = AppColors.darkSlatePurpleColor
      ..style = PaintingStyle.fill;

    double radius = size.width / 0.82;
    double centerX = size.width / 2;
    double centerY = size.height / 0.37;

    Path path = Path()
      ..moveTo(centerX + radius, centerY)
      ..arcTo(Rect.fromCircle(center: Offset(centerX, centerY), radius: radius),
          0, pi, false)
      ..lineTo(centerX - radius, centerY)
      ..arcTo(Rect.fromCircle(center: Offset(centerX, centerY), radius: radius),
          pi, pi, false);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
