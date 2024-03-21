import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todolist/model/note_model.dart';
import 'package:todolist/services/firestore/ifirestore_service.dart';

class HomeController {
  final IFirestoreServices firestoreServices;

  HomeController(this.firestoreServices);

  Future<void> addNewNote(String content) async {
    final newNote = Note(
      content: content,
      timestamp: Timestamp.now(),
    );
    await firestoreServices.addNote(newNote);
  }

  Stream<List<Note>> getNotes() {
    return firestoreServices.getNotesStream();
  }

  Future<void> updateExistingNote(String id, String newContent) async {
    final updatedNote = Note(
      id: id,
      content: newContent,
      timestamp: Timestamp.now(),
    );
    await firestoreServices.updateNote(updatedNote);
  }

  Future<void> removeNote(String id) async {
    await firestoreServices.deleteNote(id);
  }
}
