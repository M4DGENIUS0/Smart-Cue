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
Note: Generate the script according to Template, Description, Tone of Voice, and Language. Just create text; don't add additional useless things. 
Don't add [], Scene, Voice, steps, or over-complicated formatting. Simple display text only.
    """;
  }
}
