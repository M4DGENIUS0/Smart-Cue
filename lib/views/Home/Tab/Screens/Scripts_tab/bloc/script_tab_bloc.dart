import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../model/script_model.dart';
import '../../../../../../repository/script repo/hive_script_repo.dart';

part 'script_tab_event.dart';
part 'script_tab_state.dart';

class ScriptBloc extends Bloc<ScriptEvent, ScriptState> {
  final HiveScriptRepository scriptRepository = HiveScriptRepository();
  late final StreamSubscription<List<ScriptModel>> _scriptsSubscription;

  ScriptBloc() : super(ScriptsLoadingState()) {
    on<LoadScriptsEvent>(_onLoadScriptsEvent);
    on<DeleteScriptEvent>(_onDeleteScriptEvent);

    // Listen for real-time script updates
    _scriptsSubscription = scriptRepository.scriptsStream.listen((scripts) {
      add(ScriptsUpdatedEvent(scripts));
    });

    // Handle real-time updates
    on<ScriptsUpdatedEvent>((event, emit) {
      emit(ScriptsLoadedState(event.scripts));
    });
  }

  void _onLoadScriptsEvent(
      LoadScriptsEvent event, Emitter<ScriptState> emit) async {
    try {
      final scripts = scriptRepository.getAllScript();
      emit(ScriptsLoadedState(scripts));
    } catch (e) {
      emit(ScriptsLoadingErrorState(e.toString()));
    }
  }

  void _onDeleteScriptEvent(
      DeleteScriptEvent event, Emitter<ScriptState> emit) async {
    try {
      await scriptRepository.deleteScript(event.scriptId);
    } catch (e) {
      emit(ScriptsLoadingErrorState(e.toString()));
    }
  }

  @override
  Future<void> close() {
    _scriptsSubscription.cancel(); // Clean up the subscription
    return super.close();
  }
}
