// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
//
// class PaymentCard extends StatelessWidget {
//   const PaymentCard({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return ClipRRect(
//       borderRadius: BorderRadius.circular(30),
//       child: Container(
//         width: 350,
//         height: 230,
//         margin: const EdgeInsets.symmetric(horizontal: 8),
//         decoration: BoxDecoration(
//           gradient: const LinearGradient(
//             colors: [Color(0xFF09041B), Color(0xFF1A1038)],
//             begin: Alignment.bottomLeft,
//             end: Alignment.topRight,
//           ),
//           borderRadius: BorderRadius.circular(20), // Match curve here
//         ),
//         child: Stack(
//           children: [
//             // top right rotated gradient
//             Positioned(
//               top: -50,
//               right: -70,
//               child: Transform.rotate(
//                 angle: -0.6,
//                 child: Container(
//                   width: 200,
//                   height: 300,
//                   decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                       begin: Alignment.topLeft,
//                       end: Alignment.bottomRight,
//                       colors: [
//                         Colors.deepPurple.shade900.withOpacity(0.4),
//                         Colors.transparent,
//                       ],
//                     ),
//                     borderRadius: BorderRadius.circular(150),
//                   ),
//                 ),
//               ),
//             ),
//             // bottom left rotated gradient
//             Positioned(
//               bottom: -50,
//               left: -70,
//               child: Transform.rotate(
//                 angle: -0.5,
//                 child: Container(
//                   width: 200,
//                   height: 300,
//                   decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                       begin: Alignment.bottomLeft,
//                       end: Alignment.topLeft,
//                       colors: [
//                         Colors.deepPurple.shade800.withOpacity(0.5),
//                         Colors.transparent,
//                       ],
//                     ),
//                     borderRadius: BorderRadius.circular(150),
//                   ),
//                 ),
//               ),
//             ),
//             // card content
//             Padding(
//               padding: const EdgeInsets.all(20),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // top row
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Image.asset(
//                         'assets/SimChip.png',
//                         width: 40,
//                       ),
//                       SvgPicture.asset(
//                         'assets/mastercard_logo.svg',
//                         width: 60,
//                       ),
//                     ],
//                   ),
//                   const Spacer(),
//                   const Text(
//                     '5282 3456 7890 1289',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 18,
//                       letterSpacing: 2,
//                     ),
//                   ),
//                   const SizedBox(height: 12),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: const [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'Card Holder',
//                             style: TextStyle(color: Colors.white70, fontSize: 10),
//                           ),
//                           SizedBox(height: 4),
//                           Text(
//                             'Roronoa Zoro',
//                             style: TextStyle(color: Colors.white),
//                           ),
//                         ],
//                       ),
//                       Text(
//                         '09/25',
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
