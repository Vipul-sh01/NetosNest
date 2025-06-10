import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdfx/pdfx.dart';

import '../../ViewModels/PdfViewer/ModulePdfController.dart';
import '../../Models/NoteModel.dart';
import '../../Services/PdfService.dart';

class PdfViewerScreen extends StatelessWidget {
  final NoteModel note;
  const PdfViewerScreen({Key? key, required this.note}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ModulePdfController controller =
    Get.put(ModulePdfController(note, PdfService()));

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('PDF Viewer'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black87,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE3F2FD), Color(0xFFBBDEFB)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.only(
          top: kToolbarHeight + 16,
          left: 12,
          right: 12,
          bottom: 12,
        ),
        child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent),
              ),
            );
          }
          final error = controller.errorMessage.value;
          if (error != null && error.isNotEmpty) {
            return Center(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.red[50],
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.red.withOpacity(0.2),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Text(
                  'Error:\n$error',
                  style: const TextStyle(color: Colors.red, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }

          final pdfCtrl = controller.pdfController;
          if (pdfCtrl == null) {
            return const Center(
              child: Text(
                'Failed to load PDF.',
                style: TextStyle(color: Colors.red, fontSize: 16),
              ),
            );
          }

          return LayoutBuilder(
            builder: (context, constraints) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(8),
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                child: PdfViewPinch(
                  controller: pdfCtrl,
                  scrollDirection: Axis.vertical,
                  onPageChanged: controller.handlePageChanged,
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
