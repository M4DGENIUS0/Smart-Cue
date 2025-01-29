part of 'generation_bloc.dart';

abstract class GenerationEvent extends Equatable {}

class UpdateTemplate extends GenerationEvent {
  final String template;

  UpdateTemplate(this.template);

  @override
  List<Object?> get props => [template];
}

class UpdateDescription extends GenerationEvent {
  final String description;

  UpdateDescription(this.description);

  @override
  List<Object?> get props => [description];
}

class UpdateToneOfVoice extends GenerationEvent {
  final String toneOfVoice;

  UpdateToneOfVoice(this.toneOfVoice);

  @override
  List<Object?> get props => [toneOfVoice];
}

class UpdateLanguage extends GenerationEvent {
  final String language;

  UpdateLanguage(this.language);

  @override
  List<Object?> get props => [language];
}

class PostRequesttoAPI extends GenerationEvent {
  final String title;

  PostRequesttoAPI({this.title = ""});
  @override
  List<Object?> get props => [title];
}

class ResetState extends GenerationEvent {
  @override
  List<Object?> get props => [];
}
