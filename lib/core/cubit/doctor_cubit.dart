
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:bodycare_ai/core/network/api/api_consumer.dart';
import 'package:bodycare_ai/core/network/api/end_point.dart';
import 'package:bodycare_ai/core/network/errors/server_exception.dart';
import 'package:flutter/material.dart';
import 'package:phone_form_field/phone_form_field.dart';

part 'doctor_state.dart';

class DoctorCubit extends Cubit<DoctorState> {
  DoctorCubit(this.api) : super(DoctorInitial());
  final ApiConsumer api;

  TextEditingController doctorRegistraionName = TextEditingController();
  TextEditingController doctorRegistraionEmail = TextEditingController();
  PhoneController doctorRegistraionPhone = PhoneController();
  TextEditingController doctorRegistraionPassword = TextEditingController();
  String? doctorSpecialty;
  final formkay = GlobalKey<FormState>();

  void changeSpecialty(String value) {
    doctorSpecialty = value;
    emit(ChangeSpecialtyState());
  }

  SignUp() async{
  try {
    emit(DoctorSignUpLoading());
  // ignore: unused_local_variable
  final response= await  api.post(
      EndPoint.signUpDr,
      data: {
        'name': doctorRegistraionName.text,
        'email': doctorRegistraionEmail.text,
        'phone': doctorRegistraionPhone.value.international,
        'password': doctorRegistraionPassword.text,
        'specialty': doctorSpecialty,
        'age': 30,
        'gender': 'male',
        'address': ['Cairo, Maadi, Street 9'],
        'role': 'doctor',
        'coordinates': [31.2357, 30.0444],
        'bio': 'Experienced doctor in the field of cardiology.'
        
      },
    );
    emit(DoctorSignUpSuccess());
} on ServerException catch (e) {
  emit(DoctorSignUpFailed(errorMessage: e.errModel.message.toString()));
}
  }
}
