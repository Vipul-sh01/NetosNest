import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Constents/AppConstents.dart';
import '../Utility/ResponsiveUtils.dart';
import '../ViewModels/DarkModeViewModels.dart';

class CheckBox extends StatelessWidget {
  CheckBox({
    super.key,
    required this.onPressed,
    required this.isChecked,
  });

  final VoidCallback onPressed;
  final bool isChecked;

  final LightModeController lightModeController = Get.put(LightModeController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: ResponsiveUtils.width(0.069),
        height: ResponsiveUtils.height(0.033),
        decoration: BoxDecoration(
          color: lightModeController.isLightMode.value ? Colors.white : Colors.black,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: lightModeController.isLightMode.value ? Colors.black : Colors.white,
          ),
        ),
        alignment: Alignment.center,
        child: isChecked
            ? Icon(
          Icons.check,
          size: ResponsiveUtils.iconSize(0.05),
          color: lightModeController.isLightMode.value ? Colors.black : Colors.white,
        )
            : null,
      ),
    );
  }
}
