import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Constents/AppConstents.dart';
import '../Constents/AppStyles.dart';
import '../Utility/ResponsiveUtils.dart';
import '../ViewModels/DarkModeViewModels.dart';
import '../ViewModels/ImageSectionViewModels.dart';
import '../ViewModels/ThreeNoteViewModels.dart';
import '../Widgets/BottonBar/BottomBar.dart';
import '../Widgets/ImageSelection/ImageSectionWidget.dart';
import '../Widgets/ImageSelection/ImageSectionWidgetThree.dart';
import '../Widgets/ImageSelection/ImageSectionWidgetTwo.dart';
import '../Widgets/LibraryOptionWidget.dart';
import '../Widgets/NarrowContainer.dart';
import 'NoteListScreen.dart';

class FeedScreen extends StatelessWidget {
  final ImageSectionController imageController =
      Get.put(ImageSectionController());
  final LightModeController lightModeController =
      Get.put(LightModeController());
  final ThreeNoteController threeNoteController =
      Get.put(ThreeNoteController());

  FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isLightMode = lightModeController.isLightMode.value;
      final textColor = isLightMode ? Colors.black : Colors.white;

      return Scaffold(
        backgroundColor: isLightMode ? Colors.white : Colors.black,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: isLightMode ? AppConstants.appBackGroundColor : Colors.white,
          title: Text(
            AppConstants.noteSwapTexts,
            style: AppStyles.textStyleLargeBold,
          ),
          elevation: 0,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NarrowContainer(isLightMode: isLightMode),
              SizedBox(height: ResponsiveUtils.height(0.02)),
              Padding(
                padding:
                    ResponsiveUtils.paddingSymmetric(horizontalPercent: 0.03),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSectionTitle("Explore our Library", textColor),
                    SizedBox(height: ResponsiveUtils.height(0.013)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        LibraryOptionWidget(
                          iconPath: AppConstants.container1Icon,
                          label: "Available Notes",
                          onTap: () => Get.to(NoteListScreen()),
                          containerColor: isLightMode
                              ? AppConstants.availNotes
                              : AppConstants.lightContainerColor,
                          svgColor: isLightMode ? AppConstants.availNotesIcons : Colors.white,
                        ),
                        LibraryOptionWidget(
                          iconPath: AppConstants.container2Icon,
                          label: "Newly added",
                          onTap: () {},
                          containerColor: isLightMode
                              ? AppConstants.newlyNotes
                              : AppConstants.lightContainerColor,
                          svgColor: isLightMode ? AppConstants.newlyNotesIcons : Colors.white,
                        ),
                        LibraryOptionWidget(
                          iconPath: AppConstants.container3Icon,
                          label: "Top selling",
                          onTap: () {},
                          containerColor: isLightMode
                              ? AppConstants.topNotes
                              : AppConstants.lightContainerColor,
                          svgColor: isLightMode ? AppConstants.topNotesIcons : Colors.white,
                        ),
                      ],
                    ),
                    SizedBox(height: ResponsiveUtils.height(0.02)),
                    _buildSectionTitle("Explore the Departments", textColor),
                    SizedBox(height: ResponsiveUtils.height(0.013)),
                    ImageSectionWidget(controller: imageController),
                    SizedBox(height: ResponsiveUtils.height(0.02)),
                    _buildSectionTitle("Get Handwritten Notes", textColor),
                    SizedBox(height: ResponsiveUtils.height(0.013)),
                    ImageSectionWidgetTwo(controller: imageController),
                    SizedBox(height: ResponsiveUtils.height(0.02)),
                    _buildSectionTitle("Sell Your Notes", textColor),
                    SizedBox(height: ResponsiveUtils.height(0.013)),
                    ImageSectionWidgetThree(controller: imageController),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavBar(),
      );
    });
  }

  Widget _buildSectionTitle(String title, Color color) {
    return Text(
      title,
      style: AppStyles.customBoldStyle(
        AppStyles.lightModeController.isLightMode.value ? Colors.black.withOpacity(0.70) : Colors.white,
      ),
    );
  }
}
