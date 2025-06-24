import 'package:NotesNest/Utility/ResponsiveUtils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Constents/AppConstents.dart';
import '../../ViewModels/DarkModeViewModels.dart';

class ImageContainer extends StatelessWidget {
  final String imagePath;
  final int index;
  final RxInt currentPage;
  final Color color;

  ImageContainer({
    required this.imagePath,
    required this.index,
    required this.currentPage,
    required this.color,
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
              color: color,
              blurRadius: ResponsiveUtils.blurRadius(0.00),
              // offset: ResponsiveUtils.shadowOffset(x: 0.001, y: 0.001),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            imagePath,
            fit: BoxFit.fitWidth,
            width: ResponsiveUtils.width(0.29),
            height: ResponsiveUtils.height(0.165),
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
