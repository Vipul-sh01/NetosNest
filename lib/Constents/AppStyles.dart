import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Utility/ResponsiveUtils.dart';
import '../ViewModels/DarkModeViewModels.dart';

class AppStyles {
  static final LightModeController lightModeController = Get.find<LightModeController>();

  // **Dynamic Text Styles Based on Theme**
  static TextStyle get socialButtonTextStyle => TextStyle(
    color: lightModeController.isLightMode.value ? Colors.black : Colors.white,
  );

  static TextStyle get textStyle => TextStyle(
    fontSize: ResponsiveUtils.fontSize(0.0258),
    fontWeight: FontWeight.w500,
    color: lightModeController.isLightMode.value ? Colors.black54 : Colors.white70,
  );

  static TextStyle get textStyleLargeBold => TextStyle(
    color: lightModeController.isLightMode.value ? Colors.white : Colors.black,
    fontSize: ResponsiveUtils.fontSize(0.05),
    fontWeight: FontWeight.bold,
  );

  static TextStyle get textAddUserStyleLargeBold => TextStyle(
    color: lightModeController.isLightMode.value ? Colors.white : Colors.black,
    fontSize: ResponsiveUtils.fontSize(0.07),
    fontWeight: FontWeight.bold,
  );

  static TextStyle get offerStyleLarge => TextStyle(
    color: lightModeController.isLightMode.value ? Colors.black : Colors.white,
    fontSize: ResponsiveUtils.fontSize(0.045),
  );

  static TextStyle get textStyleMedium => TextStyle(
    color: lightModeController.isLightMode.value ? Colors.white70 : Colors.black54,
    fontSize: ResponsiveUtils.fontSize(0.03),
  );

  static TextStyle get textStyleSmallBold => TextStyle(
    color: lightModeController.isLightMode.value ? Colors.white : Colors.black,
    fontWeight: FontWeight.bold,
  );

  static TextStyle get textStyleSmall => TextStyle(
    color: lightModeController.isLightMode.value ? Colors.white70 : Colors.black54,
    fontSize: ResponsiveUtils.fontSize(0.03),
  );

  static TextStyle get welcomeTextStyle => TextStyle(
    color: lightModeController.isLightMode.value ? Colors.white : Colors.black,
    fontSize: ResponsiveUtils.fontSize(0.1),
    fontWeight: FontWeight.bold,
  );

  static TextStyle get appNameTextStyle => TextStyle(
    color: lightModeController.isLightMode.value ? Colors.white : Colors.black,
    fontSize:ResponsiveUtils.fontSize(0.09),
    fontWeight: FontWeight.bold,
  );

  static TextStyle get taglineTextStyle => TextStyle(
    color: lightModeController.isLightMode.value ? Colors.black87 : Colors.white70,
    fontSize: ResponsiveUtils.fontSize(0.08),
  );

  static TextStyle get headingTextStyle => TextStyle(
    color: lightModeController.isLightMode.value ? Colors.white : Colors.black,
    fontSize: ResponsiveUtils.fontSize(0.08),
    fontWeight: FontWeight.bold,
  );

  static TextStyle get headingTextStyleTwo => TextStyle(
    color: lightModeController.isLightMode.value ? Colors.black : Colors.white,
    fontSize: ResponsiveUtils.fontSize(0.08),
    fontWeight: FontWeight.bold,
  );

  static TextStyle get goalTextStyle => TextStyle(
    fontSize: ResponsiveUtils.fontSize(0.045),
    color: lightModeController.isLightMode.value ? Colors.white : Colors.black,
    fontWeight: FontWeight.w700,
  );

  static TextStyle get authTextStyle => TextStyle(
    fontSize: 28,
    color: lightModeController.isLightMode.value ? Colors.white : Colors.black,
    fontWeight: FontWeight.w700,
  );

  static TextStyle get loginHeading => TextStyle(
    fontSize:ResponsiveUtils.fontSize(0.065),
    fontWeight: FontWeight.bold,
  );

  static TextStyle get loginSubheading => TextStyle(
    fontSize: ResponsiveUtils.fontSize(0.04),
    color: lightModeController.isLightMode.value ? Colors.black54 : Colors.white60,
  );

  static TextStyle get normalText => TextStyle(
    color: lightModeController.isLightMode.value ? Colors.white70 : Colors.black87,
    fontSize: ResponsiveUtils.fontSize(0.038),
  );

  static TextStyle get boldUnderlinedText => TextStyle(
    color: lightModeController.isLightMode.value ? Colors.white : Colors.black,
    fontSize: ResponsiveUtils.fontSize(0.04),
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.underline,
  );
}
