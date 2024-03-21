import 'package:flutter/material.dart';
import 'package:todolist/utils/colors.dart';

class TextFieldCreateAccountWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String labelText;
  final String? errorText;
  final Function(String)? onChanged;
  final bool obscureText;
  const TextFieldCreateAccountWidget({
    Key? key,
    this.controller,
    required this.labelText,
    this.errorText = '',
    this.onChanged,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(
          color: AppColors.whiteColor,
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: AppColors.whiteColor,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: AppColors.whiteColor,
          ),
        ),
        errorText: errorText,
        errorStyle: const TextStyle(
          color: AppColors.whiteColor,
        ),
      ),
      style: const TextStyle(
        color: AppColors.whiteColor,
        fontWeight: FontWeight.bold,
      ),
      cursorColor: AppColors.whiteColor,
      onChanged: onChanged,
      keyboardType: TextInputType.emailAddress,
    );
  }
}
