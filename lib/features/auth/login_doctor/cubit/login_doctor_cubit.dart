import 'package:bloc/bloc.dart';
import 'package:bodycare_ai/core/network/api/api_consumer.dart';
import 'package:bodycare_ai/core/network/api/end_point.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'login_doctor_state.dart';

class LoginDoctorCubit extends Cubit<LoginDoctorState> {
  LoginDoctorCubit(this.api) : super(LoginDoctorInitial());
  final ApiConsumer api;
  TextEditingController doctorLoginEmail = TextEditingController();
  TextEditingController doctorLoginPassword = TextEditingController();

  login() async {
    try {
      emit(LoginDoctorLoading());
      final response = await api.post(
        EndPoint.signIn,
        data: {
          'email': doctorLoginEmail.text,
          'password': doctorLoginPassword.text,
        },
      );
      print('response: $response');
      emit(LoginDoctorSuccess());
    } on Exception catch (e) {
      emit(LoginDoctorError(e.toString()));
    }
  }
}

