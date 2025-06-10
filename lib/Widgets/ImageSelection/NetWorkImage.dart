import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Constents/AppConstents.dart';
import '../../Models/NoteModel.dart';
import '../../Utility/showSnackbar.dart';
import '../../ViewModels/DarkModeViewModels.dart';
import '../../Views/dhsdh.dart'; // Remove if unused

class ImageContainers extends StatelessWidget {
  final String imagePath;
  final int index;
  final RxInt currentPage;
  final NoteModel? note;

  ImageContainers({
    required this.imagePath,
    required this.index,
    required this.currentPage,
    this.note,
    Key? key,
  }) : super(key: key);

  final LightModeController lightModeController = Get.find<LightModeController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        currentPage.value = index;
        if (note != null) {
          Get.to(() => PdfViewerScreen(note: note!));
        } else {
          DialogUtils.showSnackbar("Error", "Note data is missing for this preview.");
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(2, 2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            imagePath,
            fit: BoxFit.fitWidth,
            width: 120,
            height: 160,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Container(
                width: 120,
                height: 160,
                alignment: Alignment.center,
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!
                      : null,
                ),
              );
            },
            errorBuilder: (context, error, stackTrace) {
              return Container(
                width: 120,
                height: 160,
                decoration: BoxDecoration(
                  color: lightModeController.isLightMode.value
                      ? AppConstants.darkContainerColor
                      : AppConstants.lightContainerColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(Icons.broken_image, size: 40, color: Colors.grey),
              );
            },
          ),
        ),
      ),
    );
  }
}
