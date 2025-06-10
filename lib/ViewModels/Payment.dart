import 'package:get/get.dart';

class PaymentController extends GetxController {
  final selectedPayment = ''.obs;

  void selectPayment(String method) {
    selectedPayment.value = method;
  }
}
