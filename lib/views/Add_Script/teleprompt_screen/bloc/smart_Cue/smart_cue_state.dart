part of 'smart_cue_bloc.dart';

class SmartCueState extends Equatable {
  final String title;
  final String content;

  const SmartCueState({this.title = "", this.content = ""});

  SmartCueState copyWith({String? title, String? content}) {
    return SmartCueState(
        title: title ?? this.title, content: content ?? this.content);
  }

  @override
  List<Object?> get props => [title, content];
}
