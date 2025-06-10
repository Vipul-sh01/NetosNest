import 'package:cloud_firestore/cloud_firestore.dart';
import '../Models/NoteModel.dart';

class ThreeNoteService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference _notesCollection = FirebaseFirestore.instance.collection('notes');
  Future<List<NoteModel>> getThreeNotesFromDifferentUsers() async {
    try {
      final snapshot = await _notesCollection.limit(30).get();  // Limit to 30 for efficiency
      final Map<String, NoteModel> uniqueNotes = {};

      for (var doc in snapshot.docs) {
        final data = doc.data() as Map<String, dynamic>;
        final note = NoteModel.fromJson(data);
        final userId = data['uploadedBy']['uid'];
        if (userId != null && !uniqueNotes.containsKey(userId)) {
          uniqueNotes[userId] = note;
        }
        if (uniqueNotes.length >= 3) {
          break;
        }
      }

      return uniqueNotes.values.toList();
    } catch (e) {
      print("Error fetching three notes from different users: $e");
      return [];
    }
  }
}
