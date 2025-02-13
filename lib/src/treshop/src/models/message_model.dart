import 'package:ultimate_bundle/src/treshop/src/models/chat_model.dart';

class MessageModel {
  final bool? isOnline;
  final DateTime? createdAt;
  final String? lastMessage;
  final int? unreadMessage;
  final List<ChatModel>? chatList;

  MessageModel({
    this.isOnline,
    this.createdAt,
    this.lastMessage,
    this.unreadMessage,
    this.chatList,
  });
}
