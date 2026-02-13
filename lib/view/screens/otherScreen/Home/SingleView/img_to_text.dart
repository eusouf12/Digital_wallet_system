import 'dart:io';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

Future<List<String>> extractOCRData(String imageUrl) async {
  try {
    final response = await http.get(Uri.parse(imageUrl));
    if (response.statusCode != 200) {throw Exception('Failed to download image');}

    final tempDir = await getTemporaryDirectory();
    final file = File('${tempDir.path}/ocr_temp_${DateTime.now().millisecondsSinceEpoch}.png');
    await file.writeAsBytes(response.bodyBytes);

    final inputImage = InputImage.fromFile(file);
    final textRecognizer = TextRecognizer();
    final recognizedText = await textRecognizer.processImage(inputImage);

    List<String> extractedData = [];
    for (TextBlock block in recognizedText.blocks) {
      for (TextLine line in block.lines) {
        String text = line.text.trim();
        if (text.isNotEmpty) {
          extractedData.add('$text');
        }
      }
    }

    await textRecognizer.close();
    await file.delete();

    return extractedData;
  } catch (e) {
    print('Error: $e');
    return [];
  }
}