import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Constents/AppConstents.dart';
import '../Constents/AppStyles.dart';
import '../Models/NoteModel.dart';
import '../ViewModels/DarkModeViewModels.dart';
import '../ViewModels/NotesUploadsViewsModels/NoteController.dart';
import '../ViewModels/filter.dart';
import '../Widgets/BottonBar/BottomBar.dart';
import '../Widgets/Buttons/BackWidgets.dart';
import '../Widgets/Feed/SearchCard.dart';
import '../Widgets/Feed/SearchSort.dart';
import '../Widgets/FliterShort/showFilterSheet.dart';
import '../Widgets/NarrowContainer.dart';
import 'Notification.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  final LightModeController lightModeController =
      Get.put(LightModeController(), permanent: true);
  final NoteController noteController =
      Get.put(NoteController(), permanent: true);
  final NotesFilterController notesFilterController =
      Get.put(NotesFilterController());

  final List<Color> searchCardColors = [
    AppConstants.boxColor,
    AppConstants.blueColors,
    AppConstants.redColors,
    AppConstants.yellowColors,
    AppConstants.darkYellowColors,
    AppConstants.boxColor,
    AppConstants.boxColor,
    AppConstants.boxColor,
    AppConstants.boxColor,
    AppConstants.boxColor,
    AppConstants.boxColor,
    AppConstants.boxColor,
    AppConstants.boxColor,
    AppConstants.boxColor,
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor:
            lightModeController.isLightMode.value ? Colors.white : Colors.black,
        appBar: AppBar(
          backgroundColor: lightModeController.isLightMode.value
              ? Colors.black
              : Colors.white,
          leading: BackWidget(
            onTap: () {
              Get.back();
            },
            imagePath: lightModeController.isLightMode.value
                ? AppConstants.backWhiteIcon
                : AppConstants.backBlackIcon,
          ),
          title: Text(
            AppConstants.noteSwapTexts,
            style: AppStyles.textStyleLargeBold,
          ),
          centerTitle: true,
          actions: [
            BackWidget(
              onTap: () {
                // Add settings navigation logic here
              },
              imagePath: lightModeController.isLightMode.value
                  ? AppConstants.whiteSettingIcon
                  : AppConstants.blackSettingIcon,
            ),
          ],
        ),
        body: Column(
          children: [
            NarrowContainer(isLightMode: lightModeController.isLightMode.value),
            SearchSort(
              onChanged: (String value) {
                noteController.updateSearchQuery(value);
              },
              onTap: () {
                showFilterSheet(
                    context, notesFilterController, lightModeController);
              },
            ),
            Expanded(
              child: Obx(() {
                if (noteController.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }
                final notes = noteController.filteredNotes;
                if (notes.isEmpty) {
                  return const Center(child: Text("No notes found"));
                }
                return ListView.builder(
                  itemCount: notes.length,
                  itemBuilder: (context, index) {
                    final note = notes[index];
                    return GestureDetector(
                      onTap: () {
                        Get.to(() => NotificationScreen(note: note));
                      },
                      child: SearchCard(
                        color:
                            searchCardColors[index % searchCardColors.length],
                        text: note.subject?.isNotEmpty == true
                            ? note.subject!
                            : 'No Subject',
                        courseName: note.courseName,
                        imageUrl:note.modules.isNotEmpty ? note.modules.first.previewUrl ?? '' : '',
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavBar(),
      ),
    );
  }
}
