import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../Constents/AppConstents.dart';
import '../../Constents/AppStyles.dart';
import '../../ViewModels/DarkModeViewModels.dart';
import '../../Widgets/ImageWidgets.dart';

class OnboardingScreenOne extends StatelessWidget {

  final LightModeController lightModeController = Get.put(LightModeController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> Scaffold(
        backgroundColor: lightModeController.isLightMode.value ? Colors.black : Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                AppConstants.onboardingText,
                textAlign: TextAlign.center,
                style: AppStyles.headingTextStyle,
              ),
            ),
            SizedBox(height: 70),
            ImageWidget(
              imagePath: AppConstants.onboardingFirst,
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),
          ],
        ),
      ),
    );
  }
}
