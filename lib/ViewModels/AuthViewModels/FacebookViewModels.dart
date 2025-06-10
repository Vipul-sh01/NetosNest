import 'package:get/get.dart';
import '../../Services/AuthServices/FacebookAuth.dart';
import '../../Views/FeedScreen.dart';
import '../../Models/UserModels.dart';

class FacebookController extends GetxController {
  final FacebookAuthService _authService = FacebookAuthService();
  final isLoading = false.obs;

  /// Hold the authenticated custom user model
  Rx<UserModel?> currentUser = Rx<UserModel?>(null);

  Future<void> loginWithFacebook() async {
    try {
      isLoading.value = true;
      UserModel? loggedInUser = await _authService.signInWithFacebook();

      if (loggedInUser != null) {
        currentUser.value = loggedInUser;
        Get.snackbar("Success", "Logged in successfully");
        Get.offAll(() => FeedScreen());
      } else {
        Get.snackbar("Error", "Login failed");
      }
    } catch (e) {
      print(e.toString());
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
