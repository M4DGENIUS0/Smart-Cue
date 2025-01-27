import 'package:bloc/bloc.dart';

class ScrollState {
  final bool isUserScrolling;
  ScrollState({this.isUserScrolling = false});
}

class ScrollCubit extends Cubit<ScrollState> {
  ScrollCubit() : super(ScrollState());

  void setUserScrolling(bool isScrolling) {
    emit(ScrollState(isUserScrolling: isScrolling));
  }
}
