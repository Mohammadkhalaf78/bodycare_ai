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

  AiReply({this.content, this.error});

  factory AiReply.fromJson(Map<String, dynamic> json) {
    return AiReply(
      content: json['content']?.toString(),
      error: json['error']?.toString(),
    );
  }
}
