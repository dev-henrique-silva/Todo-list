import 'package:flutter/material.dart';
import 'package:todolist/utils/colors.dart';
import 'package:todolist/utils/strings/home_strings.dart';

class DeleteNoteDialogWidget extends StatelessWidget {
  final String title;
  final String message;
  final VoidCallback onDeleteNote;

  const DeleteNoteDialogWidget({
    Key? key,
    required this.title,
    required this.message,
    required this.onDeleteNote,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        textAlign: TextAlign.center,
      ),
      content: Text(
        message,
        textAlign: TextAlign.center,
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(
                    color: AppColors.tomatoColor,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      15.0,
                    ),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    HomeStrings.nao,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: AppColors.tomatoColor,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ElevatedButton(
                onPressed: onDeleteNote,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.tomatoColor,
                  side: const BorderSide(
                    color: AppColors.tomatoColor,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      15.0,
                    ),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    HomeStrings.sim,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
