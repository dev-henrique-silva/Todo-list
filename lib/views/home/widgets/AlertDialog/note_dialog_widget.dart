import 'package:flutter/material.dart';
import 'package:todolist/utils/colors.dart';
import 'package:todolist/utils/strings/home_strings.dart';

class NoteDialogWidget extends StatefulWidget {
  final String? docId;
  final String initialText;
  final Function(String text, String? docId) onNoteSubmit;

  const NoteDialogWidget({
    Key? key,
    this.docId,
    this.initialText = '',
    required this.onNoteSubmit,
  }) : super(key: key);

  @override
  _NoteDialogWidgetState createState() => _NoteDialogWidgetState();
}

class _NoteDialogWidgetState extends State<NoteDialogWidget> {
  late TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController(text: widget.initialText);
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        widget.docId == null
            ? HomeStrings.adicioneAquiSuaNota
            : HomeStrings.editeAquiSuaNota,
        textAlign: TextAlign.center,
      ),
      content: TextField(
        controller: _textEditingController,
        cursorColor: AppColors.darkGrayColor,
        decoration: InputDecoration(
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
        ),
        maxLines: null,
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
                    HomeStrings.cancelar,
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
                onPressed: () {
                  widget.onNoteSubmit(
                      _textEditingController.text, widget.docId);
                  Navigator.pop(context);
                },
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
                    HomeStrings.inserir,
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
