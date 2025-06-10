import '../Models/NoteModel.dart';

class NoteSearchHelper {
  static List<NoteModel> filterNotes({
    required List<NoteModel> notes,
    required String query,
  }) {
    final lowerQuery = query.trim().toLowerCase();

    // If the search query is empty, return all notes
    if (lowerQuery.isEmpty) return notes;

    return notes.where((note) {
      final title = (note.title ?? '').toLowerCase();
      final courseCode = (note.courseCode ?? '').toLowerCase();
      final courseName = (note.courseName ?? '').toLowerCase();
      final subject = (note.subject ?? '').toLowerCase();

      return title.contains(lowerQuery) ||
          courseCode.contains(lowerQuery) ||
          courseName.contains(lowerQuery) ||
          subject.contains(lowerQuery);
    }).toList();
  }
}
