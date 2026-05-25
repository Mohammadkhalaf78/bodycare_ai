class ChatResponseModel {
  final String? status;
  final String? sessionStatus;
  final String? chatId;
  final AiReply? aiReply;
  final ReportData? report;

  ChatResponseModel({
    this.status,
    this.sessionStatus,
    this.chatId,
    this.aiReply,
    this.report,
  });

  factory ChatResponseModel.fromJson(Map<String, dynamic> json) {
    return ChatResponseModel(
      status: json['status'] ?? json['aiReply']?['status'] ?? '',
      sessionStatus: json['session_status'] ??
          json['aiReply']?['session_status'] ?? '',
      chatId: json['chatId']?.toString(),
      aiReply: json['aiReply'] != null
          ? AiReply.fromJson(json['aiReply'])
          : null,
      report: json['report'] != null
          ? ReportData.fromJson(json['report'])
          : null,
    );
  }

  bool get isReport => 
      status == 'REPORT' || aiReply?.status == 'REPORT';
  
  bool get isCompleted => 
      sessionStatus == 'COMPLETED' || 
      aiReply?.session_status == 'COMPLETED';
}

class AiReply {
  final String? status;
  final String? session_status;
  final String? layer;
  final int? layer_index;
  final String? previous_layer;
  final bool? remove_previous_layer;
  final int? question_id;
  final String? content_en;
  final String? content_ar;
  final String? user_lang;

  AiReply({
    this.status,
    this.session_status,
    this.layer,
    this.layer_index,
    this.previous_layer,
    this.remove_previous_layer,
    this.question_id,
    this.content_en,
    this.content_ar,
    this.user_lang,
  });

  factory AiReply.fromJson(Map<String, dynamic> json) {
    return AiReply(
      status: json['status']?.toString(),
      session_status: json['session_status']?.toString(),
      layer: json['layer']?.toString(),
      layer_index: json['layer_index'] is int ? json['layer_index'] : null,
      previous_layer: json['previous_layer']?.toString(),
      remove_previous_layer: json['remove_previous_layer'] is bool 
                             ? json['remove_previous_layer'] 
                             : null,
      question_id: json['question_id'] is int ? json['question_id'] : null,
      content_en: json['content_en']?.toString(),
      content_ar: json['content_ar']?.toString(),
      user_lang: json['user_lang']?.toString(),
    );
  }

  // الرسالة اللي هتتعرض في الشات
  String get displayText => content_en ?? content_ar ?? status ?? 'No reply';
}

// ✅ الـ Report الجديد
class ReportData {
  final String? diagnosisEn;
  final String? diagnosisAr;
  final String? severity;
  final String? specialistEn;
  final String? specialistAr;
  final List<String> immediateActionsEn;
  final List<String> immediateActionsAr;
  final String? summaryEn;
  final String? summaryAr;
  final List<String> correlationAlerts;

  ReportData({
    this.diagnosisEn,
    this.diagnosisAr,
    this.severity,
    this.specialistEn,
    this.specialistAr,
    this.immediateActionsEn = const [],
    this.immediateActionsAr = const [],
    this.summaryEn,
    this.summaryAr,
    this.correlationAlerts = const [],
  });

  factory ReportData.fromJson(Map<String, dynamic> json) {
    List<String> parseList(dynamic value) {
      if (value is List) return value.map((e) => e.toString()).toList();
      return [];
    }

    return ReportData(
      diagnosisEn: json['diagnosis_en']?.toString(),
      diagnosisAr: json['diagnosis_ar']?.toString(),
      severity: json['severity']?.toString(),
      specialistEn: json['specialist_en']?.toString(),
      specialistAr: json['specialist_ar']?.toString(),
      immediateActionsEn: parseList(json['immediate_actions_en']),
      immediateActionsAr: parseList(json['immediate_actions_ar']),
      summaryEn: json['summary_en']?.toString(),
      summaryAr: json['summary_ar']?.toString(),
      correlationAlerts: parseList(json['correlation_alerts']),
    );
  }
}

// ✅ للتوافق مع الـ Report القديم (لو الـ AI مش شغال)
class Report_Data {
  final String? diagnosis;
  final String? immediate_action;
  final String? self_care;
  final String? severity;
  final String? specialist;
  final String? advice;
  final String? when_to_seek_help;
  final String? cause;

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