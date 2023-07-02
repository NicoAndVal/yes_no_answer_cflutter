import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_providers.dart';
import 'package:yes_no_app/presentation/widget/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widget/chat/my_bubble_chat.dart';
import 'package:yes_no_app/presentation/widget/shared/textField_%20box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(2.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://i.pinimg.com/originals/67/48/a1/6748a118d183bb66e1d7f84aaaf3fb86.jpg'),
          ),
        ),
        title: const Text('My bro'),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Column(
        children: [
          Expanded(
              child: ListView.builder(
            controller: chatProvider.chatController,
            itemCount: chatProvider.messagesList.length,
            itemBuilder: (context, index) {
              final message = chatProvider.messagesList[index];
              return (message.fromWho == FromWho.hers)
                  ? HerMessageBubble(message: message)
                  : MyMessageBubble(message: message);
            },
          )),
          TextFieldBox(onValue: chatProvider.sendMessage)
        ],
      ),
    );
  }
}
