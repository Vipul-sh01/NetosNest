import 'package:NotesNest/Utility/ResponsiveUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailItemWidget extends StatelessWidget {
  final String text;
  final String textOne; // Updated to String
  final bool isLightMode;

  const DetailItemWidget({
    super.key,
    required this.text,
    required this.textOne,
    required this.isLightMode,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: ResponsiveUtils.fontSize(0.059),
              fontWeight: FontWeight.bold,
              color: isLightMode ? Colors.black : Colors.white,
              shadows: [
                Shadow(
                  offset: Offset(
                    ResponsiveUtils.width(0.01),
                    ResponsiveUtils.height(0.01),
                  ),
                  blurRadius: ResponsiveUtils.radius(0.005),
                  color: isLightMode ? Colors.white30 : Colors.black26,
                ),
              ],

            ),
          ),
          Spacer(),
          Text(
            textOne, // Directly using String
            style: TextStyle(
              fontSize: ResponsiveUtils.fontSize(0.059),
              fontWeight: FontWeight.bold,
              // color: isLightMode ? Colors.white30 : Colors.black26,
            ),
          ),
        ],
      ),
    );
  }
}