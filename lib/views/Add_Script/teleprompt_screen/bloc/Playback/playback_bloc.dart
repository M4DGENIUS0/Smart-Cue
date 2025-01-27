import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'playback_event.dart';
part 'playback_state.dart';

class PlaybackBloc extends Bloc<PlaybackEvent, PlaybackState> {
  PlaybackBloc()
      : super(PlaybackState(
          isPlaying: false,
          scrollSpeed: 2.0,
          scrollOffset: 0.0,
          textSize: 16.0, // Default text size
        )) {
    on<PlayEvent>((event, emit) {
      emit(state.copyWith(isPlaying: true));
    });

    on<PauseEvent>((event, emit) {
      emit(state.copyWith(isPlaying: false));
    });

    on<ChangeScrollSpeedEvent>((event, emit) {
      emit(state.copyWith(scrollSpeed: event.newSpeed));
    });

    on<ChangeScrollOffsetEvent>((event, emit) {
      emit(state.copyWith(scrollOffset: event.offset));
    });

    on<ChangeTextSizeEvent>((event, emit) {
      emit(state.copyWith(textSize: event.newSize)); // Update text size
    });

    on<NextTextEvent>((event, emit) {
      emit(state.copyWith(
          scrollOffset: state.scrollOffset + 100)); // Move forward
    });

    on<BackTextEvent>((event, emit) {
      emit(state.copyWith(
          scrollOffset: state.scrollOffset - 100)); // Move backward
    });
  }
}
