import 'package:flutter_bloc/flutter_bloc.dart';

class BuildScreenCubit extends Cubit<int> {
  BuildScreenCubit() : super(0);

  void changeTab(int index) {
    emit(index);
  }
}
