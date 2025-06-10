import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailItemWidget extends StatelessWidget {
  final String text;
  final String textOne; // Updated to String
  final bool isLightMode;

  const DetailItemWidget({
    super.key,
    required this.text,
    required this.textOne, // Now it's a String, not RxString
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
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: isLightMode ? Colors.black : Colors.white,
              shadows: [
                Shadow(
                  offset: const Offset(4, 4),
                  blurRadius: 4,
                  color: isLightMode ? Colors.white30 : Colors.black26,
                ),
              ],
            ),
          ),
          Spacer(),
          Text(
            textOne, // Directly using String
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              // color: isLightMode ? Colors.white30 : Colors.black26,
            ),
          ),
        ],
      ),
    );
  }
}