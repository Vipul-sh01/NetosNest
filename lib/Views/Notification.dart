import 'package:NotesNest/Utility/ModuleEnum.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Constents/AppConstents.dart';
import '../Constents/AppStyles.dart';
import '../Models/NoteModel.dart';
import '../ViewModels/DarkModeViewModels.dart';
import '../Widgets/BottonBar/BottomBar.dart';
import '../Widgets/Buttons/BackWidgets.dart';
import '../Widgets/NarrowContainer.dart';
import '../Widgets/RentCard/NotificationCard.dart';
import 'RentScreen.dart';

class NotificationScreen extends StatelessWidget {
  final NoteModel note;
  NotificationScreen({super.key, required this.note});

  final LightModeController lightModeController = Get.put(LightModeController());

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
        body: Column(
          children: [
            NarrowContainer(isLightMode: lightModeController.isLightMode.value),
            Expanded(
              child: ListView.builder(
                itemCount: note.modules.length,
                itemBuilder: (context, index) {
                  final module = note.modules[index];
                  return GestureDetector(
                    onTap: () {
                      Get.to(() => RentCard(note: note,));
                    },
                    child: RentCardCustom(
                      text: note.subject ?? "N/A",
                      moduleText: module.moduleName.displayName,
                      courseName: note.courseName,
                      imageUrl: module.previewUrl ?? '',
                      note: note,
                      module: module,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavBar(),
      ),
    );
  }
}
