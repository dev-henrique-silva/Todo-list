import 'package:todolist/model/note_model.dart';

abstract class IFirestoreServices {
  Future<void> addNote(Note note);
  Stream<List<Note>> getNotesStream();
  Future<void> updateNote(Note note);
  Future<void> deleteNote(String docId);
}
