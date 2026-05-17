import 'package:flutter_bloc/flutter_bloc.dart';
import 'state_model.dart';

class ModelCubit extends Cubit<ModelState> {
  ModelCubit() : super(ModelState.initial());

  // لما المستخدم يضغط على جزء من الموديل
  void selectPart(String partName) {
    final newTappedParts = List<String>.from(state.tappedParts);
    newTappedParts.add(partName);

    emit(
      state.copyWith(
        lastTappedPart: partName,
        tappedParts: newTappedParts,
      ),
    );
  }

  // مسح السجل
  void clearHistory() {
    emit(
      state.copyWith(
        lastTappedPart: null,
        tappedParts: [],
      ),
    );
  }


}
