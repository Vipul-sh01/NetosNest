import 'package:get/get.dart';
import '../../Models/UserModels.dart';
import '../../Services/AuthServices/GoogleAuth.dart';
import '../../Views/FeedScreen.dart';

class GoogleAuthController extends GetxController {
  final GoogleAuthService _authService = GoogleAuthService();

  var currentUser = Rxn<UserModel>();
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    // Optional: Listen to auth state (not needed if handled in signIn)
  }

  Future<void> signInWithGoogle() async {
    try {
      isLoading.value = true;

      final userModel = await _authService.signInWithGoogle();
      if (userModel != null) {
        currentUser.value = userModel;
        Get.offAll(() => FeedScreen());
      } else {
        Get.snackbar("Login Failed", "Could not sign in with Google");
      }
    } catch (e) {
      Get.snackbar("Login Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> signOut() async {
    await _authService.signOut();
    currentUser.value = null;
    Get.offAllNamed('/login');
  }
}
