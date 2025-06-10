import 'package:flutter/material.dart';

class PreviewImageWidget extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final VoidCallback onTap;

  const PreviewImageWidget({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
          ),
          child: Image.network(
            imageUrl,
            width: width,
            height: height,
            fit: fit,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return SizedBox(
                width: width,
                height: height,
                child: const Center(child: CircularProgressIndicator()),
              );
            },
            errorBuilder: (context, error, stackTrace) {
              return SizedBox(
                width: width,
                height: height,
                child: const Center(child: Icon(Icons.broken_image, size: 50)),
              );
            },
          ),
        ),
      ),
    );
  }
}
