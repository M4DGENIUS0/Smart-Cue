part of 'smart_cue_bloc.dart';

abstract class SmartCueEvent extends Equatable {
  const SmartCueEvent();

  @override
  List<Object?> get props => [];
}

class SaveTextEvent extends SmartCueEvent {
  final String title;

  final String content;

  const SaveTextEvent({this.title = "", this.content = ""});

  @override
  List<Object?> get props => [title, content];
}

class SaveTextToPDFEvent extends SmartCueEvent {}

class ClearTextEvent extends SmartCueEvent {}
