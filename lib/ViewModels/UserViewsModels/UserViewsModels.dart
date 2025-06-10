import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../Models/UserModels.dart';
import '../../Services/AuthServices/AuthServices.dart';
import '../../Services/UserServices/UserServices.dart';
import '../../Utility/showSnackbar.dart';

class AuthControllers extends GetxController {
  final AuthService authService = AuthService();
  final UserService userService = UserService();

  final isLoading = false.obs;
  final Rxn<UserModel> currentUser = Rxn<UserModel>();

  @override
  void onInit() {
    super.onInit();
    fetchCurrentUser(); // Auto fetch user on controller init
  }

  Future<void> fetchCurrentUser() async {
    try {
      isLoading.value = true;
      final user = await userService.getCurrentUser();
      if (user != null) {
        currentUser.value = user;
        print("Fetched current user: ${user.name}");
      } else {
        DialogUtils.showSnackbar("Error", "No user found", isError: true);
      }
    } catch (e) {
      DialogUtils.showSnackbar("Error", "Failed to fetch user: $e", isError: true);
    } finally {
      isLoading.value = false;
    }
  }
}
