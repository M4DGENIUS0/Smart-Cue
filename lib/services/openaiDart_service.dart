import 'package:openai_dart/openai_dart.dart';

class openaidart {
  final client = OpenAIClient(
      apiKey:
          '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');
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
