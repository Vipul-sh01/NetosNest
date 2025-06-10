import 'dart:async';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import '../../Models/ModuleModels.dart';
import '../../Models/NoteModel.dart';
import '../../Models/UserModels.dart';
import '../../Services/NoteService.dart';
import '../../Utility/NoteSearchHelper.dart';

class NoteController extends GetxController {
  final NoteService _noteService = NoteService();

  final notes = <NoteModel>[].obs;
  final isLoading = false.obs;
  final searchQuery = ''.obs;



  late UserModel currentUser;

  StreamSubscription<List<NoteModel>>? _notesSubscription;

  @override
  void onInit() {
    super.onInit();
    listenToAllNotes();
  }

  @override
  void onClose() {
    _notesSubscription?.cancel();
    super.onClose();
  }

  /// 👤 Set the current signed-in user
  void setUser(UserModel user) {
    currentUser = user;
  }

  /// 🔄 Realtime updates for all notes
  void listenToAllNotes() {
    _notesSubscription?.cancel(); // cancel existing one
    isLoading.value = true;

    _notesSubscription = _noteService.getAllNotesStream().listen((noteList) {
      notes.value = noteList;
      isLoading.value = false;
      print("Real-time notes updated: ${noteList.length}");
    }, onError: (e) {
      isLoading.value = false;
      print("Error in stream: $e");
    });
  }

  /// 📤 Upload a note
  Future<void> uploadNote({
    required String title,
    required String courseCode,
    required String courseName,
    required String educationLevel,
    required String boardOrUniversity,
    required String subject,
    required List<ModuleModel> modules,
    required bool isForSale,
    required DateTime examDate,
  }) async {
    final note = NoteModel(
      noteId: const Uuid().v4(),
      title: title,
      courseCode: courseCode,
      courseName: courseName,
      educationLevel: educationLevel,
      boardOrUniversity: boardOrUniversity,
      subject: subject,
      modules: modules,
      isForSale: isForSale,
      uploadedBy: currentUser,
      examDate: examDate,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    await _noteService.uploadNote(note);
  }

  /// 🗑 Delete a note
  Future<void> deleteNote(String noteId) async {
    await _noteService.deleteNote(noteId, currentUser.uid!);
    // notes list auto-updates via stream
  }

  /// ✏️ Update a note
  Future<void> updateNote(NoteModel updatedNote) async {
    await _noteService.updateNote(updatedNote, currentUser.uid!);
    // notes list auto-updates via stream
  }

  /// 🔎 Search query update
  void updateSearchQuery(String value) {
    searchQuery.value = value.trim().toLowerCase();
  }

  /// 🧠 Filtered notes based on search
  List<NoteModel> get filteredNotes {
    return NoteSearchHelper.filterNotes(
      notes: notes,
      query: searchQuery.value,
    );
  }
}
