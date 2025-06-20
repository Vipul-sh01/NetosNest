import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Constents/AppConstents.dart';
import '../../Utility/ResponsiveUtils.dart';
import '../../ViewModels/ImageSectionViewModels.dart';
import 'ImageContainer.dart';


class ImageSectionWidget extends StatelessWidget {
  final ImageSectionController controller;

  ImageSectionWidget({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Horizontal scrollable Row of images
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ImageContainer(imagePath: 'assets/Designer27.png', index: 0, currentPage: controller.currentPage),
              ImageContainer(imagePath: 'assets/Designer28.png', index: 1, currentPage: controller.currentPage),
              ImageContainer(imagePath: '', index: 2, currentPage: controller.currentPage),
            ],
          ),
        ),
        SizedBox(height: ResponsiveUtils.height(0.01)),
        Obx(() {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              3,
                  (index) => AnimatedContainer(
                duration: Duration(milliseconds: 300),
                margin: ResponsiveUtils.marginSymmetric(horizontalPercent: 0.01),
                height: ResponsiveUtils.height(0.01),
                width: ResponsiveUtils.width(0.02),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: controller.currentPage.value == index ? AppConstants.darkContainerColor : Colors.transparent,
                  border: Border.all(
                    color: controller.currentPage.value == index ? AppConstants.darkContainerColor : AppConstants.iconNoteColors,
                    width: ResponsiveUtils.width(0.006),
                  ),
                ),
              ),
            ),
          );
        }),
      ],
    );
  }
}
