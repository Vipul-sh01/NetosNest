import 'package:NotesNest/Constents/AppConstents.dart';
import 'package:NotesNest/Utility/ResponsiveUtils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Constents/AppStyles.dart';
import '../../ViewModels/DarkModeViewModels.dart';
import '../RentCard/OfferBottom.dart';
import '../RentCard/OfferHeader.dart';

class SearchCard extends StatelessWidget {
  final Color color;
  final String text;
  final String? courseName;
  final String imageUrl;

  SearchCard({
    super.key,
    required this.color,
    required this.text,
    required this.imageUrl,
    this.courseName,
  });

  final LightModeController lightModeController =
      Get.put(LightModeController());

  @override
  Widget build(BuildContext context) {
    // Check if image URL is valid
    final bool isImageValid =
        imageUrl.isNotEmpty && Uri.tryParse(imageUrl)?.hasAbsolutePath == true;

    return Obx(
      () => Padding(
        padding: ResponsiveUtils.paddingAll(0.017),
        child: Container(
          padding: ResponsiveUtils.paddingOnly(
              topPercent: 0.005,
              bottomPercent: 0.012,
              leftPercent: 0.025,
              rightPercent: 0.04),
          decoration: BoxDecoration(
            color: lightModeController.isLightMode.value
                ? AppConstants.topNotesIcons
                : Colors.white,
            borderRadius: ResponsiveUtils.circular(0.02),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    OfferHeader(
                      color: color,
                      courseName: courseName,
                    ),
                    SizedBox(height: ResponsiveUtils.height(0.01)),
                    OfferBottom(
                      text: text,
                    ),
                  ],
                ),
              ),
              SizedBox(width: ResponsiveUtils.width(0.01)),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: isImageValid
                        ? Container(
                            color: Colors.white,
                            child: Image.network(
                              imageUrl,
                              width: ResponsiveUtils.width(0.25),
                              height: ResponsiveUtils.height(0.11),
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  Icon(Icons.broken_image, size: ResponsiveUtils.iconSize(0.05)),
                              loadingBuilder:
                                  (context, child, loadingProgress) {
                                if (loadingProgress == null) return child;
                                return SizedBox(
                                  width: ResponsiveUtils.width(0.25),
                                  height: ResponsiveUtils.height(0.11),
                                  child: Center(
                                      child: CircularProgressIndicator()),
                                );
                              },
                            ),
                          )
                        : Container(
                            width: ResponsiveUtils.width(0.25),
                            height: ResponsiveUtils.height(0.11),
                            color: Colors.pink,
                            child: Icon(Icons.image_not_supported, size: ResponsiveUtils.iconSize(0.05)),
                          ),
                  ),
                  Positioned(
                    bottom: ResponsiveUtils.height(-0.016),
                    right: ResponsiveUtils.width(-0.04),
                    child: Container(
                      padding: ResponsiveUtils.paddingSymmetric(horizontalPercent: 0.0156, verticalPercent: 0.003),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.0),
                        borderRadius: ResponsiveUtils.circular(0.01),
                      ),
                      child: Text(
                        "+2",
                        style: AppStyles.whiteBoldSmall,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
