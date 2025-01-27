part of 'smart_cue_bloc.dart';

class SmartCueState extends Equatable {
  final String text;

  const SmartCueState({required this.text});

  SmartCueState copyWith({String? text}) {
    return SmartCueState(
      text: text ?? this.text,
    );
  }

  @override
  List<Object?> get props => [text];
}
