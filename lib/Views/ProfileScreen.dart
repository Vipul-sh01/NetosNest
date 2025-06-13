import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Constents/AppConstents.dart';
import '../Constents/AppStyles.dart';
import '../Services/ImagePicker.dart';
import '../Utility/ResponsiveUtils.dart';
import '../ViewModels/DarkModeViewModels.dart';
import '../ViewModels/UserViewsModels/UserViewsModels.dart';
import '../Widgets/BottonBar/BottomBar.dart';
import '../Widgets/Buttons/BackWidgets.dart';
import '../Widgets/NotesCard.dart';
import '../Widgets/ProfileAvatar.dart';
import '../Widgets/TextWidgets.dart';
import 'UserUpdateProfile.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final ImagePickerService imagePickerService = Get.put(ImagePickerService());
  final LightModeController lightModeController = Get.find<LightModeController>();
  final AuthControllers authController = Get.put(AuthControllers());

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      authController.fetchCurrentUser();
    });
    return Obx(() => Scaffold(
      backgroundColor: lightModeController.isLightMode.value ? Colors.white : Colors.black,
      appBar: AppBar(
        backgroundColor: lightModeController.isLightMode.value ? Colors.black : Colors.white,
        automaticallyImplyLeading: true,
        leading: BackWidget(
          onTap: () {},
          imagePath: lightModeController.isLightMode.value ? AppConstants.backWhiteIcon : AppConstants.backBlackIcon,
        ),
        title: Text(
          AppConstants.noteSwapTexts,
          style: AppStyles.textStyleLargeBold,
        ),
        elevation: 0,
        centerTitle: true,
        actions: [
          BackWidget(
            onTap: () {
              Get.to(AddUsers());
            },
            imagePath: lightModeController.isLightMode.value ? AppConstants.whiteSettingIcon : AppConstants.blackSettingIcon,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: ResponsiveUtils.height(0.3),
              width: double.infinity,
              decoration: BoxDecoration(
                color: lightModeController.isLightMode.value ? Colors.black : Colors.white,
                borderRadius: ResponsiveUtils.borderRadiusOnly(
                  bottomRight: 0.05,
                  bottomLeft:  0.05,
                ),
              ),
              child: Column(
                children: [
                  Obx(() {
                    if (authController.isLoading.value) {
                      return const CircularProgressIndicator();
                    }
                    final user = authController.currentUser.value;
                    return CircleAvatar(
                      radius: ResponsiveUtils.width(0.13),
                      backgroundColor: Colors.black,
                      backgroundImage: (user?.profilePic?.trim().isNotEmpty ?? false)
                          ? NetworkImage(user!.profilePic!)
                          : const AssetImage(AppConstants.defaultProfileImage),
                    );
                  }),
                  SizedBox(height: ResponsiveUtils.height(0.01)),
                  Obx(() => Text(
                    authController.currentUser.value?.name ?? AppConstants.userName,
                    style: AppStyles.textStyleLargeBold,
                  )),
                  Text(
                    AppConstants.userBio,
                    style: AppStyles.textStyleMedium,
                  ),
                  SizedBox(height: ResponsiveUtils.height(0.01)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppConstants.notesPurchased,
                        style: AppStyles.textStyleSmallBold,
                      ),
                      Text(
                        AppConstants.notesPurchasedLabel,
                        style: AppStyles.textStyleSmall,
                      ),
                      SizedBox(width:  ResponsiveUtils.width(0.07)),
                      Text(
                        AppConstants.separator,
                        style: AppStyles.textStyleSmallBold,
                      ),
                      SizedBox(width:  ResponsiveUtils.width(0.07)),
                      Text(
                        AppConstants.notesSold,
                        style: AppStyles.textStyleSmallBold,
                      ),
                      Text(
                        AppConstants.notesSoldLabel,
                        style: AppStyles.textStyleSmall,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: ResponsiveUtils.paddingSymmetric(horizontalPercent: 0.05, verticalPercent: 0.02),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(() {
                    return DetailItemWidget(
                      text: "Block",
                      isLightMode: lightModeController.isLightMode.value,
                      textOne: authController.currentUser.value?.block ?? '',
                    );
                  }),
                  SizedBox(height:  ResponsiveUtils.height(0.01)),
                  Obx(
                    ()=> DetailItemWidget(
                      text: "Room No",
                      isLightMode: lightModeController.isLightMode.value,
                      textOne: authController.currentUser.value?.roomNo ?? '',
                    ),
                  ),
                  SizedBox(height:  ResponsiveUtils.height(0.01)),
                  Obx(
                    ()=> DetailItemWidget(
                      text: "Department",
                      isLightMode: lightModeController.isLightMode.value,
                      textOne: '',
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: ResponsiveUtils.paddingAll(0.02),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Offers Made",
                    style: AppStyles.offerStyleLarge,
                  ),
                  SizedBox(height:  ResponsiveUtils.height(0.01)),
                  NoteCard(),
                  NoteCard(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    ));
  }
}
