// dependencies
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// models
import 'package:chat_app/models/messageModel.dart';

// constants
import 'package:chat_app/constants.dart';

// cubits
import 'package:chat_app/cubits/chatCubit/chatState.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());

  CollectionReference messages = FirebaseFirestore.instance.collection(kMessagesCollections);
  List<MessageModel> messagesList = [];

  void sendMessage({required String message, required String email}) {
    messages.add({kId: email, kMessageModel: message, kCreateAt: DateTime.now()});
  }

  void getMessages() {
    messages.orderBy(kCreateAt, descending: true).snapshots().listen((event) {
      messagesList.clear();
      for (var doc in event.docs) {
        messagesList.add(MessageModel.fromJSON(doc));
      }
      emit(ChatSuccess(messages: messagesList));
    });
  }
}
