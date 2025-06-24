import 'package:NotesNest/Utility/ResponsiveUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../ViewModels/DarkModeViewModels.dart';

class OfferHeader extends StatelessWidget {
  final Color? color;
  final String? courseName;
  OfferHeader({
    super.key,
    this.color,
    this.courseName,
  });

  final LightModeController lightModeController = Get.put(LightModeController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> Row(
        children: [
          Text(
            courseName ?? "CSE 2005",
            style: TextStyle(
              color: lightModeController.isLightMode.value ? Colors.white : Colors.black,
              fontSize: ResponsiveUtils.fontSize(0.03),
            ),
          ),
          SizedBox(width: ResponsiveUtils.width(0.02)),
          Container(
            width: ResponsiveUtils.width(0.15),
            height: ResponsiveUtils.height(0.021),
            padding: ResponsiveUtils.paddingSymmetric(horizontalPercent: 0.01,verticalPercent: 0.0019),
            decoration: BoxDecoration(
              color: color,
              borderRadius: ResponsiveUtils.circular(0.01),
            ),
            child: Center(
              child: Text(
                 "SCOPE",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: ResponsiveUtils.fontSize(0.03),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
