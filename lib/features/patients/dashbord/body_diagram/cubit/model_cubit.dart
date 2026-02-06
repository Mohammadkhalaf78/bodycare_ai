import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'model_state.dart';

class ModelCubit extends Cubit<ModelState> {
  ModelCubit() : super(ModelInitial());
}
