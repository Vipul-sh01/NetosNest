import 'package:flutter/material.dart';
import 'package:NotesNest/Constents/AppConstents.dart';
import '../../Constents/AppStyles.dart';
import '../../Utility/ResponsiveUtils.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool isObscure;
  final TextInputType keyboardType;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
    this.isObscure = false,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    final isLight = AppStyles.lightModeController.isLightMode.value;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: ResponsiveUtils.height(0.01)),
      child: TextField(
        controller: controller,
        obscureText: isObscure,
        keyboardType: keyboardType,
        style: AppStyles.textStyle,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: AppStyles.textStyleSmall,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          filled: true,
          fillColor: isLight ? Colors.grey[100] : Colors.grey[850],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: isLight ? Colors.black26 : Colors.white24,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: isLight
                  ? AppConstants.appBackGroundColor
                  : Colors.lightBlueAccent,
              width: 0.8,
            ),
          ),
        ),
      ),
    );
  }
}
