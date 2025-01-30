import 'dart:convert';

import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:smartcue/Exception/network_exception.dart';

class GoogleGenerativeAI {
  static const String _apiKey = "AIzaSyAVKoelBPpnVOn2JqHSSg6xDzQuV8rVwg4";
  static const Duration _timeout = Duration(seconds: 30);

  Future<String> generateContent(String prompt) async {
    try {
      final model = GenerativeModel(
        model: 'gemini-1.5-flash-latest',
        apiKey: _apiKey,
      );

      final response = await model
          .generateContent([Content.text(prompt)]).timeout(_timeout,
              onTimeout: () {
        throw const TimeoutException();
      });

      if (response.text == null) {
        throw const InvalidResponseException();
      }

      return response.text!;
    } on TimeoutException {
      rethrow;
    } on ApiException {
      rethrow;
    } catch (e) {
      try {
        final Map<String, dynamic> errorData = jsonDecode(e.toString());
        final error = errorData['error'] ?? {};
        final errorMessage = error['message'] ?? 'Unknown error occurred';
        final errorCode = error['code'] ?? 500;

        throw ApiException(errorMessage, errorCode);
      } catch (_) {
        // If parsing fails, return a generic error
        throw ApiException('Failed to generate content: ${e.toString()}', 500);
      }
    }
  }
}
