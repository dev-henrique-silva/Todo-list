import 'package:flutter/material.dart';

class ButtomMediumWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final Color backgroundColor;
  final String textButtom;
  final Color textColorButtom;
  const ButtomMediumWidget({
    super.key,
    required this.onPressed,
    required this.backgroundColor,
    required this.textButtom,
    required this.textColorButtom,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          horizontal: 90,
          vertical: 15,
        ),
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
      ),
      child: Text(
        textButtom,
        style: TextStyle(
          fontSize: 18,
          color: textColorButtom,
        ),
      ),
    );
  }
}
