import 'package:flutter/material.dart';
import 'package:todolist/model/note_model.dart';
import 'package:todolist/utils/colors.dart';

class CardNotes extends StatelessWidget {
  final Note note;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const CardNotes({
    Key? key,
    required this.note,
    required this.onEdit,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListTile(
            title: Text(
              note.content,
              style: const TextStyle(
                color: AppColors.darkSlatePurpleColor,
              ),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: onEdit,
                  icon: const Icon(
                    Icons.edit,
                    color: AppColors.darkSlatePurpleColor,
                  ),
                ),
                IconButton(
                  onPressed: onDelete,
                  icon: const Icon(
                    Icons.delete,
                    color: AppColors.darkSlatePurpleColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
