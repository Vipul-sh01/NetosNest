import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Constents/AppStyles.dart';
import '../Utility/ResponsiveUtils.dart';

class LoginHeadlines extends StatelessWidget {
  final String headingText;
  final String subHeadingText;
  const LoginHeadlines({
    super.key,
    required this.headingText,
    required this.subHeadingText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          headingText,
          style: AppStyles.loginHeading,
        ),
        SizedBox(height: ResponsiveUtils.height(0.01)),
        Text(
          subHeadingText,
          textAlign: TextAlign.center,
          style: AppStyles.loginSubheading,
        ),
      ],
    );
  }
}