import 'package:flutter/material.dart';
import 'package:todolist/utils/colors.dart';

class CirclePainterLogin extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint1 = Paint()
      ..color = AppColors.tomatoColor
      ..style = PaintingStyle.fill;

    Paint paint2 = Paint()
      ..color = AppColors.darkSlatePurpleColor
      ..style = PaintingStyle.fill;

    double radius1 = size.height / 0.46;
    double radius2 = size.height / 0.4;
    double distanceBetweenCircles = 20.0;

    canvas.drawCircle(
      Offset(
        radius1 + distanceBetweenCircles / 10,
        size.height / 50,
      ),
      radius1,
      paint1,
    );
    canvas.drawCircle(
      Offset(
        size.width - radius1 - distanceBetweenCircles / 10,
        size.height / 50,
      ),
      radius2,
      paint2,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
