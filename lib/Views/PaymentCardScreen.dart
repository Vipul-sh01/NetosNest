// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import '../Constents/AppConstents.dart';
// import '../Constents/AppStyles.dart';
// import '../Constents/PaymentConstents.dart';
// import '../ViewModels/DarkModeViewModels.dart';
// import '../ViewModels/Payment.dart';
// import '../ViewModels/PaymentViewModels.dart';
// import '../Widgets/BottonBar/BottomBar.dart';
// import '../Widgets/Buttons/BackWidgets.dart';
// import '../Widgets/NarrowContainer.dart';
// import '../Widgets/PaymentCard/CardScaleEffect.dart';
// import '../Widgets/PaymentCard/PaymentOptions.dart';
// import '../Widgets/RentCard/RentButton.dart';
//
//
// class PaymentScreen extends StatelessWidget {
//   final PageController _pageController = PageController(viewportFraction: 0.75);
//   final controller = Get.put(PageViewController());
//   final PaymentController c = Get.put(PaymentController());
//   final LightModeController lightModeController = Get.put(LightModeController());
//
//   @override
//   Widget build(BuildContext context) {
//     _pageController.addListener(() {
//       controller.updatePage(_pageController.page ?? 0.0);
//     });
//
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: true,
//         backgroundColor:
//         lightModeController.isLightMode.value ? Colors.black : Colors.white,
//         leading: BackWidget(
//           onTap: () => Get.back(),
//           imagePath: lightModeController.isLightMode.value
//               ? AppConstants.backWhiteIcon
//               : AppConstants.backBlackIcon,
//         ),
//         title: Text(
//           AppConstants.noteSwapTexts,
//           style: AppStyles.textStyleLargeBold,
//         ),
//         elevation: 0,
//         centerTitle: true,
//         actions: [
//           BackWidget(
//             onTap: () {},
//             imagePath: lightModeController.isLightMode.value
//                 ? AppConstants.whiteSettingIcon
//                 : AppConstants.blackSettingIcon,
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             NarrowContainer(isLightMode: lightModeController.isLightMode.value),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
//               child: Row(
//                 children: [
//                   const Text(
//                     'Review the Rented Notes',
//                     style: TextStyle(
//                       fontSize: 22,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.purple,
//                     ),
//                   ),
//                   Spacer(),
//                   TextButton.icon(
//                     onPressed: () {},
//                     icon: const Icon(Icons.add, size: 18),
//                     label: const Text('Add New Card'),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 200,
//               child: CardScaleEffect(
//                 pageController: _pageController,
//                 controller: controller,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: const Divider(
//                 height: 30,
//                 thickness: 2,
//                 color: Colors.black,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     'Other Payment Options',
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   ...PaymentConstants.paymentMethods.map((method) {
//                     return PaymentOptions(c: c, method: method);
//                   }).toList(),
//
//                 ],
//               ),
//             ),
//             const SizedBox(height: 20),
//             Container(
//               padding: const EdgeInsets.only(top: 35, bottom: 20, right: 16, left: 16),
//               decoration: const BoxDecoration(
//                 color: Colors.black,
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   const Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         'Plan',
//                         style: TextStyle(color: Colors.white, fontSize: 18),
//                       ),
//                       Text(
//                         '₹ 100',
//                         style: TextStyle(color: Colors.white, fontSize: 18),
//                       ),
//                     ],
//                   ),
//                   const Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         'Our Cut',
//                         style: TextStyle(color: Colors.white, fontSize: 18),
//                       ),
//                       Text(
//                         '₹ 10',
//                         style: TextStyle(color: Colors.white, fontSize: 18),
//                       ),
//                     ],
//                   ),
//                   const Divider(),
//                   const Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         'Summary',
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white,
//                             fontSize: 20),
//                       ),
//                       Text(
//                         '₹ 110.00',
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white,
//                             fontSize: 20),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 12),
//                   RentButton(
//                     onPressed: () {},
//                     text: 'PAY NOW',
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomNavBar(),
//     );
//   }
// }
