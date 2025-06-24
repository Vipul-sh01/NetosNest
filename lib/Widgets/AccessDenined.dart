import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Views/PaymentCardScreen.dart';

void showAccessDeniedDialog() {
  Get.dialog(
    Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 20,
              offset: const Offset(0, 12),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Lock Icon with updated color
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xFFA883C5).withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.lock_outline, color: Color(0xFFA883C5), size: 48),
            ),
            const SizedBox(height: 24),
            Text(
              'Access Denied',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),

            const SizedBox(height: 12),

            // Description with a softer color
            Text(
              'This content is locked.\nPlease unlock it to continue.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
              ),
            ),

            const SizedBox(height: 28),

            // Buttons Row
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Get.back(),
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Color(0xFFBBDEFB),
                      foregroundColor: Colors.grey.shade800,
                      side: BorderSide(color: Colors.grey.shade300),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: const Text('Later'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Get.back();
                      // Get.to(() => PaymentScreen());
                    },
                    icon: const Icon(Icons.lock_open, size: 18),
                    label: const Text('Unlock Now'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFA883C5),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      textStyle: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
    barrierDismissible: false,
    transitionDuration: const Duration(milliseconds: 300),
    transitionCurve: Curves.easeInOut,
  );
}
