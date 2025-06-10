import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Constents/AppConstents.dart';
import '../../Utility/CourseEnum.dart';
import '../../ViewModels/DarkModeViewModels.dart'; // Assuming the LightModeController is defined here
import '../../ViewModels/filter.dart';
import '../../Views/YourScreen.dart';

void showFilterSheet(BuildContext context, NotesFilterController controller,
    LightModeController lightModeController) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (_) {
      return Padding(
        padding: const EdgeInsets.all(16),
        child: Obx(() {
          // Get the current light mode value
          bool isLightMode = lightModeController.isLightMode.value;

          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Title with dynamic color based on light mode
              Text(
                "Filter Notes",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: isLightMode ? Colors.black : Colors.white,
                ),
              ),
              const SizedBox(height: 16),

              // Dropdown from Enum
              DropdownButton<CourseName>(
                value: controller.selectedCourse.value,
                hint: Text(
                  "Select Course",
                  style: TextStyle(
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
                        color: isLightMode ? Colors.black : Colors.white,
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (CourseName? value) {
                  controller.selectedCourse.value = value;
                },
              ),

              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Reset button with dynamic color
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppConstants.boxColor,
                    ),
                    child: Text(
                      "Reset",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      controller.resetFilters();
                      Get.back();
                    },
                  ),
                  // Apply button with dynamic color
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppConstants.boxColor,
                    ),
                    child: Text(
                      "Apply",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      controller.applyFilters();
                      Get.to(YourPage());
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
