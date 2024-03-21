import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:todolist/controllers/home/home_controller.dart';
import 'package:todolist/model/note_model.dart';
import 'package:todolist/services/firestore/firestore_service.dart';
import 'package:todolist/utils/colors.dart';
import 'package:todolist/utils/lottie_splash_screen_assets.dart';
import 'package:todolist/utils/strings/home_strings.dart';
import 'package:todolist/views/home/widgets/AlertDialog/delete_note_dialog_widget.dart';
import 'package:todolist/views/home/widgets/AlertDialog/note_dialog_widget.dart';
import 'package:todolist/views/home/widgets/card_notes_widget.dart';
import 'package:todolist/views/login/login_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final HomeController _homeController;
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    _homeController = HomeController(FirestoreServices());
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 227, 227),
      appBar: AppBar(
        backgroundColor: AppColors.tomatoColor,
        title: const Text(HomeStrings.todoList),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const LoginView(),
                ),
                (route) => false,
              );
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openNoteBox(),
        backgroundColor: AppColors.tomatoColor,
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder<List<Note>>(
        stream: _homeController.getNotes(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var noteList = snapshot.data!;

            return noteList.isEmpty
                ? Center(
                    child: Lottie.asset(
                      LottieAnimationAssets.loadAnimation,
                      width: 200,
                      controller: _controller,
                      onLoaded: (composition) {
                        _controller
                          ..duration = composition.duration
                          ..repeat();
                      },
                    ),
                  )
                : ListView.builder(
                    itemCount: noteList.length,
                    itemBuilder: (context, index) {
                      var note = noteList[index];

                      return CardNotes(
                        note: note,
                        onEdit: () {
                          _textEditingController.text = note.content;
                          _openNoteBox(docId: note.id);
                        },
                        onDelete: () {
                          _deleteNote(
                            docId: note.id,
                            title: HomeStrings.temCertezaQueDesejaExcluir,
                            message: HomeStrings
                                .naoSeraPossivelRecupearOsDadosExcluidos,
                          );
                        },
                      );
                    },
                  );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                HomeStrings.erroNaofoiPossivelExibirAlistaDeTarefas,
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }

  void _openNoteBox({String? docId}) {
    if (docId == null) _textEditingController.clear();

    showDialog(
      context: context,
      builder: (context) => NoteDialogWidget(
        initialText: _textEditingController.text,
        docId: docId,
        onNoteSubmit: (String text, String? docId) async {
          if (docId == null) {
            await _homeController.addNewNote(text);
          } else {
            await _homeController.updateExistingNote(docId, text);
          }
          Navigator.pop(context);
        },
      ),
    );
  }

  void _deleteNote({
    String? docId,
    required String title,
    required String message,
  }) {
    showDialog(
      context: context,
      builder: (context) => DeleteNoteDialogWidget(
        title: title,
        message: message,
        onDeleteNote: () async {
          await _homeController.removeNote(docId!);
          Navigator.pop(context);
        },
      ),
    );
  }
}
