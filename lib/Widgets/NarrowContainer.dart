import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Constents/AppConstents.dart';
import '../Utility/ResponsiveUtils.dart';

class NarrowContainer extends StatelessWidget {
  final bool isLightMode;
  const NarrowContainer({
    super.key,
    required this.isLightMode
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ResponsiveUtils.height(0.02),
      width: double.infinity,
      decoration: BoxDecoration(
        color: isLightMode ? Colors.black : Colors.white,
          borderRadius: ResponsiveUtils.borderRadiusOnly(
            bottomRight: 0.04,
            bottomLeft: 0.04,
          )
      ),
    );
  }
}