import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../Models/NoteModel.dart';
import '../../ViewModels/DarkModeViewModels.dart';
import '../../Views/dhsdh.dart';
import 'ContainerRow.dart';
import 'RentImages.dart';

class RentCardCustom extends StatelessWidget {
  final String imageUrl;
  final String text;
  final String moduleText;
  final String courseName;
  final NoteModel note;
  RentCardCustom({
    super.key,
    required this.text,
    required this.moduleText,
    required this.courseName,
    required this.imageUrl,
    required this.note
  });

  final LightModeController lightModeController = Get.put(LightModeController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          width: double.infinity,
          height: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: lightModeController.isLightMode.value ? Colors.black : Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                ContainerRow(text: text, moduleText: moduleText, courseName: courseName,),
                SizedBox(height: 15),
                RentImage(imageUrl: imageUrl, onTap: () {Get.to(PdfViewerScreen(note: note,));  },)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

