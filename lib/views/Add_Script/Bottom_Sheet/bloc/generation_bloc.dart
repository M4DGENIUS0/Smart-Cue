import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'generation_event.dart';
part 'generation_state.dart';

class GenerationBloc extends Bloc<GenerationEvent, GenerationState> {
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
  }
}
