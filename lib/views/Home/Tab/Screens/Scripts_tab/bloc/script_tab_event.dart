part of 'script_tab_bloc.dart';

abstract class ScriptEvent extends Equatable {
  const ScriptEvent();

  @override
  List<Object> get props => [];
}

class LoadScriptsEvent extends ScriptEvent {}
