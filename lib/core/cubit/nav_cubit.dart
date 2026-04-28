import 'package:flutter_bloc/flutter_bloc.dart';

class DrtNavCubit extends Cubit<int> {
  DrtNavCubit() : super(0); // يبدأ بـ Home

  void changePage(int index) {
    emit(index);
  }
}