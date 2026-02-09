class ChatbootModel {
  final AiReply? aiReply;
  ChatbootModel({this.aiReply});

  factory ChatbootModel.fromJson(Map<String, dynamic> json) {
    final ai = json['aiReply'] as Map<String, dynamic>?;
    return ChatbootModel(aiReply: ai != null ? AiReply.fromJson(ai) : null);
  }
}

class AiReply {
  final String? content;
  final String? error;
  final String? report;
  // ignore: non_constant_identifier_names
  final Report_Data? report_data;

  // ignore: non_constant_identifier_names
  AiReply({this.content, this.error, this.report, this.report_data});

  factory AiReply.fromJson(Map<String, dynamic> json) {
    return AiReply(
      content: json['content']?.toString(),
      error: json['error']?.toString(),
      report: json['report_data']?.toString(),
      report_data: json['report_data'] != null
          ? Report_Data.fromJson(json['report_data'])
          : null,
    );
  }
}


// ignore: camel_case_types
class Report_Data{
  final String? diagnosis;
  // ignore: non_constant_identifier_names
  final String? immediate_action;
  final String? medication;
  final String? severity;
  final String? specialist;
  final String? advice;
  final String? cause;


  // ignore: non_constant_identifier_names
  Report_Data({this.diagnosis, this.advice, this.immediate_action, this.medication, this.severity, this.specialist, this.cause});

  factory Report_Data.fromJson(Map<String, dynamic> json) {
    return Report_Data(
      diagnosis: json['diagnosis']?.toString(),
      advice: json['advice']?.toString(),
      immediate_action: json['immediate_action']?.toString(),
      medication: json['medication']?.toString(), 
      severity: json['severity']?.toString(),
      specialist: json['specialist']?.toString(),
      cause: json['cause']?.toString(),
    );
  }
}