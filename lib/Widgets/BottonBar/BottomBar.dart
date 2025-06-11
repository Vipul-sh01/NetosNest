import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:NotesNest/Constents/AppConstents.dart';
import 'package:NotesNest/ViewModels/NavController.dart';
import './BottomNavItemWidget.dart';

class BottomNavBar extends StatelessWidget {
  final BottomNavController controller = Get.put(BottomNavController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 67,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Obx(() {
        return Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.topCenter,
          children: [
            BottomNavigationBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              type: BottomNavigationBarType.fixed,
              currentIndex: controller.selectedIndex.value,
              onTap: controller.changeIndex,
              items: [
                BottomNavigationBarItem(
                  icon: BottomNavItemWidget(assetPath: AppConstants.homeIcon, index: 0),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: BottomNavItemWidget(assetPath: AppConstants.exploreIcon, index: 1),
                  label: '',
                ),
                const BottomNavigationBarItem(
                  icon: SizedBox.shrink(), // placeholder for center add button
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: BottomNavItemWidget(assetPath: AppConstants.addFile, index: 3),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: BottomNavItemWidget(assetPath: AppConstants.userIcon, index: 4),
                  label: '',
                ),
              ],
              showSelectedLabels: false,
              showUnselectedLabels: false,
            ),
            Positioned(
              top: -10,
              child: GestureDetector(
                onTap: () => controller.changeIndex(2), // Middle button (e.g., add note)
                child: Container(
                  height: 64,
                  width: 64,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: const Center(
                    child: Icon(Icons.add, color: Colors.white, size: 52),
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
