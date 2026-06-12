part of 'chatboot_cubit.dart';

@immutable
sealed class ChatbootState {
  
}

final class ChatbootInitial extends ChatbootState {}
class ChatBootTextChanged extends ChatbootState {}
class ImagePickerSuccess extends ChatbootState {
}

final class ModelPartSelected extends ChatbootState {
  final List<String> selectedParts;
  ModelPartSelected(this.selectedParts);
}

final class ChatBootLoading extends ChatbootState {}

final class ChatBootSuccess extends ChatbootState {
  final List<MessegesModel> chatData;
  ChatBootSuccess(this.chatData);
}

final class ChatBootError extends ChatbootState {
  final String error;
  ChatBootError(this.error);
}

class GetReportSuccess extends ChatbootState {
  final ChatResponseModel reportResponse;

  GetReportSuccess({required this.reportResponse, required report});

  // ✅ Getter مباشر للـ report data عشان سهل الوصول في الـ UI
  ReportData? get reportData => reportResponse.report;
}


final class ChatBootFailure extends ChatbootState {
  final String errMessage;
  ChatBootFailure({required this.errMessage});
}
