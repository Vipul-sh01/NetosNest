import 'package:flutter/material.dart';
import '../../Constents/AppStyles.dart';

class BottomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final String sText;
  const BottomButton({super.key, required this.onTap, required this.text, required this.sText});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          text,
          style: AppStyles.normalText,
        ),
        const SizedBox(width: 5),
        GestureDetector(
          onTap: onTap,
          child: Text(
            sText,
            style: AppStyles.boldUnderlinedText,
          ),
        ),
      ],
    );
  }
}
