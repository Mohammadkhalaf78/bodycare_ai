import 'package:bodycare_ai/core/network/api/end_point.dart';
class ErrorModel {
  final String status;
  final String? errorMessage;

  ErrorModel({required this.status,required this.errorMessage});
  factory ErrorModel.fromJson(Map<String, dynamic> jsonData) {
    return ErrorModel(
      status: jsonData[ApiKey.status],
      errorMessage: jsonData[ApiKey.errorMessage],
    );
  }
}