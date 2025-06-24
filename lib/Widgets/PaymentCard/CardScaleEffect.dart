// import 'package:flutter/cupertino.dart';
// import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
// import '../../ViewModels/PaymentViewModels.dart';
// import 'PaymentCardWidgets.dart';
//
//
// class CardScaleEffect extends StatelessWidget {
//   const CardScaleEffect({
//     super.key,
//     required PageController pageController,
//     required this.controller,
//   }) : _pageController = pageController;
//
//   final PageController _pageController;
//   final PageViewController controller;
//
//   @override
//   Widget build(BuildContext context) {
//     return PageView.builder(
//       controller: _pageController,
//       itemCount: 3,
//       itemBuilder: (context, index) {
//         return Obx(() {
//           final scale = (1 - (controller.currentPage.value - index).abs() * 0.3).clamp(0.85, 1.0);
//           return Center(
//             child: Transform.scale(
//               scale: scale,
//               child: const PaymentCard(), // if PaymentCard needs index, pass it here
//             ),
//           );
//         });
//       },
//     );
//   }
// }