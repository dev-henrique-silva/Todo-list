import 'package:flutter/material.dart';
import 'package:todolist/custom_painter/Half_moon_painter/Half_moon_painter_custom_painter.dart';

class FooterWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String textFooterOne;
  final String textFooterTwo;
  final Color textColor;
  const FooterWidget({
    super.key,
    required this.onTap,
    required this.textFooterOne,
    required this.textFooterTwo,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          SizedBox(
            width: 200.0,
            height: 100.0,
            child: CustomPaint(
              painter: HalfMoonPainter(),
            ),
          ),
          Positioned(
            bottom: 10,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: GestureDetector(
                onTap: onTap,
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: textFooterOne,
                        style: TextStyle(
                          color: textColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(
                        text: textFooterTwo,
                        style: TextStyle(
                          color: textColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
