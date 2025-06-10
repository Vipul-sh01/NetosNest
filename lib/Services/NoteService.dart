import 'package:cloud_firestore/cloud_firestore.dart';
import '../Models/NoteModel.dart';
import '../Utility/CourseEnum.dart';

class NoteService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference notesCollection = FirebaseFirestore.instance.collection('notes');

  Future<void> uploadNote(NoteModel note) async {
    final query = await notesCollection
        .where('courseCode', isEqualTo: note.courseCode)
        .where('courseName', isEqualTo: note.courseName)
        .where('subject', isEqualTo: note.subject)
        .where('uploadedBy.uid', isEqualTo: note.uploadedBy.uid)
        .limit(1)
        .get();

    if (query.docs.isNotEmpty) {
      final existingDoc = query.docs.first;
      final existingData = existingDoc.data() as Map<String, dynamic>;
      final existingModules = List<Map<String, dynamic>>.from(existingData['modules'] ?? []);

      // Avoid duplicates
      for (final newModule in note.modules) {
        if (!existingModules.any((m) => m['fileUrl'] == newModule.fileUrl)) {
          existingModules.add(newModule.toJson());
        }
      }

      await notesCollection.doc(existingDoc.id).update({
        'modules': existingModules,
        'updatedAt': FieldValue.serverTimestamp(),
      });
    } else {
      // New note
      await notesCollection.doc(note.noteId).set({
        ...note.toJson(),
        'createdAt': FieldValue.serverTimestamp(),
        'updatedAt': FieldValue.serverTimestamp(),
      });
    }
  }

  Future<List<NoteModel>> getNotesByUserId(String userId) async {
    final snapshot = await notesCollection
        .where('uploadedBy.uid', isEqualTo: userId)
        .get();

    return snapshot.docs
        .map((doc) => NoteModel.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
  }

  /// 🔄 Converted to real-time stream
  Stream<List<NoteModel>> getAllNotesStream() {
    return notesCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return NoteModel.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();
    });
  }

  Future<void> deleteNote(String noteId, String userId) async {
    final doc = await notesCollection.doc(noteId).get();
    if (doc.exists && (doc['uploadedBy']['uid'] == userId)) {
      await notesCollection.doc(noteId).delete();
    }
  }

  Future<void> updateNote(NoteModel note, String userId) async {
    final doc = await notesCollection.doc(note.noteId).get();
    if (doc.exists && (doc['uploadedBy']['uid'] == userId)) {
      await notesCollection.doc(note.noteId).update({
        ...note.toJson(),
        'updatedAt': FieldValue.serverTimestamp(),
      });
    }
  }

  Future<List<NoteModel>> fetchAllNotes({CourseName? course}) async {
    Query query = notesCollection;

    if (course != null) {
      query = query.where('courseName', isEqualTo: course.label); // Filter by courseName
    }

    final snapshot = await query.get();
    return snapshot.docs.map((doc) => NoteModel.fromJson(doc.data() as Map<String, dynamic>)).toList();
  }
}
