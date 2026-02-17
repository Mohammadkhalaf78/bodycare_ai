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
class Report_Data {
  final String? diagnosis;
  final String? immediate_action;
  final String? self_care;
  final String? severity;
  final String? specialist;
  final String? advice;
  final String? when_to_seek_help;
  final String? cause;

  // ignore: non_constant_identifier_names
  Report_Data({
    this.self_care,
    this.when_to_seek_help,
    this.diagnosis,
    this.advice,
    this.immediate_action,
    this.severity,
    this.specialist,
    this.cause,
  });

  factory Report_Data.fromJson(Map<String, dynamic> json) {
    return Report_Data(
      diagnosis: json['diagnosis']?.toString(),
      immediate_action: json['immediate_action']?.toString(),
      self_care: json['self_care']?.toString(),
      severity: json['severity']?.toString(),
      specialist: json['specialist']?.toString(),
      advice: json['advice']?.toString(),
      when_to_seek_help: json['when_to_seek_help']?.toString(),
      cause: json['cause']?.toString(),
    );
  }
}
