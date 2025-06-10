import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Constents/AppConstents.dart';
import '../Constents/AppStyles.dart';
import '../Services/ImagePicker.dart';
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
        leading: BackWidget(
          onTap: () {},
          imagePath: lightModeController.isLightMode.value ? AppConstants.backWhiteIcon : AppConstants.backBlackIcon,
        ),
        title: Text(
          AppConstants.noteSwapTexts,
          style: AppStyles.textStyleLargeBold,
        ),
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
              height: AppConstants.profileContainerHeight,
              width: double.infinity,
              decoration: BoxDecoration(
                color: lightModeController.isLightMode.value ? Colors.black : Colors.white,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(AppConstants.profileContainerBorderRadius),
                  bottomRight: Radius.circular(AppConstants.profileContainerBorderRadius),
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
                      radius: 55.0,
                      backgroundColor: Colors.black,
                      backgroundImage: (user?.profilePic?.trim().isNotEmpty ?? false)
                          ? NetworkImage(user!.profilePic!)
                          : const AssetImage(AppConstants.defaultProfileImage),
                    );
                  }),
                  const SizedBox(height: 8),
                  Obx(() => Text(
                    authController.currentUser.value?.name ?? AppConstants.userName,
                    style: AppStyles.textStyleLargeBold,
                  )),
                  Text(
                    AppConstants.userBio,
                    style: AppStyles.textStyleMedium,
                  ),
                  const SizedBox(height: 10),
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
                      const SizedBox(width: 50),
                      Text(
                        AppConstants.separator,
                        style: AppStyles.textStyleSmallBold,
                      ),
                      const SizedBox(width: 50),
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
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                  const SizedBox(height: 10),
                  Obx(
                    ()=> DetailItemWidget(
                      text: "Room No",
                      isLightMode: lightModeController.isLightMode.value,
                      textOne: authController.currentUser.value?.roomNo ?? '',
                    ),
                  ),
                  const SizedBox(height: 10),
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
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Offers Made",
                    style: AppStyles.offerStyleLarge,
                  ),
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
