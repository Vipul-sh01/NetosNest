import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../Constents/AppConstents.dart';
import '../../Constents/AppStyles.dart';
import '../../Utility/ResponsiveUtils.dart';
import '../../ViewModels/DarkModeViewModels.dart';

class ContainerRow extends StatelessWidget {
  final String? text;
  final String? moduleText;
  final String courseName;
  ContainerRow({
    super.key,
    this.text,
    this.moduleText,
    required this.courseName,
  });

  final LightModeController lightModeController = Get.put(LightModeController());

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    courseName ?? "CSE 2005",
                    style: AppStyles.themedNormalSmallText,
                  ),
                  SizedBox(width: ResponsiveUtils.width(0.02)),
                  Container(
                    width: ResponsiveUtils.width(0.15),
                    height: ResponsiveUtils.height(0.021),
                    padding: ResponsiveUtils.paddingSymmetric(horizontalPercent: 0.01,verticalPercent: 0.0019),
                    decoration: BoxDecoration(
                      color: AppConstants.boxColor,
                      borderRadius: ResponsiveUtils.circular(0.01),
                    ),
                    child: Center(
                      child: Text(
                        "SCOPE",
                        style: AppStyles.blackBoldSmall
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: ResponsiveUtils.height(0.002)),
              Text(
                text ?? '',
                style: AppStyles.themedLargeText,
                softWrap: true,
              ),
            ],
          ),
        ),
        Container(
          width: ResponsiveUtils.width(0.28),
          height: ResponsiveUtils.height(0.08),
          decoration: BoxDecoration(
            color: lightModeController.isLightMode.value ? Colors.white : Colors.black,
            borderRadius: ResponsiveUtils.circular(0.02),
          ),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children:  [
                  Text(
                    'Modules \nCovered',
                    style: AppStyles.plainTextLarge,
                  ),
                ],
              ),
              SizedBox(width: ResponsiveUtils.width(0.01)),
              Text(
                moduleText ?? '',
                style: TextStyle(
                  fontSize: ResponsiveUtils.fontSize(0.08),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
