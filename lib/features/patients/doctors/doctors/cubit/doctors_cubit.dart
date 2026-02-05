
import 'package:bodycare_ai/core/network/end_point/end_point.dart';
import 'package:bodycare_ai/core/network/helpers.dart/dio_helper.dart';
import 'package:bodycare_ai/features/users/data/models/doctors_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'doctors_state.dart';

class DoctorsCubit extends Cubit<DoctorsState> {
  DoctorsCubit() : super(DoctorsInitial());
  static DoctorsCubit get(context) => BlocProvider.of(context);
  DoctorsModel? doctorsModel;

  Future<void> getDoctors() async {
    emit(GetDoctorsLoading());
    await DioHelper.getData(endPoints: doctor)
        .then((value) {
          print(value.data);
          doctorsModel = DoctorsModel.fromJson(value.data);
          FormattedDoctor firstDoctor = FormattedDoctor.fromJson(value.data['doctors'][0]);
          print('-----------------------------------------------');
          print(firstDoctor.specialty);
          emit(GetDoctorsSuccess());
        })
        .catchError((error) {
          if (error is DioException) {
            emit(
              GetDoctorsError(
                error.response?.data['message'] ?? 'An error occurred',
              ),
            );
          } else {
            emit(GetDoctorsError(error.toString()));
          }
        });
  }
}
