import 'package:flutter/material.dart';

// cubits
import 'package:chat_app/cubits/chatCubit/chatCubit.dart';
import 'package:chat_app/cubits/chatCubit/chatState.dart';

// widgets
import 'package:chat_app/widgets/customChat.dart';
import 'package:chat_app/widgets/customXChat.dart';

// constants
import 'package:chat_app/constants.dart';

// dependencies
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  final ScrollController scrollController = ScrollController();

  // List messageList = [];

  static String id = 'chatScreen';
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              kLogo,
              height: 56,
            ),
            const SizedBox(width: 4),
            const Text(
              'Chat',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Pacifico',
              ),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          children: [
            Expanded(
              child: BlocBuilder<ChatCubit, ChatState>(
                builder: (context, state) {
                  var messagesList = BlocProvider.of<ChatCubit>(context).messagesList;
                  return ListView.builder(
                    reverse: true,
                    controller: scrollController,
                    itemCount: messagesList.length,
                    itemBuilder: (context, index) {
                      return messagesList[index].id == email ? CustomChat(message: messagesList[index]) : CustomXChat(message: messagesList[index]);
                    },
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                controller: controller,
                onSubmitted: (message) {
                  BlocProvider.of<ChatCubit>(context).sendMessage(message: message, email: email);
                  controller.clear();
                  scrollController.animateTo(
                    0,
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeInOut,
                  );
                },
                decoration: InputDecoration(
                  hintText: 'Enter your message....',
                  hintStyle: const TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: kPrimaryColor),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.send,
                      color: kPrimaryColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
