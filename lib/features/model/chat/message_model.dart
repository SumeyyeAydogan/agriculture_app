import 'package:uuid/uuid.dart';

class MessageModel {
  final String messageId;

  bool isSenderGpt;

  String message;

  final DateTime? createdAt;

  MessageModel({required this.messageId, required this.isSenderGpt, required this.message, required this.createdAt});

  factory MessageModel.create({required String message}) {
    return MessageModel(messageId: const Uuid().v1(), isSenderGpt: false, message: message, createdAt: DateTime.now());
  }
}
