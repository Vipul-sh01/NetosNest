import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Constents/AppConstents.dart';
import '../../Models/NoteModel.dart';
import '../../Utility/ResponsiveUtils.dart';
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
        margin: ResponsiveUtils.marginSymmetric(horizontalPercent: 0.01),
        decoration: BoxDecoration(
          borderRadius: ResponsiveUtils.circular(0.02),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: ResponsiveUtils.blurRadius(0.025),
              offset: ResponsiveUtils.shadowOffset(x: 0.001, y: 0.001),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: ResponsiveUtils.circular(0.02),
          child: Image.network(
            imagePath,
            fit: BoxFit.fitWidth,
            width: ResponsiveUtils.width(0.29),
            height: ResponsiveUtils.height(0.19),
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Container(
                width: ResponsiveUtils.width(0.29),
                height: ResponsiveUtils.height(0.19),
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
                width: ResponsiveUtils.width(0.29),
                height: ResponsiveUtils.height(0.19),
                decoration: BoxDecoration(
                  color: lightModeController.isLightMode.value
                      ? AppConstants.darkContainerColor
                      : AppConstants.lightContainerColor,
                  borderRadius: ResponsiveUtils.circular(0.02),
                ),
                child: Icon(
                  Icons.broken_image,
                  size: ResponsiveUtils.iconSize(0.09),
                  color: Colors.grey,
                ),

              );
            },
          ),
        ),
      ),
    );
  }
}
