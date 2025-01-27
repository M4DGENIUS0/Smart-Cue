part of 'generation_bloc.dart';

class GenerationState extends Equatable {
  final String selectedTemplate;
  final String description;
  final String toneOfVoice;
  final String language;
  final String Display;
  final bool loading;

  const GenerationState(
      {this.selectedTemplate = '',
      this.description = '',
      this.toneOfVoice = '',
      this.language = '',
      this.Display = '',
      this.loading = true});

  GenerationState copyWith(
      {String? selectedTemplate,
      String? description,
      String? toneOfVoice,
      String? language,
      String? Display,
      bool? loading}) {
    return GenerationState(
        Display: Display ?? this.Display,
        selectedTemplate: selectedTemplate ?? this.selectedTemplate,
        description: description ?? this.description,
        toneOfVoice: toneOfVoice ?? this.toneOfVoice,
        language: language ?? this.language,
        loading: loading ?? this.loading);
  }

  @override
  List<Object?> get props =>
      [Display, loading, language, toneOfVoice, description, selectedTemplate];
}

final class GenerationInitial extends GenerationState {}
