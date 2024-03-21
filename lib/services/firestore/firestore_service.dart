import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todolist/model/note_model.dart';
import 'package:todolist/services/firestore/ifirestore_service.dart';

class FirestoreServices implements IFirestoreServices {
  final CollectionReference notesCollection =
      FirebaseFirestore.instance.collection('notes');

  @override
  Future<void> addNote(Note note) {
    return notesCollection.add(note.toMap());
  }

  @override
  Stream<List<Note>> getNotesStream() {
    return notesCollection
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((document) => Note.fromSnapshot(document))
            .toList());
  }

  @override
  Future<void> updateNote(Note note) {
    return notesCollection.doc(note.id).update(note.toMap());
  }

  @override
  Future<void> deleteNote(String docId) {
    return notesCollection.doc(docId).delete();
  }
}
