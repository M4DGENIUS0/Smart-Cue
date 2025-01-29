part of 'generation_bloc.dart';

class GenerationState extends Equatable {
  final String selectedTemplate;
  final String description;
  final String toneOfVoice;
  final String language;
  final String Display;
  final String title;
  final bool loading;

  const GenerationState(
      {this.selectedTemplate = '',
      this.description = '',
      this.toneOfVoice = '',
      this.language = '',
      this.Display = '',
      this.loading = false,
      this.title = ''});

  GenerationState copyWith(
      {String? selectedTemplate,
      String? description,
      String? toneOfVoice,
      String? language,
      String? Display,
      String? title,
      bool? loading}) {
    return GenerationState(
        Display: Display ?? this.Display,
        selectedTemplate: selectedTemplate ?? this.selectedTemplate,
        description: description ?? this.description,
        toneOfVoice: toneOfVoice ?? this.toneOfVoice,
        language: language ?? this.language,
        loading: loading ?? this.loading,
        title: title ?? this.title);
  }

  @override
  List<Object?> get props => [
        Display,
        loading,
        language,
        toneOfVoice,
        description,
        selectedTemplate,
        title
      ];
}

final class GenerationInitial extends GenerationState {}
