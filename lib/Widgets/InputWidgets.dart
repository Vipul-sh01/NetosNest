import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../Utility/ResponsiveUtils.dart';
import '../ViewModels/DarkModeViewModels.dart';

class InputField extends StatelessWidget {
  final String hintText;
  final bool isPassword;
  final TextEditingController? controller;
  final TextInputType keyboardType;

  InputField({
    super.key,
    required this.hintText,
    this.isPassword = false,
    this.controller,
    this.keyboardType = TextInputType.text,
  });

  final LightModeController lightModeController = Get.put(LightModeController());

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        filled: true,
        fillColor: lightModeController.isLightMode.value ? Colors.white: Colors.black,
        hintText: hintText,
        suffixIcon: isPassword
            ? const Icon(Icons.visibility_off, color: Colors.grey)
            : null,
        border: OutlineInputBorder(
          borderRadius: ResponsiveUtils.circular(0.02),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
