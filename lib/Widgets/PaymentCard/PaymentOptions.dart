import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../ViewModels/Payment.dart';

class PaymentOptions extends StatelessWidget {
  const PaymentOptions({
    super.key,
    required this.c,
    required this.method,
  });

  final PaymentController c;
  final Map<String, String> method;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: method['icon']!.endsWith('.svg')
          ? SvgPicture.asset(
        method['icon']!,
        height: 30,
        width: 30,
      )
          : Image.asset(
        method['icon']!,
        height: 34,
        width: 34,
      ),
      title: Text(
        method['name']!,
        style: const TextStyle(
          fontSize: 20,
        ),
      ),
      trailing: Obx(() => Transform.scale(
        scale: 1.5,
        child: Radio<String>(
          value: method['name']!,
          groupValue: c.selectedPayment.value,
          onChanged: (value) {
            c.selectPayment(value!);
          },
        ),
      )),
      onTap: () {
        c.selectPayment(method['name']!);
      },
    );
  }
}
