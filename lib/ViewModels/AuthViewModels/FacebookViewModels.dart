import 'package:get/get.dart';
import '../../Services/AuthServices/FacebookAuth.dart';
import '../../Utility/showSnackbar.dart';
import '../../Views/FeedScreen.dart';
import '../../Models/UserModels.dart';

class FacebookController extends GetxController {
  final FacebookAuthService _authService = FacebookAuthService();
  final isLoading = false.obs;

  /// Hold the authenticated custom user model
  Rx<UserModel?> currentUser = Rx<UserModel?>(null);

  Future<bool> loginWithFacebook() async {
    try {
      isLoading.value = true;
      UserModel? loggedInUser = await _authService.signInWithFacebook();

      if (loggedInUser != null) {
        currentUser.value = loggedInUser;
        DialogUtils.showSnackbar("Success", "Logged in successfully");
        Get.offAll(() => FeedScreen());
        return true;
      } else {
        DialogUtils.showSnackbar("Error", "Login failed");
        return false;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
      return false;
    } finally {
      isLoading.value = false;
    }
  }
}
