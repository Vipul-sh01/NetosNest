import 'dart:io';
import 'dart:typed_data';
import 'package:get/get.dart';
import 'package:pdfx/pdfx.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import '../../Models/NoteModel.dart';
import '../../Services/PdfService.dart';
import '../../Widgets/AccessDenined.dart';

class ModulePdfController extends GetxController {
  final NoteModel note;
  final PdfService _pdfService;

  ModulePdfController(this.note, this._pdfService);

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
      // Get the fileUrl
      final String url = _getPdfUrl();

      if (url.isEmpty) {
        throw Exception("PDF URL is empty.");
      }

      debugPrint('🔗 PDF URL: $url');

      // Fetch the PDF bytes
      final Uint8List pdfBytes = await _pdfService.getPdfBytes(url);

      if (pdfBytes.isEmpty) {
        throw Exception("Fetched PDF bytes are empty.");
      }

      debugPrint('📦 PDF byte length: ${pdfBytes.length}');
      debugPrint('📄 PDF Header: ${String.fromCharCodes(pdfBytes.take(10))}');

      // Save the PDF to a temporary file
      final tempDir = await getTemporaryDirectory();
      final tempFile = File('${tempDir.path}/temp_pdf.pdf');
      await tempFile.writeAsBytes(pdfBytes);

      debugPrint('📂 PDF saved to: ${tempFile.path}');

      // Open the PDF document from the saved file
      final document = await PdfDocument.openFile(tempFile.path);
      pdfController = PdfControllerPinch(document: Future.value(document));

      errorMessage.value = null;
    } catch (e, stackTrace) {
      errorMessage.value = e.toString();
      debugPrint('❌ Error initializing PDF: $e');
      debugPrint('📛 Stack trace: $stackTrace');
    } finally {
      isLoading.value = false;
    }
  }

  String _getPdfUrl() {
    // Check for a valid fileUrl
    final moduleWithFileUrl = note.modules.firstWhereOrNull(
          (m) => m.fileUrl.isNotEmpty,
    );

    if (moduleWithFileUrl != null) {
      allowAllPages.value = moduleWithFileUrl.isPurchased; // Allow all pages if purchased
      return moduleWithFileUrl.fileUrl;
    }

    throw Exception('No valid fileUrl available.');
  }

  void handlePageChanged(int page) {
    if (!allowAllPages.value && page > 3) {
      pdfController?.jumpToPage(2);
      showAccessDeniedDialog();
    }
  }



  @override
  void onClose() {
    pdfController?.dispose();
    super.onClose();
  }
}
