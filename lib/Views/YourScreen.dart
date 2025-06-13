import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../ViewModels/filter.dart';
import '../Constents/AppConstents.dart';
import '../Widgets/Feed/SearchCard.dart';
import 'Notification.dart';

class YourPage extends StatelessWidget {
  final NotesFilterController controller = Get.put(NotesFilterController());
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filtered Notes'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              if (controller.filteredNotes.isEmpty) {
                return const Center(child: Text("No notes found"));
              }
              return ListView.builder(
                itemCount: controller.filteredNotes.length,
                itemBuilder: (context, index) {
                  final note = controller.filteredNotes[index];
                  return GestureDetector(
                    onTap: () {
                      Get.to(() => NotificationScreen(note: note));
                    },
                    child: SearchCard(
                      color: searchCardColors[index % searchCardColors.length],
                      text: note.subject?.isNotEmpty == true
                          ? note.subject!
                          : 'No Subject',
                      courseName: note.courseName,
                      imageUrl: note.modules.isNotEmpty ? note.modules.first.previewUrl ?? '' : '',
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
