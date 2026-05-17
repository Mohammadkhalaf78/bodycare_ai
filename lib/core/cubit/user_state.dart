import 'package:bodycare_ai/features/users/data/models/doctors_model.dart';

class UserState {}

final class UserInitial extends UserState {}

final class SignInSuccess extends UserState {}

final class UploadProfilePic extends UserState {}

final class SignInLoading extends UserState {}

final class SignInFailure extends UserState {
  final String errMessage;
  SignInFailure({required this.errMessage});
}

class GetDoctorsSuccess extends UserState {
  final DoctorsModel doctors;
  GetDoctorsSuccess({required this.doctors});
}

final class GetDoctorsLoading extends UserState {}

final class GetDoctorsFailure extends UserState {
  final String errMessage;
  GetDoctorsFailure({required this.errMessage});
}

final class SignUpSuccess extends UserState {}

final class SignUpLoading extends UserState {}

final class SignUpFailure extends UserState {
  final String errMessage;
  SignUpFailure({required this.errMessage});
}

final class GetUserSuccess extends UserState {}

final class GetUserLoading extends UserState {}

final class GetUserFailure extends UserState {
  final String errMessage;
  GetUserFailure({required this.errMessage});
}

// ✅ بيحمل ChatResponseModel عشان توصل لـ report + aiReply في الـ UI



// Model States
class ModelPartSelected extends UserState {
  final List<String> selectedParts;
  ModelPartSelected(this.selectedParts);
}

abstract class Model3DState {}

class Model3DInitial extends Model3DState {}

class Model3DPartSelected extends Model3DState {
  final String partName;
  Model3DPartSelected(this.partName);
}