import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Constents/AppConstents.dart';
import '../../ViewModels/ImageSectionViewModels.dart';
import '../../ViewModels/NotesUploadsViewsModels/NoteController.dart';
import 'NetWorkImage.dart';

class ImageSectionWidgetTwo extends StatelessWidget {
  final ImageSectionController controller;
  final NoteController noteController = Get.put(NoteController());

  ImageSectionWidgetTwo({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: Obx(() {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: noteController.notes.length,
              itemBuilder: (context, index) {
                final note = noteController.notes[index];
                final previewUrl = note.modules.isNotEmpty
                    ? note.modules.first.previewUrl ?? ''
                    : '';
                return ImageContainers(
                  imagePath: previewUrl,
                  index: index,
                  currentPage: controller.currentPage1, note: note,
                );
              },
            );
          }),
        ),
        const SizedBox(height: 10),
        Obx(() {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              3,
                  (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                height: 8,
                width: 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: controller.currentPage1.value == index
                      ? AppConstants.darkContainerColor
                      : Colors.transparent,
                  border: Border.all(
                    color: controller.currentPage1.value == index
                        ? AppConstants.darkContainerColor
                        : AppConstants.iconNoteColors,
                    width: 2,
                  ),
                ),
              ),
            ),
          );
        }),
      ],
    );
  }
}
