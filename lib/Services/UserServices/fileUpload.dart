import 'dart:io';
import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
import 'package:pdfx/pdfx.dart';

class StorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  UploadTask uploadFileWithProgress(File file, String path) {
    final fileName = basename(file.path);
    final storageRef = _storage.ref().child('$path/$fileName');
    return storageRef.putFile(file);
  }

  Future<String> uploadFileAndGetUrl(File file, String path) async {
    final fileName = basename(file.path);
    final storageRef = _storage.ref().child('$path/$fileName');
    final uploadTask = await storageRef.putFile(file);
    return await uploadTask.ref.getDownloadURL();
  }

  Future<String> getDownloadUrl(String path) async {
    final ref = _storage.ref().child(path);
    return await ref.getDownloadURL();
  }

  /// Generates a preview image from the first page of the PDF and uploads it to Firebase Storage.
  Future<String> generatePreviewFromPdf(File pdfFile, String uploadPath) async {
    final doc = await PdfDocument.openFile(pdfFile.path);
    final page = await doc.getPage(1);
    final pageImage = await page.render(
      width: page.width,
      height: page.height,
      format: PdfPageImageFormat.png,
    );

    await page.close();

    final Uint8List pngBytes = pageImage!.bytes;

    // Upload preview image
    final previewRef = _storage.ref().child('$uploadPath/preview.png');
    final uploadTask = await previewRef.putData(pngBytes, SettableMetadata(contentType: 'image/png'));

    return await uploadTask.ref.getDownloadURL();
  }
}
