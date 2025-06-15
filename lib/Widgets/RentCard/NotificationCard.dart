import 'package:NotesNest/Utility/ResponsiveUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../Models/ModuleModels.dart';
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
  final ModuleModel module;

  RentCardCustom({
    super.key,
    required this.text,
    required this.moduleText,
    required this.courseName,
    required this.imageUrl,
    required this.note,
    required this.module,
  });

  final LightModeController lightModeController = Get.put(LightModeController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> Padding(
        padding: ResponsiveUtils.paddingAll(0.02),
        child: Container(
          width: double.infinity,
          height: ResponsiveUtils.height(0.32),
          decoration: BoxDecoration(
            borderRadius: ResponsiveUtils.circular(0.02),
            color: lightModeController.isLightMode.value ? Colors.black : Colors.white,
          ),
          child: Padding(
            padding: ResponsiveUtils.paddingAll(0.03),
            child: Column(
              children: [
                ContainerRow(text: text, moduleText: moduleText, courseName: courseName,),
                SizedBox(height: ResponsiveUtils.height(0.015)),
                RentImage(imageUrl: imageUrl, onTap: () {Get.to(PdfViewerScreen(note: note, module: module,));  },)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

