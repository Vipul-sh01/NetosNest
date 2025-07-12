import 'package:NotesNest/Constents/AppConstents.dart';
import 'package:NotesNest/Utility/ResponsiveUtils.dart';
import 'package:flutter/material.dart';

import '../Constents/AppStyles.dart';

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
        borderRadius: ResponsiveUtils.circular(0.015),
        border: Border.all(
          color: AppConstants.appBackGroundColor,
          width: 0.7,
        ),
      ),
      child: Row(
        children: [
          Text(
            text,
            style: AppStyles.semiBoldSmallText,
          ),
          Spacer(),
          Text(
            textOne,
            style:AppStyles.semiBoldSmallText,
          ),
        ],
      ),
    );
  }
}
