import 'package:NotesNest/Utility/ResponsiveUtils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Constents/AppConstents.dart';
import '../Constents/AppStyles.dart';
import '../Services/ImagePicker.dart';
import '../ViewModels/AuthViewModels/AuthControllers.dart';
import '../ViewModels/DarkModeViewModels.dart';
import '../Widgets/BottonBar/BottomBar.dart';
import '../Widgets/Buttons/BackWidgets.dart';
import '../Widgets/Buttons/ButtonWidgets.dart';
import '../Widgets/Profile/CustomTextFild.dart';
import '../Widgets/ProfileAvatar.dart';
import 'ProfileScreen.dart';

class AddUsers extends StatelessWidget {
  AddUsers({Key? key}) : super(key: key);

  final LightModeController lightModeController =
      Get.put(LightModeController());
  final ImagePickerService imagePickerService = Get.put(ImagePickerService());
  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor:
            lightModeController.isLightMode.value ? Colors.black : Colors.white,
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
          child: Padding(
            padding: ResponsiveUtils.paddingAll(0.01),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: Icon(
                      lightModeController.isLightMode.value
                          ? Icons.wb_sunny_outlined
                          : Icons.nightlight_round,
                      color: lightModeController.isLightMode.value
                          ? Colors.white
                          : Colors.black,
                    ),
                    onPressed: lightModeController.toggleLightMode,
                  ),
                ),
                ProfileAvatar(
                  onCameraTap: () {
                    authController.getDialog();
                  },
                  imagePath: imagePickerService.imageFile.value?.path ??
                      AppConstants.defaultProfileImage,
                ),
                SizedBox(height: ResponsiveUtils.height(0.01)),
                Padding(
                  padding: ResponsiveUtils.paddingAll(0.02),
                  child: Column(
                    children: [
                      CustomTextField(
                        label: "Name",
                        controller: authController.nameController,
                        isDarkMode: lightModeController.isLightMode.value,
                      ),
                      CustomTextField(
                        label: "Room No",
                        controller: authController.roomNoController,
                        isDarkMode: lightModeController.isLightMode.value,
                      ),
                      CustomTextField(
                        label: "Department",
                        controller: authController.departmentController,
                        isDarkMode: lightModeController.isLightMode.value,
                      ),
                      CustomTextField(
                        label: "Block",
                        controller: authController.blockController,
                        isDarkMode: lightModeController.isLightMode.value,
                      ),
                      SizedBox(height: ResponsiveUtils.height(0.02)),
                      Obx(
                        () => authController.isLoading.value
                            ? CircularProgressIndicator()
                            : ButtonWidgets(
                            onTap: () async {
                              bool isSuccess = await authController.updateUser();
                              if (isSuccess) {
                                Get.to(ProfileScreen());
                              }
                              else{
                                Get.off(AddUsers());
                              }
                            },
                                buttonText: 'Save'),
                      ),
                      SizedBox(height: ResponsiveUtils.height(0.02)),
                      ButtonWidgets(onTap: () {}, buttonText: 'Log Out'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavBar(),
      ),
    );
  }
}
