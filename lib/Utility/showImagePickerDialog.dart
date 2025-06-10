import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Services/ImagePicker.dart';
import 'dart:io';

class ImagePickerDialog extends StatelessWidget {
  final Function(File) onImagePicked;
  final ImagePickerService imagePickerService = Get.find<ImagePickerService>();

  ImagePickerDialog({required this.onImagePicked});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        ListTile(
          leading: Icon(Icons.camera_alt),
          title: Text('Take a Photo'),
          onTap: () async {
            File? pickedImage = await imagePickerService.pickImages(true);
            if (pickedImage != null) {
              onImagePicked(pickedImage);
            }
            Get.back(); // Close the dialog
          },
        ),
        ListTile(
          leading: Icon(Icons.photo_library),
          title: Text('Choose from Gallery'),
          onTap: () async {
            File? pickedImage = await imagePickerService.pickImages(false);
            if (pickedImage != null) {
              onImagePicked(pickedImage);
            }
            Get.back(); // Close the dialog
          },
        ),
      ],
    );
  }
}
