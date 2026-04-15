part of 'doctor_cubit.dart';

@immutable
sealed class DoctorState {}

final class DoctorInitial extends DoctorState {}
final class DoctorSignUpLoading extends DoctorState {}
final class DoctorSignUpSuccess extends DoctorState {}
final class DoctorSignUpFailed extends DoctorState {
  final String errorMessage;

  DoctorSignUpFailed({required this.errorMessage});
}
final class ChangeSpecialtyState extends DoctorState {}
