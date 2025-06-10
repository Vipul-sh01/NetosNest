// lib/Utility/note_filter_helper.dart
import '../Models/NoteModel.dart';

class NoteFilterHelper {
  static List<NoteModel> filterNotes({
    required List<NoteModel> notes,
    required String selectedCourse,
  }) {
    return notes.where((note) {
      return selectedCourse.isEmpty || note.courseName == selectedCourse;
    }).toList();
  }
}
