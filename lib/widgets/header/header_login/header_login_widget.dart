import 'package:flutter/material.dart';
import 'package:todolist/custom_painter/circle_painter/circle_painter_login_custom_painter.dart';

class HeaderLoginWidget extends StatelessWidget {
  final String headerTextOne;
  final String headerTextTwo;
  final Color textColor;
  const HeaderLoginWidget({
    super.key,
    required this.headerTextOne,
    required this.headerTextTwo,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: 200.0,
          height: 100.0,
          child: CustomPaint(
            painter: CirclePainterLogin(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 70.0, left: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 25),
              Text(
                headerTextOne,
                style: TextStyle(
                  color: textColor,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                headerTextTwo,
                style: TextStyle(
                  color: textColor,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
