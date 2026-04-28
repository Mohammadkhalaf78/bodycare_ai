part of 'login_doctor_cubit.dart';

@immutable
sealed class LoginDoctorState {}

final class LoginDoctorInitial extends LoginDoctorState {}
final class LoginDoctorLoading extends LoginDoctorState {}
final class LoginDoctorSuccess extends LoginDoctorState {}
final class LoginDoctorError extends LoginDoctorState {
  final String errorMessage;
  LoginDoctorError(this.errorMessage);
}
