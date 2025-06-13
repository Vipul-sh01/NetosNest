import 'package:NotesNest/Utility/ResponsiveUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../ViewModels/DarkModeViewModels.dart';

class RentOfferContainer extends StatelessWidget {
  final String text;
  RentOfferContainer({
    super.key,
    required this.text,
  });

  final LightModeController lightModeController = Get.put(LightModeController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> Container(
        padding: ResponsiveUtils.paddingAll(0.011),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Offered by",
              style: TextStyle(
                color: lightModeController.isLightMode.value ? Colors.white : Colors.black,
                fontSize: ResponsiveUtils.fontSize(0.044)
              ),
            ),
            TextField(
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: lightModeController.isLightMode.value ? Colors.white : Colors.black, width: 1.5),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: lightModeController.isLightMode.value ? Colors.white : Colors.black, width: 1.5),
                ),
              ),
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: ResponsiveUtils.height(0.02)),
            Text(
              text?? '',
              style: TextStyle(
                color: lightModeController.isLightMode.value ? Colors.white : Colors.black,
                fontSize: ResponsiveUtils.fontSize(0.034)
              ),
            ),
          ],
        ),
      ),
    );
  }
}

