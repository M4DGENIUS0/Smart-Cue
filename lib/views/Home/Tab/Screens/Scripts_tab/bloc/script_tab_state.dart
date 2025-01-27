part of 'script_tab_bloc.dart';

abstract class ScriptState extends Equatable {
  const ScriptState();

  @override
  List<Object> get props => [];
}

class ScriptsInitialState extends ScriptState {}

class ScriptsLoadingState extends ScriptState {}

class ScriptsLoadedState extends ScriptState {
  final List<ScriptModel> scripts;

  const ScriptsLoadedState(this.scripts);

  @override
  List<Object> get props => [scripts];
}

class ScriptsLoadingErrorState extends ScriptState {
  final String message;

  const ScriptsLoadingErrorState(this.message);

  @override
  List<Object> get props => [message];
}
