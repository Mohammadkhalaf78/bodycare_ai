// import 'package:bodycare_ai/core/cache/cache_helper.dart';
// import 'package:bodycare_ai/core/cubit/user_state.dart';
// import 'package:bodycare_ai/core/model/chatboot_model.dart';
// import 'package:bodycare_ai/core/model/sign_in_model.dart';
// import 'package:bodycare_ai/core/network/api/api_consumer.dart';
// import 'package:bodycare_ai/core/network/api/end_point.dart';
// import 'package:bodycare_ai/core/network/errors/server_exception.dart';
// import 'package:bodycare_ai/features/users/data/models/doctors_model.dart';
// import 'package:bodycare_ai/features/users/data/models/messeges_model.dart';
// import 'package:bodycare_ai/features/users/data/models/report_model.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:jwt_decoder/jwt_decoder.dart';
// import 'package:phone_form_field/phone_form_field.dart';

// class UserCubit extends Cubit<UserState> {
//   UserCubit(this.api) : super(UserInitial());
//   final ApiConsumer api;
//   //Sign in Form key
//   GlobalKey<FormState> signInFormKey = GlobalKey();
//   //Sign in email
//   TextEditingController signInEmail = TextEditingController();

//   PhoneController signUpPhone = PhoneController();
//   //Sign in password
//   TextEditingController signInPassword = TextEditingController();
//   //Sign Up Form key
//   GlobalKey<FormState> signUpFormKey = GlobalKey();
//   //Profile Pic
//   // XFile? profilePic;
//   //Sign up name
//   TextEditingController signUpName = TextEditingController();
//   //Sign up phone number
//   TextEditingController signUpPhoneNumber = TextEditingController();
//   //Sign up email
//   TextEditingController signUpEmail = TextEditingController();
//   //Sign up password
//   TextEditingController signUpPassword = TextEditingController();
//   //Sign up confirm password
//   TextEditingController confirmPassword = TextEditingController();

//   ReportModel? reportModel;

//   final fromkay = GlobalKey<FormState>();

//   //user state -------------------------------
//   //   testSignIn() async {
//   //   try {
//   //     emit(UserInitial());
//   //     final response = await api.post(
//   //       EndPoint.signIn,
//   //       data: {ApiKey.email: 's@gmail.com', ApiKey.password: '12345678'},
//   //     );
//   //     emit(GetUserSuccess());
//   //     print('response: $response');
//   //   } on Exception catch (e) {
//   //     print(e.toString());
//   //     emit(GetUserFailure(errMessage: e.toString()));
//   //   }
//   // }

//   List<String> selectedModelParts = [];
//   void onModelPartSelected(List<String> parts) {
//     selectedModelParts = parts;

//     // تحديث الرسالة الأولية بمكان الألم المختار
//     final selectedPart = parts.isNotEmpty ? parts[0] : '';
//     chatData = [
//       MessegesModel(
//         messeges: 'I feel pain in the $selectedPart',
//         isSender: true,
//       ),
//     ];

//     emit(ModelPartSelected(parts));
//   }

//   //--------------------------------------------

//   TextEditingController chatBootController = TextEditingController();
//   SignInModel? user;
//   ChatResponseModel? chatboot;
//   List<MessegesModel> chatData = [
//     MessegesModel(messeges: 'I feel pain in the ', isSender: true),
//   ];

//   signIn() async {
//     try {
//       emit(SignInLoading());
//       final response = await api.post(
//         EndPoint.signIn,
//         data: {
//           ApiKey.email: signInEmail.text,
//           ApiKey.password: signInPassword.text,
//         },
//       );
//       // ignore: avoid_print
//       print('response: $response');
//       user = SignInModel.fromJson(response);
//       final decodedToken = JwtDecoder.decode(user!.token);
//       // ignore: avoid_print
//       print('Decoded Token: $decodedToken');
//       //كدا انا حطيت الداتا كلها في اليوزر
//       CacheHelper().saveData(key: ApiKey.token, value: user!.token);
//       emit(SignInSuccess());
//     } on ServerException catch (e) {
//       emit(SignInFailure(errMessage: e.errModel.message.toString()));
//     }
//   }

//   signUp() async {
//     try {
//       emit(SignUpLoading());
//       await api.post(
//         EndPoint.signUp,
//         data: {
//           ApiKey.name: signUpName.text,
//           ApiKey.email: signUpEmail.text,
//           ApiKey.password: signUpPassword.text,
//           ApiKey.phone: signUpPhoneNumber.text,
//           ApiKey.age: 25,
//           ApiKey.gender: 'male',
//           ApiKey.address: '123 Main Street',
//           ApiKey.password: signUpPassword.text,
//         },
//       );
//       emit(SignUpSuccess());
//     } on ServerException catch (e) {
//       emit(SignUpFailure(errMessage: e.errModel.message.toString()));
//     }
//   }

//   isLoggedIn() {
//     if (user != null && !JwtDecoder.isExpired(user!.token)) {
//       return true;
//     } else {
//       return false;
//     }
//   }

//   getAllDoctors() async {
//     try {
//       emit(GetDoctorsLoading());

//       final response = await api.get(EndPoint.getDoctors);

//       emit(GetDoctorsSuccess(doctors: DoctorsModel.fromJson(response)));
//     } on ServerException catch (e) {
//       emit(GetDoctorsFailure(errMessage: e.errModel.message.toString()));
//     }
//   }

//   chatBoot() async {
//     emit(ChatBootLoading());
//     if (chatBootController.text.isEmpty) return;

//     // 1️⃣ رسالة المستخدم
//     chatData.add(
//       MessegesModel(messeges: chatBootController.text, isSender: true),
//     );
//     chatBootController.clear();

