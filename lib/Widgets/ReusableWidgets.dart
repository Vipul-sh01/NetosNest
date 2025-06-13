import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Constents/AppStyles.dart';
import '../Utility/ResponsiveUtils.dart';
import '../ViewModels/DarkModeViewModels.dart';
import 'ImageWidgets.dart';

class ReusableWidgets extends StatelessWidget {
  final String imagePath;
  final String text;

  ReusableWidgets({
    super.key,
    required this.imagePath,
    required this.text,
  });

  final LightModeController lightModeController =
      Get.put(LightModeController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        fit: StackFit.expand,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: ResponsiveUtils.height(0.25),
              width: double.infinity,
              decoration: BoxDecoration(
                color: lightModeController.isLightMode.value
                    ? Colors.white
                    : Colors.black,
                borderRadius: ResponsiveUtils.borderRadiusOnly(
                  topLeft: 0.1,
                  topRight: 0.1,
                ),
              ),
              padding:
                  ResponsiveUtils.paddingSymmetric(horizontalPercent: 0.02),
              child: Center(
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: AppStyles.headingTextStyleTwo,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: ResponsiveUtils.height(0.57),
              decoration: BoxDecoration(
                color: lightModeController.isLightMode.value
                    ? Colors.black
                    : Colors.white,
                borderRadius: ResponsiveUtils.borderRadiusOnly(
                  topLeft: 0.08,
                  topRight: 0.08,
                ),
              ),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: ImageWidget(
                      imagePath: imagePath,
                      width: double.infinity,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  SizedBox(
                    height: ResponsiveUtils.height(0.01),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
