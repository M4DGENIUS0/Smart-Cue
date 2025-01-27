part of 'playback_bloc.dart';

abstract class PlaybackEvent extends Equatable {
  const PlaybackEvent();

  @override
  List<Object?> get props => [];
}

class PlayEvent extends PlaybackEvent {}

class PauseEvent extends PlaybackEvent {}

class ChangeScrollSpeedEvent extends PlaybackEvent {
  final double newSpeed;

  const ChangeScrollSpeedEvent(this.newSpeed);

  @override
  List<Object?> get props => [newSpeed];
}

class ChangeScrollOffsetEvent extends PlaybackEvent {
  final double offset;

  const ChangeScrollOffsetEvent(this.offset);

  @override
  List<Object?> get props => [offset];
}

class ChangeTextSizeEvent extends PlaybackEvent {
  final double newSize;

  const ChangeTextSizeEvent(this.newSize);

  @override
  List<Object?> get props => [newSize];
}

class NextTextEvent extends PlaybackEvent {}

class BackTextEvent extends PlaybackEvent {}
