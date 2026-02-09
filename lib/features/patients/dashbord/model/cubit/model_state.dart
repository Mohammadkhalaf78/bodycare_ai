part of 'model_cubit.dart';

abstract class Model3DState {}

class Model3DInitial extends Model3DState {}

class Model3DPartSelected extends Model3DState {
  final String partName;
  Model3DPartSelected(this.partName);
}

class Model3DTabSelected extends Model3DState {
  final String tabName;
  Model3DTabSelected(this.tabName);
}

class Model3DPartAndTabSelected extends Model3DState {
  final String partName;
  final String tabName;
  Model3DPartAndTabSelected(this.partName, this.tabName);
}