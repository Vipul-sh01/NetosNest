import 'package:NotesNest/Utility/ResponsiveUtils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final bool isDarkMode;

  const CustomTextField({
    Key? key,
    required this.label,
    this.controller,
    required this.isDarkMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ResponsiveUtils.paddingSymmetric(verticalPercent: 0.01),
      child: Row(
        children: [
          SizedBox(
            width: ResponsiveUtils.width(0.23),
            child: Text(
              "$label:",
              style: TextStyle(
                fontSize:ResponsiveUtils.fontSize(0.035),
                color: isDarkMode ? Colors.white : Colors.black,
              ),
            ),
          ),
          Expanded(
            child: TextField(
              controller: controller,
              style: TextStyle(
                color: isDarkMode ? Colors.white : Colors.black,
              ),
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.purpleAccent),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
