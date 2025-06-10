import 'dart:typed_data';
import 'package:http/http.dart' as http;

class PdfService {
  Future<Uint8List> getPdfBytes(String url) async {
    try {
      final uri = Uri.parse(url);
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        if (response.bodyBytes.isEmpty) {
          throw Exception("The PDF file is empty.");
        }

        // Validate the file type
        final header = String.fromCharCodes(response.bodyBytes.take(4));
        if (!header.startsWith('%PDF')) {
          throw Exception("The file is not a valid PDF. Header: $header");
        }

        print("✅ PDF fetched successfully. Byte length: ${response.bodyBytes.length}");
        return response.bodyBytes;
      } else {
        throw Exception(
          "Failed to load PDF. Status code: ${response.statusCode}, Reason: ${response.reasonPhrase}",
        );
      }
    } catch (e) {
      // Handle any unexpected errors
      print("❌ Error fetching PDF: $e");
      throw Exception("An error occurred while fetching the PDF: $e");
    }
  }
}