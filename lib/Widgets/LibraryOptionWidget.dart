import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../Constents/AppConstents.dart';
import '../Constents/AppStyles.dart';
import '../Utility/ResponsiveUtils.dart';
import '../ViewModels/DarkModeViewModels.dart';

class LibraryOptionWidget extends StatelessWidget {
  final String iconPath;
  final String label;
  final VoidCallback onTap;
  final Color containerColor;
  final Color svgColor;

  LibraryOptionWidget({super.key, required this.iconPath, required this.label, required this.onTap, required this.containerColor, required this.svgColor});

  final LightModeController lightModeController = Get.put(LightModeController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> GestureDetector(
        onTap: onTap,
        child: Container(
          height: ResponsiveUtils.height(0.07),
          width: ResponsiveUtils.width(0.30),
          padding: ResponsiveUtils.paddingOnly(leftPercent: 0.01, rightPercent: 0.01),
          decoration: BoxDecoration(
            color: containerColor,
            borderRadius: ResponsiveUtils.circular(0.02)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: ResponsiveUtils.iconSize(0.09),
                height: ResponsiveUtils.iconSize(0.09),
                child: SvgPicture.asset(
                  iconPath,
                  fit: BoxFit.contain,
                  colorFilter: ColorFilter.mode(
                    svgColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              SizedBox(width: ResponsiveUtils.width(0.02)),
              Expanded(
                child: Text(
                  label,
                  style: AppStyles.textStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
