import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Constents/AppConstents.dart';
import '../Constents/AppStyles.dart';
import '../Utility/ResponsiveUtils.dart';
import '../ViewModels/DarkModeViewModels.dart';
import '../ViewModels/ImageSectionViewModels.dart';
import '../ViewModels/ThreeNoteViewModels.dart';
import '../Widgets/BottonBar/BottomBar.dart';
import '../Widgets/Buttons/BackWidgets.dart';
import '../Widgets/ImageSelection/ImageSectionWidget.dart';
import '../Widgets/ImageSelection/ImageSectionWidgetThree.dart';
import '../Widgets/ImageSelection/ImageSectionWidgetTwo.dart';
import '../Widgets/LibraryOptionWidget.dart';
import '../Widgets/NarrowContainer.dart';
import 'NoteListScreen.dart';

class FeedScreen extends StatelessWidget {
  final ImageSectionController imageController = Get.put(ImageSectionController());
  final LightModeController lightModeController = Get.put(LightModeController());
  final ThreeNoteController threeNoteController = Get.put(ThreeNoteController());

  FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor:
            lightModeController.isLightMode.value ? Colors.white : Colors.black,
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: lightModeController.isLightMode.value
              ? Colors.black
              : Colors.white,
          leading: BackWidget(
            onTap: () {},
            imagePath: lightModeController.isLightMode.value
                ? AppConstants.backWhiteIcon
                : AppConstants.backBlackIcon,
          ),
          title: Text(
            AppConstants.noteSwapTexts,
            style: AppStyles.textStyleLargeBold,
          ),
          elevation: 0,
          centerTitle: true,
          actions: [
            BackWidget(
              onTap: () {},
              imagePath: lightModeController.isLightMode.value
                  ? AppConstants.whiteSettingIcon
                  : AppConstants.blackSettingIcon,
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Container
              NarrowContainer(
                isLightMode: lightModeController.isLightMode.value,
              ),
              SizedBox(height: ResponsiveUtils.height(0.02)),
              Padding(padding: ResponsiveUtils.paddingSymmetric(horizontalPercent: 0.03),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Explore our Library",
                      style: TextStyle(
                        fontSize: ResponsiveUtils.fontSize(0.039),
                        fontWeight: FontWeight.bold,
                        color: lightModeController.isLightMode.value
                            ? Colors.black
                            : Colors.white,
                      ),
                    ),
                    SizedBox(height: ResponsiveUtils.height(0.013)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        LibraryOptionWidget(
                          iconPath: AppConstants.container1Icon,
                          label: "Available Notes",
                          onTap: () {
                            Get.to(NoteListScreen());
                          },
                        ),
                        LibraryOptionWidget(
                          iconPath: AppConstants.container2Icon,
                          label: "Newly added",
                          onTap: () {},
                        ),
                        LibraryOptionWidget(
                          iconPath: AppConstants.container3Icon,
                          label: "Top selling",
                          onTap: () {},
                        ),
                      ],
                    ),
                    SizedBox(height: ResponsiveUtils.height(0.013)),
                    Text(
                      "Explore the Departments",
                      style: TextStyle(
                        fontSize: ResponsiveUtils.fontSize(0.039),
                        fontWeight: FontWeight.bold,
                        color: lightModeController.isLightMode.value
                            ? Colors.black
                            : Colors.white,
                      ),
                    ),
                    SizedBox(height: ResponsiveUtils.height(0.013)),
                    ImageSectionWidget(controller: imageController),
                    SizedBox(height: ResponsiveUtils.height(0.018)),
                    Text(
                      "GET HANDWRITTEN NOTES",
                      style: TextStyle(
                        fontSize: ResponsiveUtils.fontSize(0.039),
                        fontWeight: FontWeight.bold,
                        color: lightModeController.isLightMode.value
                            ? Colors.black
                            : Colors.white,
                      ),
                    ),
                    SizedBox(height: ResponsiveUtils.height(0.013)),
                    ImageSectionWidgetTwo(controller: imageController,),
                    SizedBox(height: ResponsiveUtils.height(0.018)),
                    Text(
                      "SELL YOUR NOTES",
                      style: TextStyle(
                        fontSize: ResponsiveUtils.fontSize(0.039),
                        fontWeight: FontWeight.bold,
                        color: lightModeController.isLightMode.value
                            ? Colors.black
                            : Colors.white,
                      ),
                    ),
                    SizedBox(height: ResponsiveUtils.height(0.013)),
                    ImageSectionWidgetThree(controller: imageController),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavBar(),
      ),
    );
  }
}
