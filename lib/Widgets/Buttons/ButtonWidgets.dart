import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Constents/AppConstents.dart';
import '../../Constents/AppStyles.dart';
import '../../Utility/ResponsiveUtils.dart';

class ButtonWidgets extends StatelessWidget {
  final String buttonText;
  final VoidCallback onTap;

  ButtonWidgets({super.key, required this.onTap, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: ResponsiveUtils.height(0.06),
        width: double.infinity,
        child: Container(
          alignment: Alignment.center,
          padding: ResponsiveUtils.paddingAll(0.01),
          decoration: BoxDecoration(
            color: AppConstants.boxColor,
            borderRadius: ResponsiveUtils.circular(0.02),
          ),
          child: Text(
            buttonText,
            style: AppStyles.goalTextStyle,
          ),
        ),
      ),
    );
  }
}
