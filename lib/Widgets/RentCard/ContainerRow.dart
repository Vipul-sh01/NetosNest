import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../Constents/AppConstents.dart';
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
                    style: TextStyle(
                      color: lightModeController.isLightMode.value ? Colors.white : Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    width: 90,
                    height: 22,
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppConstants.boxColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Text(
                        "SCOPE",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                text ?? '',
                style: TextStyle(
                  color: lightModeController.isLightMode.value ? Colors.white : Colors.black,
                  fontSize: 24,
                ),
                softWrap: true,
              ),
            ],
          ),
        ),
        Container(
          height: 100,
          width: 170,
          decoration: BoxDecoration(
            color: lightModeController.isLightMode.value ? Colors.white : Colors.black,
            borderRadius: BorderRadius.circular(16),
          ),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Text(
                    'Modules \nCovered',
                    style: TextStyle(
                      fontSize: 26,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 12),
              Text(
                moduleText ?? '',
                style: const TextStyle(
                  fontSize: 50,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
