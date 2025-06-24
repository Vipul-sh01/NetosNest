import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Constents/AppConstents.dart';
import '../../Utility/ResponsiveUtils.dart';
import '../../ViewModels/DarkModeViewModels.dart';
import '../../ViewModels/OnboardingViewModels.dart';
import '../../Widgets/Buttons/ButtonWidgets.dart';
import '../Authentication/LoginScreen.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({Key? key}) : super(key: key);

  final OnboardingController controller = Get.put(OnboardingController());
  final LightModeController lightModeController = Get.put(LightModeController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      backgroundColor: lightModeController.isLightMode.value ? Colors.black : Colors.white,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: controller.pageController,
              onPageChanged: controller.onPageChanged,
              itemCount: controller.pages.length,
              itemBuilder: (context, index) {
                return controller.pages[index];
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              controller.pages.length,
                  (index) => buildDot(index, controller.currentPage.value),
            ),
          ),
          SizedBox(height: ResponsiveUtils.height(0.01)),
          Padding(padding: ResponsiveUtils.paddingAll(0.08),
            child: ButtonWidgets(
              onTap: () {
                Get.to(LoginScreen());
              },
              buttonText: 'Next',
            ),
          ),
        ],
      ),
    ));
  }

  Widget buildDot(int index, int currentIndex) {
    final bool isDarkMode = lightModeController.isLightMode.value;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: ResponsiveUtils.marginSymmetric(horizontalPercent: 0.01),
      width: currentIndex == index ? ResponsiveUtils.width(0.099) : ResponsiveUtils.width(0.05),
      height: ResponsiveUtils.height(0.01),
      decoration: BoxDecoration(
        color: currentIndex == index
            ? (isDarkMode ? AppConstants.boxColor : AppConstants.boxColor)
            : (isDarkMode ? AppConstants.backgroundColor : Colors.black),
        borderRadius: ResponsiveUtils.circular(0.022),
      ),
    );
  }
}
