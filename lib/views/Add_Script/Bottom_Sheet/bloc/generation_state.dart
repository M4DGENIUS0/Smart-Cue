part of 'generation_bloc.dart';

class GenerationState extends Equatable {
  final String errormessage;
  final String selectedTemplate;
  final String description;
  final String toneOfVoice;
  final String language;
  final String display;
  final String title;

  final GenerationStatus status;
  const GenerationState(
      {this.selectedTemplate = '',
      this.errormessage = '',
      this.description = '',
      this.toneOfVoice = '',
      this.language = '',
      this.display = '',
      this.status = GenerationStatus.initial,
      this.title = ''});

  GenerationState copyWith(
      {String? selectedTemplate,
      String? description,
      String? errormessage,
      String? toneOfVoice,
      String? language,
      String? Display,
      String? title,
      GenerationStatus? status}) {
    return GenerationState(
        status: status ?? this.status,
        errormessage: errormessage ?? this.errormessage,
        display: Display ?? display,
        selectedTemplate: selectedTemplate ?? this.selectedTemplate,
        description: description ?? this.description,
        toneOfVoice: toneOfVoice ?? this.toneOfVoice,
        language: language ?? this.language,
        title: title ?? this.title);
  }

  @override
  List<Object?> get props => [
        errormessage,
        display,
        status,
        language,
        toneOfVoice,
        description,
        selectedTemplate,
        title
      ];
}

final class GenerationInitial extends GenerationState {}
