import 'package:NotesNest/Utility/ResponsiveUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../ViewModels/DarkModeViewModels.dart';

class OfferBottom extends StatelessWidget {
  final String text;
  final Widget? title;

  OfferBottom({
    super.key,
    this.title,
    required this.text,
  });

  final LightModeController lightModeController = Get.put(LightModeController());
  @override
  Widget build(BuildContext context) {
    return Obx(()=> Row(
        children: [
          Expanded(
            child: Text(
              text ?? '',
              style: TextStyle(
                color: lightModeController.isLightMode.value ? Colors.white : Colors.black,
                fontSize: ResponsiveUtils.fontSize(0.050)
              ),
              softWrap: true,
            ),
          ),
          SizedBox(width: ResponsiveUtils.width(0.02)),
          if (title != null) title! else const SizedBox(),
        ],
      ),
    );
  }
}
