import 'package:NotesNest/Utility/ResponsiveUtils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Constents/AppConstents.dart';
import '../Constents/AppStyles.dart';
import '../Services/ImagePicker.dart';
import '../ViewModels/AuthViewModels/AuthControllers.dart';
import '../ViewModels/AuthViewModels/LogoutAllViewModels.dart';
import '../ViewModels/DarkModeViewModels.dart';
import '../Widgets/BottonBar/BottomBar.dart';
import '../Widgets/Buttons/BackWidgets.dart';
import '../Widgets/Buttons/ButtonWidgets.dart';
import '../Widgets/Profile/CustomTextFild.dart';
import '../Widgets/ProfileAvatar.dart';
import 'FeedScreen.dart';
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
            lightModeController.isLightMode.value ? Colors.white : Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: lightModeController.isLightMode.value
              ? AppConstants.appBackGroundColor
              : Colors.white,
          leading: BackWidget(
            onTap: () {
              Get.off(()=> FeedScreen());
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
          actions: [
            IconButton(
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
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: ResponsiveUtils.paddingAll(0.01),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
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
                        controller: authController.nameController,
                        label: "Name",
                        keyboardType: TextInputType.emailAddress,
                      ),
                      CustomTextField(
                        controller: authController.roomNoController,
                        label: "Room Number",
                        keyboardType: TextInputType.emailAddress,
                      ),
                      CustomTextField(
                        controller: authController.departmentController,
                        label: "Department",
                        keyboardType: TextInputType.emailAddress,
                      ),
                      CustomTextField(
                        controller: authController.blockController,
                        label: "Block",
                        keyboardType: TextInputType.emailAddress,
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
                      ButtonWidgets(
                        onTap: () => LogoutService.logoutAll(),
                        buttonText: 'Log Out',
                      )
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
