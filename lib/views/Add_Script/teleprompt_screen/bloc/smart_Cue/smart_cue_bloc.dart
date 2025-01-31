import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../../../../../model/script_model.dart';
import '../../../../../controllers/script repo/hive_script_repo.dart';
part 'smart_cue_event.dart';
part 'smart_cue_state.dart';

class SmartCueBloc extends Bloc<SmartCueEvent, SmartCueState> {
  final TextEditingController contentController = TextEditingController();
  final TextEditingController titleController = TextEditingController();

  final HiveScriptRepository scriptRepository = HiveScriptRepository();
  SmartCueBloc() : super(const SmartCueState()) {
    on<SaveTextEvent>((event, emit) async {
      if (contentController.text.isNotEmpty) {
        final newScript = ScriptModel(
          id: event.id ?? const Uuid().v4(),
          title: titleController.text,
          content: contentController.text,
          isGenerated: false,
          createdAt: DateTime.now(),
        );

        if (event.id != null) {
          await scriptRepository.updateScript(event.id!, newScript);
        } else {
          await scriptRepository.addScript(newScript);
        }

        emit(state.copyWith(
            id: newScript.id,
            title: newScript.title,
            content: newScript.content));
      }
    });

    on<ClearTextEvent>((event, emit) {
      titleController.clear();
      contentController.clear();
    });
    on<LoadExistingScriptEvent>((event, emit) async {
      final script = scriptRepository.getScriptbyID(event.id);
      if (script != null) {
        titleController.text = script.title;
        contentController.text = script.content;
        emit(state.copyWith(
            id: script.id, title: script.title, content: script.content));
      }
    });
  }
}
