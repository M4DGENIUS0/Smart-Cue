part of 'playback_bloc.dart';

class PlaybackState extends Equatable {
  final bool isPlaying;
  final double scrollSpeed;
  final double scrollOffset;
  final double textSize;

  const PlaybackState({
    this.isPlaying = false,
    required this.scrollSpeed,
    required this.scrollOffset,
    required this.textSize,
  });

  PlaybackState copyWith({
    bool? isPlaying,
    double? scrollSpeed,
    double? scrollOffset,
    double? textSize,
  }) {
    return PlaybackState(
      isPlaying: isPlaying ?? this.isPlaying,
      scrollSpeed: scrollSpeed ?? this.scrollSpeed,
      scrollOffset: scrollOffset ?? this.scrollOffset,
      textSize: textSize ?? this.textSize,
    );
  }

  @override
  List<Object?> get props => [isPlaying, scrollSpeed, scrollOffset, textSize];
}
