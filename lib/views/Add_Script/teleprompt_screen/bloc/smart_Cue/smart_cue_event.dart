part of 'smart_cue_bloc.dart';

abstract class SmartCueEvent extends Equatable {
  const SmartCueEvent();

  @override
  List<Object?> get props => [];
}

class EditTextEvent extends SmartCueEvent {
  final String text;

  const EditTextEvent(this.text);

  @override
  List<Object?> get props => [text];
}

class SaveTextEvent extends SmartCueEvent {}
