import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:smartcue/Exception/network_exception.dart';
import 'package:smartcue/services/GemeniService.dart';
import 'package:uuid/uuid.dart';

import '../../../../model/script_model.dart';
import '../../../../controllers/prompt/script_generation.dart';
import '../../../../controllers/script repo/hive_script_repo.dart';
import '../../../../utils/Status/GenerationStatus.dart';

part 'generation_event.dart';
part 'generation_state.dart';

class GenerationBloc extends Bloc<GenerationEvent, GenerationState> {
  final TextEditingController titleController = TextEditingController();
  final HiveScriptRepository scriptRepository = HiveScriptRepository();
  final TextEditingController fileName = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  GenerationBloc() : super(const GenerationState()) {
    // on<ResetState>((event, emit) {
    //   emit(const GenerationState());
    //   descriptionController.clear();
    // });

    on<UpdateTemplate>((event, emit) {
      emit(state.copyWith(selectedTemplate: event.template));
    });

    on<UpdateDescription>((event, emit) {
      emit(state.copyWith(description: event.description));
    });

    on<UpdateToneOfVoice>((event, emit) {
      emit(state.copyWith(toneOfVoice: event.toneOfVoice));
    });
    on<UpdateTitle>(
      (event, emit) {
        emit(state.copyWith(title: event.title));
      },
    );

    on<UpdateLanguage>((event, emit) {
      emit(state.copyWith(language: event.language));
    });

    on<PostRequesttoAPI>((event, emit) async {
      // fileName.text = event.title;
      emit(state.copyWith(status: GenerationStatus.loading, errormessage: ''));
      try {
        final scriptGeneration = ScriptGeneration(
          template: state.selectedTemplate,
          description: state.description,
          toneOfVoice: state.toneOfVoice,
          language: state.language,
        );

        final prompt = scriptGeneration.prompt;
        final result = await GoogleGenerativeAI().generateContent(prompt);

        final newScript = ScriptModel(
          id: const Uuid().v4(),
          title: event.title,
          content: result,
          isGenerated: true,
          createdAt: DateTime.now(),
        );

        on<ClearTextField>(
          (event, emit) {
            titleController.clear();
            fileName.clear();
            descriptionController.clear();
          },
        );
        await scriptRepository.addScript(newScript);
        emit(state.copyWith(status: GenerationStatus.success));
      } on NetworkException catch (e) {
        emit(state.copyWith(
            status: GenerationStatus.error, errormessage: e.toString()));
      } catch (e) {
        emit(state.copyWith(
          status: GenerationStatus.error,
          errormessage: 'An unexpected error occurred',
        ));
      }
    });

    // Add this new handler
    on<ResetState>((event, emit) {
      emit(const GenerationState());
    });
  }

  @override
  Future<void> close() {
    titleController.dispose();
    fileName.dispose();
    descriptionController.dispose();
    return super.close();
  }
}
