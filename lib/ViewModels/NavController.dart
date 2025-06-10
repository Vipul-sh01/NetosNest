import 'package:get/get.dart';
import '../Views/FeedScreen.dart';
import '../Views/ProfileScreen.dart';
import '../Views/SearchScreen.dart';
import '../Views/AddNotesByUser.dart';
import 'AuthViewModels/AuthControllers.dart';

class BottomNavController extends GetxController {
  var selectedIndex = 0.obs;

  void changeIndex(int index) {
    selectedIndex.value = index;

    final authController = Get.put(AuthController());
    final currentUser = authController.currentUser;

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
          Get.snackbar("Error", "User not logged in");
        }
        break;
      case 3:

        break;
      case 4:
        Get.to(() => ProfileScreen());
        break;
    }
  }
}
