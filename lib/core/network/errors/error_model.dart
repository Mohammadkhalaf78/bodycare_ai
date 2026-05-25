import 'package:bodycare_ai/core/network/api/end_point.dart';

class ErrorModel {
  final String message;
  final String status;

  ErrorModel({required this.message,required this.status});
  factory ErrorModel.fromJson(Map<String, dynamic> jsonData) {
    return ErrorModel(
      status: jsonData['status'],
      message: jsonData[ApiKey.message]);
  }
}
