import 'package:dio/dio.dart';
import 'package:openai_dart/openai_dart.dart';

class OpenaiService {
  final Dio _dio = Dio(BaseOptions(baseUrl: '', headers: {
    'Authorization': '',
    'Content-Type': '',
  }));

  Future<String> fetchTeleprompt(String prompt) async {
    try {
      final response = await _dio.post('/completions', data: {
        'model': 'text-davinci-003',
        'prompt': prompt,
        'max_tokens': 1500, // Adjust token limit as needed
        'temperature': 0.7,
      });
      if (response.statusCode == 200) {
        return response.data['choices'][0]['text'] ?? '';
      } else {
        throw Exception('Failed to fetch response');
      }
    } catch (e) {
      rethrow;
    }
  }
}
