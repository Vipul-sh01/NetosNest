import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Constents/AppConstents.dart';
import '../../Utility/CourseEnum.dart';
import '../../ViewModels/DarkModeViewModels.dart';
import '../../ViewModels/filter.dart';
import '../../Views/YourScreen.dart';
import '../../Utility/ResponsiveUtils.dart';

void showFilterSheet(BuildContext context, NotesFilterController controller,
    LightModeController lightModeController) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(ResponsiveUtils.width(0.03)),
      ),
    ),
    builder: (_) {
      return Padding(
        padding: ResponsiveUtils.paddingAll(0.03),
        child: Obx(() {
          bool isLightMode = lightModeController.isLightMode.value;

          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Filter Notes",
                style: TextStyle(
                  fontSize: ResponsiveUtils.fontSize(0.045),
                  fontWeight: FontWeight.bold,
                  color: isLightMode ? Colors.black : Colors.white,
                ),
              ),
              SizedBox(height: ResponsiveUtils.height(0.02)),
              DropdownButton<CourseName>(
                value: controller.selectedCourse.value,
                hint: Text(
                  "Select Course",
                  style: TextStyle(
                    fontSize: ResponsiveUtils.fontSize(0.04),
                    color: isLightMode ? Colors.black : Colors.white,
                  ),
                ),
                isExpanded: true,
                items: CourseName.values.map((course) {
                  return DropdownMenuItem(
                    value: course,
                    child: Text(
                      course.label,
                      style: TextStyle(
                        fontSize: ResponsiveUtils.fontSize(0.04),
                        color: isLightMode ? Colors.black : Colors.white,
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (CourseName? value) {
                  controller.selectedCourse.value = value;
                },
              ),
              SizedBox(height: ResponsiveUtils.height(0.02)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppConstants.boxColor,
                      padding: ResponsiveUtils.paddingSymmetric(
                          verticalPercent: 0.01, horizontalPercent: 0.08),
                      shape: RoundedRectangleBorder(
                        borderRadius: ResponsiveUtils.circular(0.02),
                      ),
                    ),
                    child: Text(
                      "Reset",
                      style: TextStyle(
                        fontSize: ResponsiveUtils.fontSize(0.04),
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      controller.resetFilters();
                      Get.back();
                    },
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppConstants.boxColor,
                      padding: ResponsiveUtils.paddingSymmetric(
                          verticalPercent: 0.01, horizontalPercent: 0.08),
                      shape: RoundedRectangleBorder(
                          borderRadius: ResponsiveUtils.circular(0.02)),
                    ),
                    child: Text(
                      "Apply",
                      style: TextStyle(
                        fontSize: ResponsiveUtils.fontSize(0.04),
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      controller.applyFilters();
                      Get.to(() => YourPage());
                    },
                  ),
                ],
              )
            ],
          );
        }),
      );
    },
  );
}
