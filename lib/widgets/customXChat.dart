import 'package:flutter/material.dart';

// models
import 'package:chat_app/models/messageModel.dart';

// constants
import 'package:chat_app/constants.dart';

class CustomXChat extends StatelessWidget {
  const CustomXChat({super.key, required this.message});

  final MessageModel message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        margin: const EdgeInsets.only(bottom: 16, left: 16, right: 24),
        decoration: const BoxDecoration(
          color: kPrimaryXColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
            bottomLeft: Radius.circular(32),
          ),
        ),
        child: Text(
          message.message!,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
