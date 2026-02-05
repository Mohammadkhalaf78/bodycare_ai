part of 'doctors_cubit.dart';

@immutable
sealed class DoctorsState {}

final class DoctorsInitial extends DoctorsState {}

class GetDoctorsLoading extends DoctorsState {}
class GetDoctorsSuccess extends DoctorsState{}
class GetDoctorsError extends DoctorsState{
  final String error;
  GetDoctorsError(this.error);
}

  