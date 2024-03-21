import 'package:flutter/material.dart';
import 'package:todolist/utils/colors.dart';

class TextFieldLoginWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String labelText;
  final String? errorText;
  final Function(String)? onChanged;
  final bool obscureText;
  const TextFieldLoginWidget({
    Key? key,
    this.controller,
    required this.labelText,
    required this.errorText,
    this.onChanged,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(
          color: AppColors.darkGrayColor,
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: AppColors.lightGrayColor,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: AppColors.tomatoColor,
          ),
        ),
        errorText: errorText,
        errorStyle: const TextStyle(
          color: AppColors.darkSlatePurpleColor,
        ),
      ),
      style: const TextStyle(
        color: AppColors.tomatoColor,
        fontWeight: FontWeight.bold,
      ),
      cursorColor: AppColors.lightGrayColor,
      onChanged: onChanged,
      keyboardType: TextInputType.emailAddress,
    );
  }
}
