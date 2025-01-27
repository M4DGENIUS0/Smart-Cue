import 'package:openai_dart/openai_dart.dart';

class openaidart {
  final client = OpenAIClient(apiKey: '');
  Future<String> completions(String prompt) async {
    try {
      final res = await client.createCompletion(
        request: CreateCompletionRequest(
          model: CompletionModel.modelId('gpt-3.5-turbo-instruct'),
          prompt: CompletionPrompt.string(prompt),
          maxTokens: 7,
          temperature: 0,
        ),
      );
      print(res.choices.first.text);

      return res.choices.first.text.toString();
    } catch (e) {
      rethrow;
    }
  }
}
