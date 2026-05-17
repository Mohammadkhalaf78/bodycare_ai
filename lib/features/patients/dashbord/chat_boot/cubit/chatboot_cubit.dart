import 'package:bloc/bloc.dart';
import 'package:bodycare_ai/core/cache/cache_helper.dart';
import 'package:bodycare_ai/core/model/chatboot_model.dart';
import 'package:bodycare_ai/core/model/sign_in_model.dart';
import 'package:bodycare_ai/core/network/api/api_consumer.dart';
import 'package:bodycare_ai/core/network/api/end_point.dart';
import 'package:bodycare_ai/core/network/errors/server_exception.dart';
import 'package:bodycare_ai/features/users/data/models/messeges_model.dart';
import 'package:bodycare_ai/features/users/data/models/report_model.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'chatboot_state.dart';

class ChatbootCubit extends Cubit<ChatbootState> {
  ChatbootCubit(this.api) : super(ChatbootInitial());
  ReportModel? reportModel;
  List<String> selectedModelParts = [];
  final ApiConsumer api;

  void onModelPartSelected(List<String> parts) {
    selectedModelParts = parts;
    final selectedPart = parts.isNotEmpty ? parts[0] : '';
    chatData = [
      MessegesModel(
        messeges: 'I feel pain in the $selectedPart',
        isSender: true,
      ),
    ];
    emit(ModelPartSelected(parts));
  }

  TextEditingController chatBootController = TextEditingController();
  SignInModel? user;
  ChatResponseModel? chatboot;

  List<MessegesModel> chatData = [
    // MessegesModel(messeges: 'I feel pain in the ', isSender: true),
  ];

  // ✅ helper يستخرج النص الصح من الـ response
  String _extractBotText(ChatResponseModel model) {
    // لو جه سؤال جديد من الـ aiReply
    final reply = model.aiReply;
    if (reply != null) {
      return reply.content_en ?? reply.content_ar ?? reply.status ?? 'No reply';
    }
    return 'No reply';
  }

  bool _isReportResponse(ChatResponseModel model) {
    // الحالة الجديدة: status في الـ root مباشرة
    if (model.status == 'REPORT') return true;
    if (model.sessionStatus == 'COMPLETED') return true;
    // الحالة القديمة: status جوا aiReply
    if (model.aiReply?.status == 'REPORT') return true;
    if (model.aiReply?.remove_previous_layer == true) return true;
    return false;
  }

  chatBoot() async {
    // ✅ احفظ النص الأول قبل ما تمسحه
    final userMessage = chatBootController.text.trim();
    if (userMessage.isEmpty) return;

    // أضف رسالة المستخدم للشات
    chatData.add(MessegesModel(messeges: userMessage, isSender: true));
    emit(ChatBootLoading());

    try {
      final response = await api.post(
        EndPoint.sendMessage,
        data: {
          'message': 'userMessage', // ✅ بنبعت النص المحفوظ مش الفاضي
          'body_part': 'head ',
        },
      );

      chatboot = ChatResponseModel.fromJson(response);

      if (_isReportResponse(chatboot!)) {
        // ✅ الـ response ده report
        chatData.add(
          MessegesModel(
            messeges: '✅ Your diagnosis report is ready!',
            isSender: false,
          ),
        );
        // حفظ الـ report في الـ cache
        CacheHelper().saveData(
          key: ApiKey.reportData,
          value:
              chatboot!.report?.diagnosisEn ??
              chatboot!.report?.diagnosisAr ??
              '',
        );
        emit(GetReportSuccess(reportResponse: chatboot!, report: null));
      } else {
        // ✅ الـ response سؤال جديد من الـ AI
        final botText = _extractBotText(chatboot!);
        chatData.add(MessegesModel(messeges: botText, isSender: false));
        emit(ChatBootSuccess([...chatData]));
      }
    } on ServerException catch (e) {
      emit(ChatBootFailure(errMessage: e.errModel.message.toString()));
    }
  }
  






  sendStartMassege(String selectedPart) async {
    chatData.add(
      MessegesModel(
        messeges: 'i feel pain in the $selectedPart',
        isSender: true,
      ),
    );

    try {
      emit(ChatBootLoading());
      final response = await api.post(
        EndPoint.sendMessage,
        data: {
          ApiKey.message: 'I feel pain in the $selectedPart',
          ApiKey.body_part: '$selectedPart',
        },
      );

      chatboot = ChatResponseModel.fromJson(response);
      emit(ChatBootSuccess([...chatData]));

    } on ServerException catch (e) {
      emit(ChatBootFailure(errMessage: e.errModel.message.toString()));
    } 
  }















  void sendStartMessage(String partName) {
    chatData = [
      MessegesModel(messeges: 'I feel pain in the head', isSender: true),
    ];
    sendStartMassege(partName); // ✅ بنستخدم sendStartMassege مش chatBoot
  }
}
