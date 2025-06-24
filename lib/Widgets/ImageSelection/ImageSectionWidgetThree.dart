import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Constents/AppConstents.dart';
import '../../Utility/ResponsiveUtils.dart';
import '../../ViewModels/ImageSectionViewModels.dart';
import 'NetWorkImage.dart';


class ImageSectionWidgetThree extends StatelessWidget {
  final ImageSectionController controller;

  ImageSectionWidgetThree({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Horizontal scrollable Row of images
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ImageContainers(imagePath: '', index: 0, currentPage: controller.currentPage2),
              ImageContainers(imagePath: '', index: 1, currentPage: controller.currentPage2),
              ImageContainers(imagePath: '', index: 2, currentPage: controller.currentPage2),
            ],
          ),
        ),
        // Hollow dots indicator
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
                    width: ResponsiveUtils.width(0.015),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: controller.currentPage2.value == index ? AppConstants.darkContainerColor : Colors.transparent,
                  border: Border.all(
                    color: controller.currentPage2.value == index ? AppConstants.darkContainerColor : AppConstants.textColor,
                    width: ResponsiveUtils.width(0.002),
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
