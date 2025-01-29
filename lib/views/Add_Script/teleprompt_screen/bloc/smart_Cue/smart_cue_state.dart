part of 'smart_cue_bloc.dart';

class SmartCueState extends Equatable {
  final String title;
  final String content;
  final String id;

  const SmartCueState({this.title = "", this.content = "", this.id = ""});

  SmartCueState copyWith({String? title, String? content, String? id}) {
    return SmartCueState(
        title: title ?? this.title,
        content: content ?? this.content,
        id: id ?? this.id);
  }

  @override
  List<Object?> get props => [title, content, id];
}
