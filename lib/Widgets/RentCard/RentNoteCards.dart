import 'package:NotesNest/Utility/ResponsiveUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../Models/NoteModel.dart';
import '../../ViewModels/DarkModeViewModels.dart';
import '../../Views/PaymentCardScreen.dart';
import '../../Views/dhsdh.dart';
import 'ContainerRow.dart';
import 'RentButton.dart';
import 'RentImages.dart';
import 'RentOfferContainer.dart';

class RentNotesCard extends StatelessWidget {
  final String imageUrl;
  final String? text;
  final String? moduleText;
  final String priceText;
  final String courseNames;
  final NoteModel note;
  RentNotesCard({
    super.key,
    this.text,
    this.moduleText,
    required this.priceText,
    required this.courseNames,
    required this.imageUrl,
    required this.note
  });

  final LightModeController lightModeController = Get.put(LightModeController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> Padding(
        padding: ResponsiveUtils.paddingAll(0.025),
        child: Container(
          width: double.infinity,
          height: ResponsiveUtils.height(0.55),
          decoration: BoxDecoration(
            borderRadius: ResponsiveUtils.circular(0.02),
            color: lightModeController.isLightMode.value ? Colors.black : Colors.white,
          ),
          child: Padding(
            padding: ResponsiveUtils.paddingAll(0.025),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ContainerRow(text: text, moduleText: moduleText, courseName: courseNames,),
                SizedBox(height: ResponsiveUtils.height(0.02)),
                RentImage(imageUrl: imageUrl, onTap: () { Get.to(PdfViewerScreen(note: note,)); },),
                SizedBox(height: ResponsiveUtils.height(0.02)),
                RentOfferContainer(text: priceText,),
                SizedBox(height: ResponsiveUtils.height(0.02)),
                RentButton(onPressed: () { Get.to(PaymentScreen()); }, text: 'Rent Notes',),
                SizedBox(height: ResponsiveUtils.height(0.02)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}