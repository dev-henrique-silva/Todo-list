import 'package:cloud_firestore/cloud_firestore.dart';

class Note {
  final String? id;
  final String content;
  final Timestamp timestamp;

  Note({
    this.id,
    required this.content,
    required this.timestamp,
  });

  factory Note.fromSnapshot(DocumentSnapshot snapshot) {
    return Note(
      id: snapshot.id,
      content: snapshot['note'],
      timestamp: snapshot['timestamp'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'note': content,
      'timestamp': timestamp,
    };
  }
}
