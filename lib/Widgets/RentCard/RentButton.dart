import 'package:NotesNest/Utility/ResponsiveUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../ViewModels/DarkModeViewModels.dart';
import '../../Views/PaymentCardScreen.dart';

class RentButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  RentButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  final LightModeController lightModeController = Get.put(LightModeController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SizedBox(
          width: double.infinity,
          height: ResponsiveUtils.height(0.06),
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: lightModeController.isLightMode.value ? Colors.white : Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: ResponsiveUtils.circular(0.02),
              ),
            ),
            child: Text(
              text,
              style: TextStyle(
                color: lightModeController.isLightMode.value ? Colors.black : Colors.white,
                fontSize: ResponsiveUtils.fontSize(0.04),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
