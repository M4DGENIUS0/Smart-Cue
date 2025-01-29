part of 'smart_cue_bloc.dart';

abstract class SmartCueEvent extends Equatable {
  const SmartCueEvent();

  @override
  List<Object?> get props => [];
}

class SaveTextEvent extends SmartCueEvent {
  final String title;
  final String? id;
  final String content;

  const SaveTextEvent({this.title = "", this.content = "", this.id = ""});

  @override
  List<Object?> get props => [title, content, id];
}

class ClearTextEvent extends SmartCueEvent {}

class LoadExistingScriptEvent extends SmartCueEvent {
  final String id;

  const LoadExistingScriptEvent(this.id);

  @override
  List<Object?> get props => [id];
}
