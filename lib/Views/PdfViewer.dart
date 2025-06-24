import 'package:NotesNest/Constents/AppConstents.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdfx/pdfx.dart';

import '../../ViewModels/PdfViewer/ModulePdfController.dart';
import '../../Models/NoteModel.dart';
import '../../Services/PdfService.dart';
import '../Models/ModuleModels.dart';
import '../Utility/ResponsiveUtils.dart';

class PdfViewerScreen extends StatelessWidget {
  final NoteModel note;
  final ModuleModel? module;
  const PdfViewerScreen({Key? key, required this.note, this.module}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    final ModulePdfController controller =
    Get.put(ModulePdfController(note: note, module: module, pdfService: PdfService(),));

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'PDF Viewer',
          style: TextStyle(fontSize: ResponsiveUtils.fontSize(0.05)),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black87,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppConstants.topNotes, AppConstants.appBackGroundColor],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: ResponsiveUtils.paddingOnly(
          topPercent: (kToolbarHeight / Get.height) + 0.02,
          bottomPercent: 0.015,
          leftPercent: 0.03,
          rightPercent: 0.03,
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
                padding: ResponsiveUtils.paddingAll(0.02),
                decoration: BoxDecoration(
                  color: Colors.red[50],
                  borderRadius: BorderRadius.circular(ResponsiveUtils.width(0.03)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.red.withOpacity(0.2),
                      blurRadius: ResponsiveUtils.blurRadius(0.01),
                      offset: ResponsiveUtils.shadowOffset(x: 0.0, y: 0.01),
                    ),
                  ],
                ),
                child: Text(
                  'Error:\n$error',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: ResponsiveUtils.fontSize(0.038),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }

          final pdfCtrl = controller.pdfController;
          if (pdfCtrl == null) {
            return Center(
              child: Text(
                'Failed to load PDF.',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: ResponsiveUtils.fontSize(0.038),
                ),
              ),
            );
          }

          return LayoutBuilder(
            builder: (context, constraints) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(ResponsiveUtils.width(0.04)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: ResponsiveUtils.blurRadius(0.02),
                      offset: ResponsiveUtils.shadowOffset(x: 0, y: 0.015),
                    ),
                  ],
                ),
                padding: ResponsiveUtils.paddingAll(0.015),
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
