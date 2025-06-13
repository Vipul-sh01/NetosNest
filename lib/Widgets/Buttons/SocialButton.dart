import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../Utility/ResponsiveUtils.dart';
import '../../ViewModels/DarkModeViewModels.dart';

class SocialButton extends StatelessWidget {
  final String text;
  final String asset;
  final VoidCallback? onPressed;

  SocialButton({
    super.key,
    required this.text,
    required this.asset,
    this.onPressed,
  });

  final LightModeController lightModeController = Get.put(LightModeController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> ElevatedButton.icon(
        onPressed: onPressed ?? () {},
        icon: Image.asset(asset, height: ResponsiveUtils.height(0.025)),
        label: Text(text),
        style: ElevatedButton.styleFrom(
          backgroundColor: lightModeController.isLightMode.value ? Colors.white : Colors.black,
          minimumSize: Size(ResponsiveUtils.height(0.20), ResponsiveUtils.width(0.13)),
          shape: RoundedRectangleBorder(borderRadius: ResponsiveUtils.circular(0.02),),
        ),
      ),
    );
  }
}
