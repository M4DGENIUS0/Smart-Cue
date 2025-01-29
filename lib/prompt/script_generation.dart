class ScriptGeneration {
  final String template;
  final String description; // Adjusted naming convention to lowercase
  final String toneOfVoice;
  final String language;

  ScriptGeneration({
    required this.template,
    required this.description,
    required this.toneOfVoice,
    required this.language,
  });

  /// Generates the dynamic prompt based on user input
  String get prompt {
    return """

Create Teleprompt Script with the following options:
Template: $template 
Description: $description
Tone of voice: $toneOfVoice
Language: $language 
Note: Generate the script according to the template, description, tone of voice, and language. Do not add additional text, formatting, or steps. Generate plain text output for a teleprompt.
    """;
  }

  @override
  String toString() {
    return prompt;
  }
}
