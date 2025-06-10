import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../ViewModels/DarkModeViewModels.dart';
import '../RentCard/OfferBottom.dart';
import '../RentCard/OfferHeader.dart';

class SearchCard extends StatelessWidget {
  final Color color;
  final String text;
  final String? courseName;
  final String imageUrl;

  SearchCard({
    super.key,
    required this.color,
    required this.text,
    required this.imageUrl,
    this.courseName,
  });

  final LightModeController lightModeController =
      Get.put(LightModeController());

  @override
  Widget build(BuildContext context) {
    // Check if image URL is valid
    final bool isImageValid =
        imageUrl.isNotEmpty && Uri.tryParse(imageUrl)?.hasAbsolutePath == true;

    return Obx(
      () => Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          padding:
              const EdgeInsets.only(top: 10, right: 22, left: 24, bottom: 18),
          decoration: BoxDecoration(
            color: lightModeController.isLightMode.value
                ? Colors.black
                : Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    OfferHeader(
                      color: color,
                      courseName: courseName,
                    ),
                    const SizedBox(height: 8),
                    OfferBottom(
                      text: text,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: isImageValid
                        ? Container(
                            color: Colors.white,
                            child: Image.network(
                              imageUrl,
                              width: 110,
                              height: 100,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  const Icon(Icons.broken_image, size: 50),
                              loadingBuilder:
                                  (context, child, loadingProgress) {
                                if (loadingProgress == null) return child;
                                return const SizedBox(
                                  width: 110,
                                  height: 100,
                                  child: Center(
                                      child: CircularProgressIndicator()),
                                );
                              },
                            ),
                          )
                        : Container(
                            width: 110,
                            height: 100,
                            color: Colors.pink,
                            child:
                                const Icon(Icons.image_not_supported, size: 50),
                          ),
                  ),
                  Positioned(
                    bottom: -10,
                    right: -20,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.0),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Text(
                        "+2",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
