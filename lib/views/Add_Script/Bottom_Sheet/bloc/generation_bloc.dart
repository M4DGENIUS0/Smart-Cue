import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:smartcue/services/GemeniService.dart';
import 'package:uuid/uuid.dart';

import '../../../../model/script_model.dart';
import '../../../../prompt/script_generation.dart';
import '../../../../repository/script repo/hive_script_repo.dart';

part 'generation_event.dart';
part 'generation_state.dart';

class GenerationBloc extends Bloc<GenerationEvent, GenerationState> {
  final TextEditingController titleController = TextEditingController();
  final HiveScriptRepository scriptRepository = HiveScriptRepository();
  final TextEditingController fileName = TextEditingController();

  GenerationBloc() : super(const GenerationState()) {
    on<ResetState>((event, emit) {
      emit(const GenerationState());
    });

    on<UpdateTemplate>((event, emit) {
      emit(state.copyWith(selectedTemplate: event.template));
    });

    on<UpdateDescription>((event, emit) {
      emit(state.copyWith(description: event.description));
    });

    on<UpdateToneOfVoice>((event, emit) {
      emit(state.copyWith(toneOfVoice: event.toneOfVoice));
    });

    on<UpdateLanguage>((event, emit) {
      emit(state.copyWith(language: event.language));
    });
    on<ClearTextField>(
      (event, emit) {
        titleController.clear();
        fileName.clear();
      },
    );

    on<PostRequesttoAPI>((event, emit) async {
      titleController.text = event.title;
      emit(state.copyWith(loading: true));
      try {
        final scriptGeneration = ScriptGeneration(
          template: state.selectedTemplate,
          description: state.description,
          toneOfVoice: state.toneOfVoice,
          language: state.language,
        );

        final prompt = scriptGeneration.prompt; // Use the prompt getter
        final result = await GoogleGenerativeAI().GemeniService(prompt);

        final newScript = ScriptModel(
          id: const Uuid().v4(),
          title: titleController.text,
          content: result,
          isGenerated: true,
          createdAt: DateTime.now(),
        );

        await scriptRepository.addScript(newScript);
      } catch (e) {
        print('Error: $e');
      } finally {
        emit(state.copyWith(loading: false));
        add(ResetState());
      }
    });
  }
  @override
  Future<void> close() {
    titleController.dispose();
    fileName.dispose();
    return super.close();
  }
}
