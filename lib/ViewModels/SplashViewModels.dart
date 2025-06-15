import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Constents/AppConstents.dart';
import '../Routes/AppRoutes.dart';
import 'LoginViewModels.dart';


class SplashController extends GetxController {
  final loginController = Get.put(LoginController());

  @override
  void onInit() {
    super.onInit();
    _navigateToHome();
  }

  void _navigateToHome() {
    Future.delayed(Duration(seconds: AppConstants.splashDuration), () {
      if (loginController.isLoggedIn.value) {
        Future.microtask(() => Get.offAllNamed(AppRoutes.feed));
      } else {
        Future.microtask(() => Get.offAllNamed(AppRoutes.onboarding));
      }
      return Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    });
  }
}
