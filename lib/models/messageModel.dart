// constants
import 'package:chat_app/constants.dart';

class MessageModel {
  MessageModel(this.message, this.id);

  factory MessageModel.fromJSON(jsonData) {
    return MessageModel(jsonData[kMessageModel], jsonData[kMessageId]);
  }

  final String? message;
  final String? id;
}
