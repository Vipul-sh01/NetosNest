import 'package:flutter/material.dart';
import '../../Constents/AppConstents.dart';
import '../../Widgets/ReusableWidgets.dart';

class OnboardingScreenThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ReusableWidgets(imagePath: AppConstants.onboardingThree, text: AppConstants.onboardingTextThree,),
    );
  }
}