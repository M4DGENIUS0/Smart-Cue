import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:smartcue/services/openaiDart_service.dart';
import 'package:uuid/uuid.dart';

import '../../../../model/script_model.dart';
import '../../../../prompt/script_generation.dart';
import '../../../../repository/script repo/hive_script_repo.dart';
import '../../../../services/openAi_service.dart';

part 'generation_event.dart';
part 'generation_state.dart';

class GenerationBloc extends Bloc<GenerationEvent, GenerationState> {
  final OpenaiService openAIService = OpenaiService();
  final TextEditingController titleController = TextEditingController();
  final HiveScriptRepository scriptRepository = HiveScriptRepository();

  GenerationBloc() : super(const GenerationState()) {
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
    on<PostRequesttoAPI>((event, emit) async {
      emit(state.copyWith(loading: true));
      try {
        final prompt = ScriptGeneration(
                template: state.selectedTemplate,
                description: state.description,
                toneOfVoice: state.toneOfVoice,
                language: state.language)
            .toString();
        // final result = await openAIService.fetchTeleprompt(prompt);
        final result = openaidart().completions(prompt);

        final newScript = ScriptModel(
          id: const Uuid().v4(),
          title: titleController.text ?? "",
          content: result.toString(),
          isGenerated: false,
          createdAt: DateTime.now(),
        );

        await scriptRepository.addScript(newScript);
      } catch (e) {
        print('Error: $e');
      } finally {
        emit(state.copyWith(loading: false));
      }
    });
  }
}
