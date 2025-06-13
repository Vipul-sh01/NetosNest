import 'package:get/get.dart';
import '../Models/NoteModel.dart';
import '../Services/ThreeNotesService.dart';

class ThreeNoteController extends GetxController {
  // Observable list to store notes fetched from different users
  var notesFromDifferentUsers = <NoteModel>[].obs;

  final ThreeNoteService threeNoteService = ThreeNoteService();

  @override
  void onInit() {
    super.onInit();
    fetchThreeNotes();
  }

  // Method to fetch notes from the service
  Future<void> fetchThreeNotes() async {
    try {
      // Call the service to get the notes
      List<NoteModel> fetchedNotes = await threeNoteService.getThreeNotesFromDifferentUsers();
      // Update the observable list with the fetched notes
      notesFromDifferentUsers.assignAll(fetchedNotes);
    } catch (e) {
      print('Error fetching notes: $e');
    }
  }
}
