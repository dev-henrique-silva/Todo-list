import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:todolist/utils/colors.dart';

class FlushbarErroWidget {
  final String title;
  final String message;
  final Duration? duration;
  final BuildContext context;
  final OnTap? onTap;

  FlushbarErroWidget({
    required this.context,
    required this.title,
    required this.message,
    this.duration,
    this.onTap,
  }) {
    Flushbar(
      titleText: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w800,
          color: AppColors.darkSlatePurpleColor,
        ),
      ),
      messageText: Text(
        message,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w800,
          color: AppColors.darkSlatePurpleColor,
        ),
      ),
      messageColor: AppColors.whiteColor,
      duration: duration ?? const Duration(seconds: 5),
      isDismissible: true,
      flushbarPosition: FlushbarPosition.TOP,
      margin: const EdgeInsets.all(6.0),
      padding: const EdgeInsets.all(20),
      borderRadius: BorderRadius.circular(10),
      backgroundColor:   AppColors.whiteColor,
      icon: const Icon(
            Icons.cancel,
            color: AppColors.tomatoColor,
          ),
      onTap: onTap,
    ).show(context);
  }
}
