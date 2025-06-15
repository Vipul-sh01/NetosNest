import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Routes/AppRoutes.dart';
import '../../Utility/showSnackbar.dart';

class LogoutService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final GoogleSignIn _googleSignIn = GoogleSignIn();

  static Future<void> logoutAll() async {
    try {
      await _auth.signOut();
      if (await _googleSignIn.isSignedIn()) {
        await _googleSignIn.signOut();
      }
      await FacebookAuth.instance.logOut();
      final prefs = await SharedPreferences.getInstance();
      await prefs.clear();

      Get.offAllNamed(AppRoutes.login);

      DialogUtils.showSnackbar("Success", "Logged out successfully.");
    } catch (e) {
      print("❌ Logout failed: $e");
    }
  }
}
