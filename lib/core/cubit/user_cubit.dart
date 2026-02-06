import 'dart:developer';

import 'package:bodycare_ai/core/cache/cache_helper.dart';
import 'package:bodycare_ai/core/cubit/user_state.dart';
import 'package:bodycare_ai/core/model/chatboot_model.dart';
import 'package:bodycare_ai/core/model/sign_in_model.dart';
import 'package:bodycare_ai/core/network/api/api_consumer.dart';
import 'package:bodycare_ai/core/network/api/end_point.dart';
import 'package:bodycare_ai/core/network/errors/server_exception.dart';
import 'package:bodycare_ai/features/users/data/models/doctors_model.dart';
import 'package:bodycare_ai/features/users/data/models/messeges_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:phone_form_field/phone_form_field.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.api) : super(UserInitial());
  final ApiConsumer api;
  //Sign in Form key
  GlobalKey<FormState> signInFormKey = GlobalKey();
  //Sign in email
  TextEditingController signInEmail = TextEditingController();

  PhoneController signUpPhone = PhoneController();
  //Sign in password
  TextEditingController signInPassword = TextEditingController();
  //Sign Up Form key
  GlobalKey<FormState> signUpFormKey = GlobalKey();
  //Profile Pic
  // XFile? profilePic;
  //Sign up name
  TextEditingController signUpName = TextEditingController();
  //Sign up phone number
  TextEditingController signUpPhoneNumber = TextEditingController();
  //Sign up email
  TextEditingController signUpEmail = TextEditingController();
  //Sign up password
  TextEditingController signUpPassword = TextEditingController();
  //Sign up confirm password
  TextEditingController confirmPassword = TextEditingController();

  TextEditingController chatBootController = TextEditingController();
  SignInModel? user;
  ChatbootModel? chatboot;
  List<MessegesModel> chatData = [
    MessegesModel(messeges: 'feel in the back pain', isSender: true),
  ];

  signIn() async {
    try {
      emit(SignInLoading());
      final response = await api.post(
        EndPoint.signIn,
        data: {
          ApiKey.email: signInEmail.text,
          ApiKey.password: signInPassword.text,
        },
      );
      user = SignInModel.fromJson(
        response,
      ); //كدا انا حطيت الداتا كلها في اليوزر
      CacheHelper().saveData(key: ApiKey.token, value: user!.token);
      CacheHelper().saveData(key: ApiKey.id, value: user!.data.id);
      // final decodedToken = JwtDecoder.decode(user!.token); // فك التوكن عشان اشوف الداتا اللي جواه
      print(' -----------------------------------------------');
      print(user!.data.id);
      print(user!.data.name);

      emit(SignInSuccess());
    } on ServerException catch (e) {
      emit(SignInFailure(errMessage: e.errModel.errorMessage.toString()));
    }
  }

  signUp() async {
    try {
      emit(SignUpLoading());
      final response = await api.post(
        EndPoint.signUp,
        data: {
          ApiKey.name: signUpName.text,
          ApiKey.email: signUpEmail.text,
          ApiKey.password: signUpPassword.text,
          ApiKey.phone: signUpPhoneNumber.text,
          ApiKey.age: 25,
          ApiKey.gender: 'male',
          ApiKey.address: '123 Main Street',
          ApiKey.password: signUpPassword.text,
        },
      );
      emit(SignUpSuccess());
    } on ServerException catch (e) {
      emit(SignUpFailure(errMessage: e.errModel.status.toString()));
    }
  }

  isLoggedIn() {
    if (user != null && !JwtDecoder.isExpired(user!.token)) {
      return true;
    } else {
      return false;
    }
  }

  getAllDoctors() async {
    try {
      emit(GetDoctorsLoading());

      final response = await api.get(
        EndPoint.getDoctors);

      emit(GetDoctorsSuccess(doctors: DoctorsModel.fromJson(response)));
    } on ServerException catch (e) {
      emit(GetDoctorsFailure(errMessage: e.errModel.errorMessage.toString()));
    }
  }

  chatBoot() async {
    if (chatBootController.text.isEmpty) return;

    // 1️⃣ رسالة المستخدم
    chatData.add(
      MessegesModel(messeges: chatBootController.text, isSender: true),
    );
    chatBootController.clear();

    try {
      emit(chatBootLoading());
      final response = await api.post(
        EndPoint.sendMessage,
        data: {ApiKey.text: chatBootController.text},
      );
      chatboot = ChatbootModel.fromJson(response);
      chatData.add(
      MessegesModel(
        messeges: chatboot!.aiReply?.error ?? chatboot!.aiReply?.content ?? 'No reply',
        isSender: false,
      ),
    );
      // 1. أضف رسالة المستخدم
      // final botText =
      //     response.aiReply?.content ?? response.aiReply?.error ?? 'No reply';

      // 2. أضف رد البوت
      // chatData.add(MessegesModel(messeges: botText, isSender: false));
      print('-----------------------------------------------');
      print(chatboot!.aiReply);
      print('-----------------------------------------------');
      log('ChatBoot Response: ${response}');
      emit(chatBootSuccess());
    } on ServerException catch (e) {
      emit(chatBootFailure(errMessage: e.errModel.errorMessage.toString()));
    }
  }

  sendStartMassege() async {
    try {
      emit(chatBootLoading());
      final response = await api.post(
        EndPoint.sendMessage,
        data: {ApiKey.text: 'feel in the back pain '},
      );
      chatboot = ChatbootModel.fromJson(response);

      final botText = chatboot!.aiReply?.error ?? 'No reply';
      chatData.add(MessegesModel(messeges: botText, isSender: false));

      print('-----------------------------------------------');
      print(chatboot!.aiReply);
      print('-----------------------------------------------');
      log('ChatBoot Response: ${response}');
      emit(chatBootSuccess());
    } on ServerException catch (e) {
      emit(chatBootFailure(errMessage: e.errModel.errorMessage.toString()));
    }
  }
}
