import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Routes/AppRoutes.dart';

class LoginController extends GetxController {
  static const String isLoggedInKey = 'isLoggedIn';

  var isLoggedIn = false.obs;

  @override
  void onInit() {
    super.onInit();
    checkLoginStatus();
  }

  Future<void> checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isLoggedIn.value = prefs.getBool(isLoggedInKey) ?? false;
  }

  Future<void> login() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(isLoggedInKey, true);
    isLoggedIn.value = true;
    Get.offAllNamed(AppRoutes.feed); // Go to FeedScreen
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(isLoggedInKey);
    isLoggedIn.value = false;
    Get.offAllNamed(AppRoutes.feed); // Go to LoginScreen
  }
}
