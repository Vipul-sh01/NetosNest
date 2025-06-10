import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogUtils {
  static void showSnackbar(String title, String message, {bool isError = false}) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: isError ? Colors.red.shade200 : Colors.green.shade200,
      colorText: Colors.black,
      duration: Duration(seconds: 3),
    );
  }
}
