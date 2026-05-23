import 'package:bloc/bloc.dart';
import 'package:bodycare_ai/core/cache/cache_helper.dart';
import 'package:bodycare_ai/core/model/chatboot_model.dart';
import 'package:bodycare_ai/core/network/api/api_consumer.dart';
import 'package:bodycare_ai/core/network/api/end_point.dart';
import 'package:bodycare_ai/core/network/errors/server_exception.dart';
import 'package:bodycare_ai/features/users/data/models/messeges_model.dart';
import 'package:flutter/material.dart';

part 'chatboot_state.dart';

class ChatbootCubit extends Cubit<ChatbootState> {
  ChatbootCubit(this.api) : super(ChatbootInitial());
  final ApiConsumer api;

  TextEditingController chatBootController = TextEditingController();
  ChatResponseModel? chatboot;
  String? _chatId;
  List<MessegesModel> chatData = [];

  String _extractBotText(ChatResponseModel model) {
    final reply = model.aiReply;
    if (reply != null) {
      return reply.content_en ?? reply.content_ar ?? reply.status ?? 'No reply';
    }
    return 'No reply';
  }

  bool _isReportResponse(ChatResponseModel model) {
    if (model.status == 'REPORT') return true;
    if (model.sessionStatus == 'COMPLETED') return true;
    if (model.aiReply?.status == 'REPORT') return true;
    return false;
  }

  void _handleResponse(ChatResponseModel response) {
    chatboot = response;
    if (response.chatId != null) _chatId = response.chatId;

    if (_isReportResponse(response)) {
      chatData.add(MessegesModel(
        messeges: '✅ Your diagnosis report is ready!',
        isSender: false,
      ));
      CacheHelper().saveData(
        key: ApiKey.reportData,
        value: response.report?.diagnosisEn ?? response.report?.diagnosisAr ?? '',
      );
      if (!isClosed) emit(GetReportSuccess(reportResponse: response, report: null));
    } else {
      final botText = _extractBotText(response);
      chatData.add(MessegesModel(messeges: botText, isSender: false));
      if (!isClosed) emit(ChatBootSuccess([...chatData]));
    }
  }

  Future<void> sendStartMassege(String selectedPart) async {
    chatData = [
      MessegesModel(
        messeges: 'I feel pain in the $selectedPart',
        isSender: true,
      ),
    ];

    if (isClosed) return;
    emit(ChatBootLoading());

    try {
      final response = await api.post(
        EndPoint.sendMessage,
        data: {
          ApiKey.message: 'I feel pain in the $selectedPart',
          ApiKey.body_part: selectedPart,
        },
      );
      if (isClosed) return;
      _handleResponse(ChatResponseModel.fromJson(response));
    } on ServerException catch (e) {
      if (!isClosed) emit(ChatBootFailure(errMessage: e.errModel.message.toString()));
    }
  }

  Future<void> chatBoot() async {
    final userMessage = chatBootController.text.trim();
    if (userMessage.isEmpty) return;

    chatData.add(MessegesModel(messeges: userMessage, isSender: true));
    chatBootController.clear();

    if (isClosed) return;
    emit(ChatBootLoading());

    try {
      final body = <String, dynamic>{
        ApiKey.message: userMessage,
      };
      if (_chatId != null) body['chatId'] = _chatId;

      final response = await api.post(EndPoint.sendMessage, data: body);
      if (isClosed) return;
      _handleResponse(ChatResponseModel.fromJson(response));
    } on ServerException catch (e) {
      if (!isClosed) emit(ChatBootFailure(errMessage: e.errModel.message.toString()));
    }
  }

  @override
  Future<void> close() {
    chatBootController.dispose();
    return super.close();
  }
}
