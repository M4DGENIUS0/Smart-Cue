part of 'script_tab_bloc.dart';

abstract class ScriptEvent extends Equatable {
  const ScriptEvent();

  @override
  List<Object> get props => [];
}

class LoadScriptsEvent extends ScriptEvent {}

// Add this new event
class DeleteScriptEvent extends ScriptEvent {
  final String scriptId;

  const DeleteScriptEvent(this.scriptId);

  @override
  List<Object> get props => [scriptId];
}
