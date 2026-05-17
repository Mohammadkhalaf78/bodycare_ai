class ChatbotModelRessponse {
  final String message;
  final String chatId;
  final AiReply aiReply;

  ChatbotModelRessponse(this.chatId, this.aiReply, {required this.message});
  factory ChatbotModelRessponse.fromJson(Map<String, dynamic> json) {
    return ChatbotModelRessponse(
      json['chat_id'] ?? '',
      AiReply.fromJson(json['ai_reply'] ?? {}),
      message: json['message'] ?? '',
    );
  }
}

class AiReply {
  final String error;

  AiReply({required this.error});

  factory AiReply.fromJson(Map<String, dynamic> json) {
    return AiReply(error: json['error'] ?? '');
  }
}
