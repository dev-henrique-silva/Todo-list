import 'package:flutter/material.dart';
import 'package:todolist/custom_painter/circle_painter/circle_painter_create_account_custom_painter.dart';
import 'package:todolist/utils/colors.dart';

class HeaderCreateAccountWidget extends StatelessWidget {
  final String headerTextOne;
  final String headerTextTwo;
  final Color textColor;
  const HeaderCreateAccountWidget({
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
            painter: CirclePainterCreateAccount(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 45.0, left: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () => Navigator.pop(context),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: textColor,
                ),
              ),
              const SizedBox(height: 25),
              Text(
                headerTextOne,
                style: const TextStyle(
                  color: AppColors.whiteColor,
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
