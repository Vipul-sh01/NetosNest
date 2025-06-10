import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../Models/NoteModel.dart';
import '../Services/NoteService.dart';
import '../Utility/CourseEnum.dart';

class NotesFilterController extends GetxController {
  final NoteService _noteService = NoteService();

  var allNotes = <NoteModel>[].obs;
  var filteredNotes = <NoteModel>[].obs;
  var selectedCourse = Rx<CourseName?>(null);

  @override
  void onInit() {
    super.onInit();
    fetchAllNotes();
  }

  void fetchAllNotes() async {
    final notes = await _noteService.fetchAllNotes(course: selectedCourse.value);
    allNotes.assignAll(notes);
    applyFilters();
  }

  void applyFilters() {
    filteredNotes.value = allNotes.where((note) {
      return note.courseName == selectedCourse.value?.label;
    }).toList();
    update();  // Update the UI to reflect the filtered notes
  }

  void resetFilters() {
    selectedCourse.value = null;  // Reset the course selection
    filteredNotes.assignAll(allNotes);  // Show all notes again
  }
}
