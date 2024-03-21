import 'package:flutter/material.dart';
import 'package:todolist/utils/colors.dart';

class CirclePainterCreateAccount extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = AppColors.darkSlatePurpleColor
      ..style = PaintingStyle.fill;

    double radius = size.height / 0.4;
    double distanceBetweenCircles = 20.0;

    canvas.drawCircle(
      Offset(
        size.width - size.height / 0.46 - distanceBetweenCircles / 10,
        size.height / 50,
      ),
      radius,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
