import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class PageViewController extends GetxController {
  var currentPage = 0.0.obs;

  void updatePage(double value) {
    currentPage.value = value;
  }
}