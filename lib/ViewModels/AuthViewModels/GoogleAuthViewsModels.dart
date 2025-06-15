import 'package:get/get.dart';
import '../../Models/UserModels.dart';
import '../../Services/AuthServices/GoogleAuth.dart';
import '../../Utility/showSnackbar.dart';
import '../../Views/FeedScreen.dart';

class GoogleAuthController extends GetxController {
  final GoogleAuthService _authService = GoogleAuthService();

  var currentUser = Rxn<UserModel>();
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<bool> signInWithGoogle() async {
    try {
      isLoading.value = true;

      final userModel = await _authService.signInWithGoogle();
      if (userModel != null) {
        currentUser.value = userModel;
        DialogUtils.showSnackbar("Success", "Signed in with Google");
        Get.offAll(() => FeedScreen());
        return true;
      } else {
        DialogUtils.showSnackbar("Login Failed", "Could not sign in with Google");
        return false;
      }
    } catch (e) {
      Get.snackbar("Login Error", e.toString());
      return false;
    } finally {
      isLoading.value = false;
    }
  }
}
