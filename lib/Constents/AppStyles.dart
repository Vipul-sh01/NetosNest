import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Utility/ResponsiveUtils.dart';
import '../ViewModels/DarkModeViewModels.dart';

class AppStyles {
  static final LightModeController lightModeController = Get.find<LightModeController>();

  static TextStyle get socialButtonTextStyle => GoogleFonts.poppins(
    color: lightModeController.isLightMode.value ? Colors.black : Colors.white,
  );

  static TextStyle get textStyle => GoogleFonts.poppins(
    fontSize: ResponsiveUtils.fontSize(0.022),
    fontWeight: FontWeight.w500,
    color: lightModeController.isLightMode.value ? Colors.black54 : Colors.black54,
  );

  static TextStyle get textStyleLargeBold => GoogleFonts.poppins(
    color: lightModeController.isLightMode.value ? Colors.white : Colors.black,
    fontSize: ResponsiveUtils.fontSize(0.048),
    fontWeight: FontWeight.bold,
  );

  static TextStyle get textAddUserStyleLargeBold => GoogleFonts.poppins(
    color: lightModeController.isLightMode.value ? Colors.white : Colors.black,
    fontSize: ResponsiveUtils.fontSize(0.07),
    fontWeight: FontWeight.bold,
  );

  static TextStyle get offerStyleLarge => GoogleFonts.poppins(
    color: lightModeController.isLightMode.value ? Colors.black : Colors.white,
    fontSize: ResponsiveUtils.fontSize(0.045),
  );

  static TextStyle get textStyleMedium => GoogleFonts.poppins(
    color: lightModeController.isLightMode.value ? Colors.white70 : Colors.black54,
    fontSize: ResponsiveUtils.fontSize(0.03),
  );

  static TextStyle get textStyleSmallBold => GoogleFonts.poppins(
    color: lightModeController.isLightMode.value ? Colors.white : Colors.black,
    fontWeight: FontWeight.bold,
  );

  static TextStyle get textStyleSmall => GoogleFonts.poppins(
    color: lightModeController.isLightMode.value ? Colors.black54 : Colors.white70,
    fontSize: ResponsiveUtils.fontSize(0.02),
  );

  static TextStyle get welcomeTextStyle => GoogleFonts.poppins(
    color: lightModeController.isLightMode.value ? Colors.white : Colors.black,
    fontSize: ResponsiveUtils.fontSize(0.1),
    fontWeight: FontWeight.bold,
  );

  static TextStyle get appNameTextStyle => GoogleFonts.poppins(
    color: lightModeController.isLightMode.value ? Colors.white : Colors.black,
    fontSize: ResponsiveUtils.fontSize(0.09),
    fontWeight: FontWeight.bold,
  );

  static TextStyle get taglineTextStyle => GoogleFonts.poppins(
    color: lightModeController.isLightMode.value ? Colors.black87 : Colors.white70,
    fontSize: ResponsiveUtils.fontSize(0.08),
  );

  static TextStyle get headingTextStyle => GoogleFonts.poppins(
    color: lightModeController.isLightMode.value ? Colors.white : Colors.black,
    fontSize: ResponsiveUtils.fontSize(0.08),
    fontWeight: FontWeight.bold,
  );

  static TextStyle get headingTextStyleTwo => GoogleFonts.poppins(
    color: lightModeController.isLightMode.value ? Colors.black : Colors.white,
    fontSize: ResponsiveUtils.fontSize(0.08),
    fontWeight: FontWeight.bold,
  );

  static TextStyle get goalTextStyle => GoogleFonts.poppins(
    fontSize: ResponsiveUtils.fontSize(0.035),
    color: lightModeController.isLightMode.value ? Colors.white : Colors.black,
    fontWeight: FontWeight.w700,
  );

  static TextStyle get authTextStyle => GoogleFonts.poppins(
    fontSize: 28,
    color: lightModeController.isLightMode.value ? Colors.white : Colors.black,
    fontWeight: FontWeight.w700,
  );

  static TextStyle get loginHeading => GoogleFonts.poppins(
    fontSize: ResponsiveUtils.fontSize(0.065),
    fontWeight: FontWeight.bold,
    color: lightModeController.isLightMode.value ? Colors.white : Colors.black,
  );

  static TextStyle get loginSubheading => GoogleFonts.poppins(
    fontSize: ResponsiveUtils.fontSize(0.04),
    color: lightModeController.isLightMode.value ? Colors.black54 : Colors.white60,
  );

  static TextStyle get normalText => GoogleFonts.poppins(
    color: lightModeController.isLightMode.value ? Colors.white70 : Colors.black87,
    fontSize: ResponsiveUtils.fontSize(0.03),
  );

  static TextStyle get boldUnderlinedText => GoogleFonts.poppins(
    color: lightModeController.isLightMode.value ? Colors.white : Colors.black,
    fontSize: ResponsiveUtils.fontSize(0.03),
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.underline,
  );

  static TextStyle customBoldStyle(Color color) => GoogleFonts.poppins(
    fontSize: ResponsiveUtils.fontSize(0.03),
    fontWeight: FontWeight.bold,
    color: color,
  );

  static TextStyle get boldMediumText => GoogleFonts.poppins(
    fontSize: ResponsiveUtils.fontSize(0.03),
  );

  static TextStyle get whiteBoldLarge => GoogleFonts.poppins(
    fontSize: ResponsiveUtils.fontSize(0.032),
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static TextStyle get baseTextLarge => GoogleFonts.poppins(
    fontSize: ResponsiveUtils.fontSize(0.03),
  );

  static TextStyle get whiteNormalText => GoogleFonts.poppins(
    fontSize: ResponsiveUtils.fontSize(0.03),
    color: Colors.white,
  );

  static TextStyle get textStyleMediums => GoogleFonts.poppins(
    color: lightModeController.isLightMode.value ? Colors.black54 : Colors.black54,
    fontSize: ResponsiveUtils.fontSize(0.03),
  );

  static TextStyle get blackBoldSmall => GoogleFonts.poppins(
    color: Colors.black,
    fontSize: ResponsiveUtils.fontSize(0.022),
  );

  static TextStyle get themedNormalSmallText => GoogleFonts.poppins(
    color: lightModeController.isLightMode.value ? Colors.white : Colors.black,
    fontSize: ResponsiveUtils.fontSize(0.03),
  );

  static TextStyle get themedLargeText => GoogleFonts.poppins(
    color: lightModeController.isLightMode.value ? Colors.white : Colors.black,
    fontSize: ResponsiveUtils.fontSize(0.045),
  );

  static TextStyle get whiteBoldSmall => GoogleFonts.poppins(
    color: Colors.white,
    fontSize: ResponsiveUtils.fontSize(0.025),
    fontWeight: FontWeight.bold,
  );

  static TextStyle get plainTextLarge => GoogleFonts.poppins(
    fontSize: ResponsiveUtils.fontSize(0.035),
  );

  static TextStyle get semiBoldSmallText => GoogleFonts.poppins(
    fontSize: ResponsiveUtils.fontSize(0.03),
    color: lightModeController.isLightMode.value ? Colors.black : Colors.white,
  );

}
