import 'package:bloc/bloc.dart';
import 'package:bodycare_ai/core/network/api/api_consumer.dart';
import 'package:bodycare_ai/core/network/api/end_point.dart';
import 'package:bodycare_ai/features/patients/dashbord/test_button/chatbot_model.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'test_button_state.dart';

class TestButtonCubit extends Cubit<TestButtonState> {
  TestButtonCubit(this.api, ) : super(TestButtonInitial());
  final ApiConsumer api;
  final dio = Dio();

  ChatbotModelRessponse? chatResponse;

  chatbot() async {
    emit(TestButtonLoading());

    try {
      final response = await api.post(
        EndPoint.sendMessage,
        data: {'message': 'Hello, I need help!', 'body_part': 'head'},
      );

      emit(TestButtonSuccess(response: response!));
      print('✅ Chatbot Response: ${response!.message}');


    } catch (e) {
      emit(TestButtonFailure(errMessage: 'Failed to get chatbot response.'));
      print('❌ Error: $e');
    }
  }
  
  sendmessage() async {
     final Response = await dio.post(
      'http://final-project-izjy.vercel.app/api/aichat/message',
      options: Options(
        headers: {
          'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InNAZ21haWwuY29tIiwiX2lkIjoiNjllZjg2YzJiOGI5MGZlMmYwZmNhMGRiIiwicm9sZSI6IlVzZXIiLCJpYXQiOjE3Nzc2NTE0MTMsImV4cCI6MTc3NzczNzgxM30.gXukUpDoxGLwvaayCa3T1NomrCZMUrrhTHJGCs7ZqqQ',
        },
      ),
      data: {'body_part': 'Hello, I need help!', 'message': 'head'},
    );
    print(Response.data);
  }


}
