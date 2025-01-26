part of 'generation_bloc.dart';

class GenerationState {
  final String selectedTemplate;
  final String description;
  final String toneOfVoice;
  final String language;

  const GenerationState({
    this.selectedTemplate = '',
    this.description = '',
    this.toneOfVoice = '',
    this.language = '',
  });

  GenerationState copyWith({
    String? selectedTemplate,
    String? description,
    String? toneOfVoice,
    String? language,
  }) {
    return GenerationState(
      selectedTemplate: selectedTemplate ?? this.selectedTemplate,
      description: description ?? this.description,
      toneOfVoice: toneOfVoice ?? this.toneOfVoice,
      language: language ?? this.language,
    );
  }
}

final class GenerationInitial extends GenerationState {}
