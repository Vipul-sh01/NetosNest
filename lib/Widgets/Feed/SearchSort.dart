import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Constents/AppConstents.dart';
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
      padding: const EdgeInsets.symmetric(horizontal: 26.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: GestureDetector(
              onTap: (){},
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: AppConstants.searchColors,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 22,
                        child: TextField(
                          style: const TextStyle(
                            fontSize: 16,
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

                    const SizedBox(width: 8),
                    ImageWidget(
                      imagePath: AppConstants.groupSearchIcon,
                      fit: BoxFit.contain,
                      height: 25,
                      width: 40,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: onTap,
            child: SizedBox(
              width: 100,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ImageWidget(
                      imagePath: AppConstants.sortIcon,
                      fit: BoxFit.contain,
                      height: 25,
                      width: 40,
                    ),
                    const SizedBox(width: 5),
                    const Text(
                      "Sort",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
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
