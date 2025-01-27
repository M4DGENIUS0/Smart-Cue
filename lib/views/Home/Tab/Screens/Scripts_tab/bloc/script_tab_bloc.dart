import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../model/script_model.dart';
import '../../../../../../repository/script repo/hive_script_repo.dart';
import '../../../../../../services/hive_services.dart';

part 'script_tab_event.dart';
part 'script_tab_state.dart';

class ScriptBloc extends Bloc<ScriptEvent, ScriptState> {
  final HiveScriptRepository scriptRepository = HiveScriptRepository();
  final StreamController<List<ScriptModel>> _scriptsController =
      StreamController<List<ScriptModel>>.broadcast();

  Stream<List<ScriptModel>> get scriptsStream => _scriptsController.stream;

  ScriptBloc() : super(ScriptsLoadingState()) {
    on<LoadScriptsEvent>(_onLoadScriptsEvent);
  }

  void _onLoadScriptsEvent(
      LoadScriptsEvent event, Emitter<ScriptState> emit) async {
    emit(ScriptsLoadingState());
    try {
      // Get initial scripts list and emit
      final scripts = scriptRepository.getAllScript();
      _scriptsController.add(scripts);
      emit(ScriptsLoadedState(scripts));
    } catch (e) {
      emit(ScriptsLoadingErrorState(e.toString()));
    }
  }
}
