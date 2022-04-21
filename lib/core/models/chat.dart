enum MessageType {
  text,
  audio,
  video,
  image,
  file,
}

class ChatMessage {
  final String id;
  final MessageType type;
  final String content;
  final String senderAccountId;
  final DateTime timestamp;
  final bool isEdited;
  final bool isRead;
  final bool isDelivered;

  ChatMessage({
    this.id,
    this.type,
    this.content,
    this.senderAccountId,
    this.timestamp,
    this.isEdited,
    this.isRead,
    this.isDelivered,
  });
}

class Chat {
  final String id;
  final List<String> memberAccountIds;
  final List<ChatMessage> visibleMessages;

  Chat({
    this.id,
    this.memberAccountIds,
    this.visibleMessages,
  });
}