//     try {
//       emit(ChatBootLoading());
//       final response = await api.post(
//         EndPoint.sendMessage,
//         data: {
//           'message': chatBootController.text,
//           'body_part': selectedModelParts,
//           },
//       );
//       chatboot = ChatResponseModel.fromJson(response);
//       if (chatboot!.aiReply?.remove_previous_layer != null) {
//         chatData.add(
//           MessegesModel(
//             messeges: chatboot!.aiReply?.status ?? 'No reply',
//             isSender: false,
//           ),
//         );
//         emit(GetReportSuccess(report: ChatbootModel.fromJson(response)));
//         CacheHelper().saveData(
//           key: ApiKey.reportData,
//           value: chatboot!.aiReply?.status,
//         );
//       } else if (chatboot!.aiReply?.status != null) {
//         chatData.add(
//           MessegesModel(
//             messeges: chatboot!.aiReply?.status ?? 'No reply',
//             isSender: false,
//           ),
//         );
//       } else if (chatboot!.aiReply?.content_ar != null) {
//         chatData.add(
//           MessegesModel(
//             messeges: chatboot!.aiReply?.content_en ?? 'No reply',
//             isSender: false,
//           ),
//         );
//       } else {
//         chatData.add(
//           MessegesModel(
//             messeges:
//                 chatboot!.aiReply?.status ??
//                 chatboot!.aiReply?.content_ar ??
//                 'No reply',
//             isSender: false,
//           ),
//         );
//       }

//       emit(ChatBootSuccess());
//     } on ServerException catch (e) {
//       emit(ChatBootFailure(errMessage: e.errModel.message.toString()));
//     }
//   }

//   sendStartMassege(String selectedPart) async {
//     try {
//       emit(ChatBootLoading());
//       final response = await api.post(
//         EndPoint.sendMessage,
//         data: {
//           ApiKey.message: 'I feel pain in the $selectedPart',
//           ApiKey.body_part: selectedPart,

//           },
//       );

//       chatboot = ChatResponseModel.fromJson(response);

//       final botText =
//           chatboot?.aiReply?.status ??
//           chatboot?.aiReply?.content_ar ??
//           chatboot?.aiReply?.content_en ??
//           'No reply';
//       chatData.add(
//         MessegesModel(messeges: botText.toString(), isSender: false),
//       );

//       emit(ChatBootSuccess());
//     } on ServerException catch (e) {
//       emit(ChatBootFailure(errMessage: e.errModel.message.toString()));
//     }
//   }

//   void sendStartMessage(String partName) {
//     // إنشاء رسالة أولية
//     chatData = [
//       MessegesModel(messeges: 'I feel pain in the $partName', isSender: true),
//     ];

//     // مباشرة نرسلها للشات (لو حابب الـ AI يرد تلقائي)
//     chatBoot();
//     emit(ChatBootSuccess());
//   }
// }

// class EntityData {
//   late final String name;
//   late final int id;
//   // ممكن يكون فيه حاجات تانية

import 'package:bodycare_ai/core/cache/cache_helper.dart';
import 'package:bodycare_ai/core/cubit/user_state.dart';
import 'package:bodycare_ai/core/model/sign_in_model.dart';
import 'package:bodycare_ai/core/network/api/api_consumer.dart';
import 'package:bodycare_ai/core/network/api/end_point.dart';
import 'package:bodycare_ai/core/network/errors/server_exception.dart';
import 'package:bodycare_ai/features/users/data/models/doctors_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:phone_form_field/phone_form_field.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.api) : super(UserInitial());
  final ApiConsumer api;
  SignInModel? user;

  late GlobalKey<FormState> signInFormKey = GlobalKey();
  TextEditingController signInEmail = TextEditingController();
  PhoneController signUpPhone = PhoneController();
  TextEditingController signInPassword = TextEditingController();
  late GlobalKey<FormState> signUpFormKey = GlobalKey();
  TextEditingController signUpName = TextEditingController();
  TextEditingController signUpPhoneNumber = TextEditingController();
  TextEditingController signUpEmail = TextEditingController();
  TextEditingController signUpPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  late final fromkay = GlobalKey<FormState>();

  // ✅ helper يحدد لو الـ response ده report ولا سؤال

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
      if (response['status'] == 'success') {
        user = SignInModel.fromJson(response);
        final decodedToken = JwtDecoder.decode(user!.token);

        // ignore: avoid_print
        print('Decoded Token: $decodedToken');
        CacheHelper().saveData(key: ApiKey.token, value: user!.token);
        CacheHelper().saveData(key: ApiKey.email, value: decodedToken['email']);
        CacheHelper().saveData(key: ApiKey.name, value: decodedToken['name']);
        emit(SignInSuccess());
      } else {
        emit(SignInFailure(errMessage: response['message']));
      }
    } on ServerException catch (e) {
      emit(SignInFailure(errMessage: e.errModel.message.toString()));
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
        },
      );
      if (response['status'] == 'success') {
        emit(SignUpSuccess());
      } else {
        emit(SignUpFailure(errMessage: response['message']));
      }
    } on ServerException catch (e) {
      emit(SignUpFailure(errMessage: e.errModel.message.toString()));
    }
  }

  isLoggedIn() {
    if (user != null && !JwtDecoder.isExpired(user!.token)) {
      return true;
    }
    return false;
  }

  getAllDoctors() async {
    try {
      emit(GetDoctorsLoading());
      final response = await api.get(EndPoint.getDoctors);
      emit(GetDoctorsSuccess(doctors: DoctorsModel.fromJson(response)));
    } on ServerException catch (e) {
      emit(GetDoctorsFailure(errMessage: e.errModel.message.toString()));
    }
  }
}

class EntityData {
  late final String name;
  late final int id;
}
