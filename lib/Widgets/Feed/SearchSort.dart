import 'package:NotesNest/Utility/ResponsiveUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Constents/AppConstents.dart';
import '../../Constents/AppStyles.dart';
import '../ImageWidgets.dart';

class SearchSort extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final VoidCallback onTap;

  SearchSort({
    super.key,
    required this.onChanged,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ResponsiveUtils.paddingSymmetric(horizontalPercent: 0.04, verticalPercent: 0.01),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: GestureDetector(
              onTap: (){},
              child: Container(
                padding: ResponsiveUtils.paddingSymmetric(horizontalPercent: 0.04, verticalPercent: 0.01),
                decoration: BoxDecoration(
                  color: AppConstants.searchColors,
                  borderRadius: ResponsiveUtils.circular(0.02),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: ResponsiveUtils.height(0.03),
                        child: TextField(
                          style: TextStyle(
                            fontSize: ResponsiveUtils.fontSize(0.03),
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                          decoration: const InputDecoration(
                            isDense: true,
                            hintText: "Theory of Computation...",
                            contentPadding: EdgeInsets.zero,
                            border: InputBorder.none,
                          ),
                          maxLines: 1,
                         onChanged: onChanged,
                        ),
                      ),
                    ),
                    SizedBox(width: ResponsiveUtils.width(0.01)),
                    ImageWidget(
                      imagePath: AppConstants.groupSearchIcon,
                      fit: BoxFit.contain,
                      width: ResponsiveUtils.width(0.049),
                      height: ResponsiveUtils.height(0.02),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(width: ResponsiveUtils.width(0.03)),
          GestureDetector(
            onTap: onTap,
            child: SizedBox(
              width: ResponsiveUtils.width(0.25),
              child: Container(
                padding: ResponsiveUtils.paddingSymmetric(horizontalPercent: 0.04, verticalPercent: 0.013),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: ResponsiveUtils.circular(0.02),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ImageWidget(
                      imagePath: AppConstants.sortIcon,
                      fit: BoxFit.contain,
                      width: ResponsiveUtils.width(0.049),
                      height: ResponsiveUtils.height(0.02),
                    ),
                    SizedBox(width: ResponsiveUtils.width(0.03)),
                    Text(
                      "Sort",
                      style: AppStyles.whiteNormalText,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
