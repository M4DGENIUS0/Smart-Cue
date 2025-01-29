import 'package:google_generative_ai/google_generative_ai.dart';

class GoogleGenerativeAI {
  final String API_KEY = "AIzaSyAVKoelBPpnVOn2JqHSSg6xDzQuV8rVwg4";

  Future GemeniService(String prompt) async {
    try {
      final model = GenerativeModel(
        model: 'gemini-1.5-flash-latest',
        apiKey: API_KEY,
      );

      final content = [Content.text(prompt)];
      final response = await model.generateContent(content);
      print("Response: ${response.text}");

      if (response.text != null) {
        // Directly use the response text without decoding
        print('Response text: ${response.text}');
      } else {
        print('Error fetching data: ${response.toString()}');
      }
      return response.text ?? "No Response";
    } catch (e) {
      print("Error: $e");
      return "Error: $e";
    }
  }
}
