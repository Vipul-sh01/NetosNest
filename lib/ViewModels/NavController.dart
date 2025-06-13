import 'package:get/get.dart';
import '../Views/FeedScreen.dart';
import '../Views/ProfileScreen.dart';
import '../Views/SearchScreen.dart';
import '../Views/AddNotesByUser.dart';
import 'AuthViewModels/AuthControllers.dart';
import 'UserViewsModels/UserViewsModels.dart';

class BottomNavController extends GetxController {
  var selectedIndex = 0.obs;

  void changeIndex(int index) async {
    selectedIndex.value = index;

    final authController = Get.find<AuthControllers>(); // ✅ Get existing instance
    final currentUser = authController.currentUser.value;

    switch (index) {
      case 0:
        Get.to(() => FeedScreen());
        break;

      case 1:
        Get.to(() => SearchScreen());
        break;

      case 2:
        if (currentUser != null) {
          Get.to(() => UploadNoteScreen(user: currentUser));
        } else {
          await authController.fetchCurrentUser();
          final fetchedUser = authController.currentUser.value;

          if (fetchedUser != null) {
            Get.to(() => UploadNoteScreen(user: fetchedUser));
          } else {
            Get.snackbar("Error", "User not logged in");
          }
        }
        break;

      case 3:
      // Add logic for index 3 if needed
        break;

      case 4:
        Get.to(() => ProfileScreen());
        break;
    }
  }
}
