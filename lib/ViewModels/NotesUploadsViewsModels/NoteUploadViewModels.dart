import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../../Models/ModuleModels.dart';
import '../../Models/NoteModel.dart';
import '../../Models/UserModels.dart';
import '../../Services/UserServices/fileUpload.dart';
import '../../Services/NoteService.dart';
import '../../Utility/ModuleEnum.dart';
import '../../Utility/showSnackbar.dart';

class NoteUploadController extends GetxController {
  // Form input controllers
  final titleController = TextEditingController();
  final courseCodeController = TextEditingController();
  final courseNameController = TextEditingController();
  final educationLevelController = TextEditingController();
  final boardOrUniversityController = TextEditingController();
  final subjectController = TextEditingController();

  // Reactive UI state
  var examDate = DateTime.now().obs;
  var modulePrice = 0.0.obs;
  var fileName = ''.obs;
  var selectedModule = ModuleName.values.first.obs;
  var uploadProgress = 0.0.obs;
  var isLoading = false.obs;

  // File-related state
  String? pickedFilePath;
  String? fileDownloadUrl;
  String? previewImageUrl;

  // List of added modules
  final List<ModuleModel> modules = <ModuleModel>[].obs;

  // Services
  final StorageService _storageService = StorageService();
  final NoteService _noteService = NoteService();

  /// Pick a file and upload with progress bar
  void pickFile(UserModel user) async {
    final result = await FilePicker.platform.pickFiles();

    if (result != null && result.files.single.path != null) {
      pickedFilePath = result.files.single.path!;
      fileName.value = result.files.single.name;
      fileDownloadUrl = null;
      uploadProgress.value = 0;

      final file = File(pickedFilePath!);
      final uploadPath = 'notes/${user.uid}/${const Uuid().v4()}';

      try {
        final uploadTask = _storageService.uploadFileWithProgress(file, '$uploadPath/${fileName.value}');

        uploadTask.snapshotEvents.listen(
              (TaskSnapshot snapshot) async {
            uploadProgress.value = snapshot.bytesTransferred / snapshot.totalBytes;

            if (snapshot.state == TaskState.success) {
              fileDownloadUrl = await snapshot.ref.getDownloadURL();
              uploadProgress.value = 1.0;
            }
          },
          onError: (error) {
            uploadProgress.value = 0;
            DialogUtils.showSnackbar("Upload Error", "Something went wrong: $error", isError: true);
          },
        );
      } catch (e) {
        DialogUtils.showSnackbar("Upload Error", "Something went wrong: $e", isError: true);
      }
    } else {
      DialogUtils.showSnackbar("No File", "Please select a valid PDF file", isError: true);
    }
  }

  /// Generate preview image, add module, and upload note
  Future<bool> addModuleAndUploadNote(UserModel currentUser) async {
    if (pickedFilePath == null || fileDownloadUrl == null) {
      DialogUtils.showSnackbar("Missing File", "Please pick and upload a file first.", isError: true);
      return false;
    }

    isLoading.value = true; // Start loading

    final file = File(pickedFilePath!);
    final uploadPath = 'notes/${currentUser.uid}/${const Uuid().v4()}';

    try {
      // Generate preview
      previewImageUrl = await _storageService.generatePreviewFromPdf(file, '$uploadPath/preview');

      if (previewImageUrl == null) {
        DialogUtils.showSnackbar("Preview Error", "Preview image was not generated properly.", isError: true);
        isLoading.value = false;
        return false;
      }

      // Add module
      final module = ModuleModel(
        moduleName: selectedModule.value,
        fileUrl: fileDownloadUrl!,
        previewUrl: previewImageUrl,
        price: modulePrice.value,
      );
      modules.add(module);

      // Create note
      final noteModel = NoteModel(
        noteId: const Uuid().v4(),
        title: titleController.text.trim(),
        courseCode: courseCodeController.text.trim(),
        courseName: courseNameController.text.trim(),
        educationLevel: educationLevelController.text.trim(),
        boardOrUniversity: boardOrUniversityController.text.trim(),
        subject: subjectController.text.trim(),
        modules: modules.toList(),
        uploadedBy: currentUser,
        isForSale: modules.any((m) => (m.price ?? 0) > 0),
        examDate: examDate.value,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      await _noteService.uploadNote(noteModel);

      _resetAllFields();
      DialogUtils.showSnackbar("Success", "Note uploaded successfully");
      isLoading.value = false;
      return true;
    } catch (e) {
      DialogUtils.showSnackbar("Error", "Failed to upload note: $e", isError: true);
      isLoading.value = false;
      return false;
    }
  }


  /// Reset fields related to file/module
  void _resetModuleUploadFields() {
    fileName.value = '';
    pickedFilePath = null;
    fileDownloadUrl = null;
    previewImageUrl = null;
    modulePrice.value = 0;
    uploadProgress.value = 0;
    selectedModule.value = ModuleName.values.first;
  }

  /// Reset all input fields and states
  void _resetAllFields() {
    _resetModuleUploadFields();
    modules.clear();

    titleController.clear();
    courseCodeController.clear();
    courseNameController.clear();
    educationLevelController.clear();
    boardOrUniversityController.clear();
    subjectController.clear();

    examDate.value = DateTime.now();
  }

  @override
  void onClose() {
    titleController.dispose();
    courseCodeController.dispose();
    courseNameController.dispose();
    educationLevelController.dispose();
    boardOrUniversityController.dispose();
    subjectController.dispose();
    super.onClose();
  }
}
