import 'package:NotesNest/Utility/ResponsiveUtils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Constents/AppConstents.dart';
import '../../ViewModels/DarkModeViewModels.dart';

class ImageContainer extends StatelessWidget {
  final String imagePath;
  final int index;
  final RxInt currentPage;

  ImageContainer({
    required this.imagePath,
    required this.index,
    required this.currentPage,
  });

  final LightModeController lightModeController = Get.put(LightModeController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        currentPage.value = index;
      },
      child: Container(
        margin: ResponsiveUtils.marginSymmetric(horizontalPercent: 0.01),
        decoration: BoxDecoration(
          borderRadius: ResponsiveUtils.circular(0.02),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: ResponsiveUtils.blurRadius(0.025),
              offset: ResponsiveUtils.shadowOffset(x: 0.001, y: 0.001),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            imagePath,
            fit: BoxFit.fitWidth,
            width: ResponsiveUtils.width(0.29),
            height: ResponsiveUtils.height(0.19),
            errorBuilder: (context, error, stackTrace) {
              return Container(
                width: ResponsiveUtils.width(0.29),
                height: ResponsiveUtils.height(0.19),
                decoration: BoxDecoration(
                  color: lightModeController.isLightMode.value ? AppConstants.darkContainerColor : AppConstants.lightContainerColor,
                  borderRadius: ResponsiveUtils.circular(0.02),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
