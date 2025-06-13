import 'package:NotesNest/Utility/ResponsiveUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../PreviewImageWidget.dart';

class RentImage extends StatelessWidget {
  final String imageUrl;
  final VoidCallback onTap;
  const RentImage({
    super.key,
    required this.imageUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: PreviewImageWidget(
              imageUrl: imageUrl,
              fit: BoxFit.cover,
              width:ResponsiveUtils.width(0.3),
              onTap: onTap,
            )
          ),
          Expanded(
            child: PreviewImageWidget(
              imageUrl: imageUrl,
              fit: BoxFit.cover,
              width:ResponsiveUtils.width(0.3),
              onTap: onTap,
            )
          ),
          Expanded(
            child: PreviewImageWidget(
              imageUrl: imageUrl,
              fit: BoxFit.cover,
              width:ResponsiveUtils.width(0.3),
              onTap: onTap,
            )
          ),
        ],
      ),
    );
  }
}
