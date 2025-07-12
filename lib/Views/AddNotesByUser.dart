import 'dart:io';
import 'package:NotesNest/Utility/ResponsiveUtils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Constents/AppConstents.dart';
import '../Constents/AppStyles.dart';
import '../Utility/ModuleEnum.dart';
import '../Models/UserModels.dart';
import '../ViewModels/CalenderViewModels.dart';
import '../ViewModels/DarkModeViewModels.dart';
import '../ViewModels/NotesUploadsViewsModels/NoteUploadViewModels.dart';
import '../Widgets/BottonBar/BottomBar.dart';
import '../Widgets/Buttons/BackWidgets.dart';
import '../Widgets/Buttons/ButtonWidgets.dart';
import '../Widgets/CustomTextField.dart';
import '../Widgets/NarrowContainer.dart';
import 'FeedScreen.dart';
import 'UserUpdateProfile.dart';

class UploadNoteScreen extends StatelessWidget {
  final UserModel user;
  final NoteUploadController c = Get.put(NoteUploadController());
  final CalendarController controller = Get.put(CalendarController());
  final LightModeController lightModeController =
      Get.find<LightModeController>();

  UploadNoteScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: lightModeController.isLightMode.value
            ? AppConstants.appBackGroundColor
            : Colors.white,
        leading: BackWidget(
          onTap: () {
            Get.off(() => FeedScreen());
          },
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
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NarrowContainer(isLightMode: lightModeController.isLightMode.value),
            Padding(
              padding: ResponsiveUtils.paddingOnly(
                  rightPercent: 0.02, leftPercent: 0.02, bottomPercent: 0.02),
              child: Obx(() => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: ResponsiveUtils.height(0.01)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextField(
                            controller: c.titleController,
                            label: 'Title',
                          ),
                          CustomTextField(
                            controller: c.courseCodeController,
                            label: 'Course Code',
                          ),
                          CustomTextField(
                            controller: c.courseNameController,
                            label: 'Course Name',
                          ),
                          CustomTextField(
                            controller: c.subjectController,
                            label: 'Subject',
                          ),
                        ],
                      ),
                      SizedBox(height: ResponsiveUtils.height(0.01)),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: ResponsiveUtils.circular(0.02),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: ResponsiveUtils.radius(0.015),
                              offset: ResponsiveUtils.shadowOffset(
                                  x: 0.0, y: 0.004),
                            ),
                          ],
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<ModuleName>(
                            value: c.selectedModule.value,
                            isExpanded: true,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            items: ModuleName.values
                                .map((e) => DropdownMenuItem(
                                      value: e,
                                      child: Text(e.name),
                                    ))
                                .toList(),
                            onChanged: (v) => c.selectedModule.value = v!,
                          ),
                        ),
                      ),
                      SizedBox(height: ResponsiveUtils.height(0.015)),
                      Text(
                        "Upload Preview of Notes",
                        style: AppStyles.boldMediumText,
                      ),
                      SizedBox(height: ResponsiveUtils.height(0.02)),
                      Center(
                        child: Container(
                          width: ResponsiveUtils.width(0.96),
                          padding: ResponsiveUtils.paddingAll(0.03),
                          decoration: BoxDecoration(
                            color: lightModeController.isLightMode.value
                                ? AppConstants.appBackGroundColor
                                : Colors.white,
                            borderRadius: ResponsiveUtils.circular(0.02),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: ResponsiveUtils.radius(0.015))
                            ],
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Upload your files",
                                style: AppStyles.whiteBoldLarge,
                              ),
                              SizedBox(height: ResponsiveUtils.height(0.02)),
                              GestureDetector(
                                onTap: () => c.pickFile(user),
                                child: Container(
                                  width: double.infinity,
                                  padding: ResponsiveUtils.paddingAll(0.02),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: ResponsiveUtils.circular(0.02),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black12,
                                          blurRadius: ResponsiveUtils.radius(0.015))
                                    ],
                                  ),
                                  child: Column(
                                    children: [
                                      Icon(Icons.folder,
                                          size: ResponsiveUtils.iconSize(0.15),
                                          color: Colors.amber),
                                      SizedBox(
                                          height: ResponsiveUtils.height(0.01)),
                                      Text(
                                        c.fileName.value.isEmpty
                                            ? "Drag and drop your files here"
                                            : c.fileName.value,
                                        style: AppStyles.baseTextLarge,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: ResponsiveUtils.height(0.022)),
                              Padding(
                                padding: ResponsiveUtils.paddingSymmetric(horizontalPercent: 0.03, verticalPercent: 0.01),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        "My upLoad",
                                        style: AppStyles.whiteNormalText,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    if (c.fileName.value.isNotEmpty)
                                      Expanded(
                                        flex: 5,
                                        child: LinearProgressIndicator(
                                          backgroundColor: Colors.white24,
                                          color: Colors.blue,
                                          minHeight:
                                              ResponsiveUtils.height(0.007),
                                          value: c.uploadProgress.value,
                                        ),
                                      ),
                                    IconButton(
                                      icon: const Icon(Icons.refresh,
                                          color: Colors.white),
                                      onPressed: () => c.pickFile(user),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: ResponsiveUtils.height(0.032)),
                      Text("Set Price",style: AppStyles.textStyleMediums,),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.black,
                          inactiveTrackColor: Colors.black54,
                          thumbColor: Colors.black,
                          overlayColor: Colors.black.withAlpha(32),
                          valueIndicatorColor: Colors.purpleAccent,
                        ),
                        child: Slider(
                          value: c.modulePrice.value,
                          min: 0,
                          max: 150,
                          divisions: 30,
                          label: "₹${c.modulePrice.value.toInt()}",
                          onChanged: (val) => c.modulePrice.value = val,
                        ),
                      ),
                      Text("Price: ₹${c.modulePrice.value.toInt()}", style: AppStyles.textStyleMediums,),
                      SizedBox(height: ResponsiveUtils.height(0.01)),
                      // Display added modules
                      SizedBox(height: ResponsiveUtils.height(0.01)),
                      Center(
                        child: Obx(
                          () => c.isLoading.value
                              ? const CircularProgressIndicator()
                              : ButtonWidgets(
                                  onTap: () async {
                                    bool isSuccess =
                                        await c.addModuleAndUploadNote(user);
                                    if (isSuccess) {
                                      Get.to(FeedScreen());
                                    }
                                  },
                                  buttonText: AppConstants.loginTitle,
                                ),
                        ),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
