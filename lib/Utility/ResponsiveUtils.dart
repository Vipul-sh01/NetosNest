import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResponsiveUtils {
  static double get _width => Get.context!.width;
  static double get _height => Get.context!.height;

  /// Padding equally on all sides
  static EdgeInsets paddingAll(double percent) {
    return EdgeInsets.all(_width * percent);
  }

  /// Padding symmetrically (horizontal and vertical)
  static EdgeInsets paddingSymmetric({
    double horizontalPercent = 0.0,
    double verticalPercent = 0.0,
  }) {
    return EdgeInsets.symmetric(
      horizontal: _width * horizontalPercent,
      vertical: _height * verticalPercent,
    );
  }

  /// Padding only on specific sides
  static EdgeInsets paddingOnly({
    double leftPercent = 0.0,
    double topPercent = 0.0,
    double rightPercent = 0.0,
    double bottomPercent = 0.0,
  }) {
    return EdgeInsets.only(
      left: _width * leftPercent,
      top: _height * topPercent,
      right: _width * rightPercent,
      bottom: _height * bottomPercent,
    );
  }

  static EdgeInsets marginSymmetric({
    double horizontalPercent = 0.0,
    double verticalPercent = 0.0,
  }) {
    return EdgeInsets.symmetric(
      horizontal: _width * horizontalPercent,
      vertical: _height * verticalPercent,
    );
  }

  static double iconSize(double percentOfScreenWidth) {
    return Get.width * percentOfScreenWidth;
  }


  static double blurRadius(double percent) {
    return Get.context!.width * percent;
  }

  static Offset shadowOffset({double x = 0.005, double y = 0.005}) {
    return Offset(Get.context!.width * x, Get.context!.height * y);
  }

  static double radius(double percent) {
    return Get.width * percent;
  }



  /// Responsive circular border radius based on width
  static BorderRadius circular(double percent) {
    return BorderRadius.circular(_width * percent);
  }


  /// Spacing vertically (height)
  static double verticalSpacing(double percent) {
    return _height * percent;
  }

  /// Spacing horizontally (width)
  static double horizontalSpacing(double percent) {
    return _width * percent;
  }

  /// Font size responsive to screen width
  static double fontSize(double percentOfWidth) {
    return _width * percentOfWidth;
  }

  /// Responsive width
  static double width(double percent) {
    return _width * percent;
  }

  /// Responsive height
  static double height(double percent) {
    return _height * percent;
  }

  /// Border radius with percentages
  static BorderRadius borderRadiusOnly({
    double topLeft = 0,
    double topRight = 0,
    double bottomLeft = 0,
    double bottomRight = 0,
  }) {
    return BorderRadius.only(
      topLeft: Radius.circular(_width * topLeft),
      topRight: Radius.circular(_width * topRight),
      bottomLeft: Radius.circular(_width * bottomLeft),
      bottomRight: Radius.circular(_width * bottomRight),
    );
  }
}
