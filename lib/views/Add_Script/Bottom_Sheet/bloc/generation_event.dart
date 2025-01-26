part of 'generation_bloc.dart';

abstract class GenerationEvent {}

class UpdateTemplate extends GenerationEvent {
  final String template;

  UpdateTemplate(this.template);
}

class UpdateDescription extends GenerationEvent {
  final String description;

  UpdateDescription(this.description);
}

class UpdateToneOfVoice extends GenerationEvent {
  final String toneOfVoice;

  UpdateToneOfVoice(this.toneOfVoice);
}

class UpdateLanguage extends GenerationEvent {
  final String language;

  UpdateLanguage(this.language);
}

class Display extends GenerationEvent {}
