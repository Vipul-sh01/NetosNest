import 'package:NotesNest/Constents/AppConstents.dart';
import 'package:NotesNest/Utility/ResponsiveUtils.dart';
import 'package:flutter/material.dart';

class DetailItemWidget extends StatelessWidget {
  final String text;
  final String textOne;
  final bool isLightMode;

  const DetailItemWidget({
    super.key,
    required this.text,
    required this.textOne,
    required this.isLightMode,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: ResponsiveUtils.height(0.013),
        horizontal: ResponsiveUtils.width(0.02),
      ),
      decoration: BoxDecoration(
        color: isLightMode ? AppConstants.searchColors : AppConstants.newlyNotes,
        borderRadius: ResponsiveUtils.circular(0.015),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: ResponsiveUtils.fontSize(0.03),
              fontWeight: FontWeight.w600,
              color: isLightMode ? Colors.black : Colors.white,
            ),
          ),
          Spacer(),
          Text(
            textOne,
            style: TextStyle(
              fontSize: ResponsiveUtils.fontSize(0.034),
              fontWeight: FontWeight.bold,
              color: isLightMode ? Colors.black : Colors.white70,
            ),
          ),
        ],
      ),
    );
  }
}
