import 'dart:io';
import 'dart:typed_data';
import 'package:get/get.dart';
import 'package:pdfx/pdfx.dart';
import 'package:path_provider/path_provider.dart';
import '../../Models/NoteModel.dart';
import '../../Models/ModuleModels.dart';
import '../../Services/PdfService.dart';
import '../../Widgets/AccessDenined.dart';

class ModulePdfController extends GetxController {
  final NoteModel note;
  final ModuleModel? module;
  final PdfService _pdfService;

  ModulePdfController({
    required this.note,
    this.module,
    required PdfService pdfService,
  }) : _pdfService = pdfService;

  PdfControllerPinch? pdfController;
  final isLoading = true.obs;
  final allowAllPages = false.obs;
  final errorMessage = RxnString();

  bool get isInitialized => pdfController != null && !isLoading.value;

  @override
  void onInit() {
    super.onInit();
    _initPdf();
  }

  Future<void> _initPdf() async {
    isLoading.value = true;

    try {
      final String url = module?.fileUrl ?? note.modules.first.fileUrl;

      if (url.isEmpty) {
        throw Exception("PDF URL is empty.");
      }

      final Uint8List pdfBytes = await _pdfService.getPdfBytes(url);

      if (pdfBytes.isEmpty) {
        throw Exception("Fetched PDF bytes are empty.");
      }

      final tempDir = await getTemporaryDirectory();
      final tempFile = File('${tempDir.path}/temp_${DateTime.now().millisecondsSinceEpoch}.pdf');
      await tempFile.writeAsBytes(pdfBytes);


      final document = await PdfDocument.openFile(tempFile.path);
      pdfController = PdfControllerPinch(document: Future.value(document));

      allowAllPages.value = module?.isPurchased ?? true;

      errorMessage.value = null;
    } catch (e, stackTrace) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  void handlePageChanged(int page) {
    // if (!(allowAllPages.value) && page > 3) {
    //   pdfController?.jumpToPage(2);
    //   showAccessDeniedDialog();
    // }
  }

  @override
  void onClose() {
    pdfController?.dispose();
    super.onClose();
  }
}
