import 'package:flutter_bloc/flutter_bloc.dart';

// States
abstract class Model3DState {}

class Model3DInitial extends Model3DState {}

class Model3DPartSelected extends Model3DState {
  final String partName;
  
  Model3DPartSelected(this.partName);
}

// Cubit
class Model3DCubit extends Cubit<Model3DState> {
  Model3DCubit() : super(Model3DInitial());

  void selectPart(String partName) {
    emit(Model3DPartSelected(partName));
  }

  void reset() {
    emit(Model3DInitial());
  }
}
