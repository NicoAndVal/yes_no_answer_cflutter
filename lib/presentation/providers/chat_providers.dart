import 'package:flutter/material.dart';
import 'package:yes_no_app/config/theme/helpers/get_yes_no_anserw.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final chatController = ScrollController();
  final getYesNoAnserw = GetYesNoAnserw();

  List<Message> messagesList = [
    Message(text: 'Holaaa', fromWho: FromWho.me),
    Message(text: 'Llegaste?', fromWho: FromWho.me)
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;

    final newMessage = Message(text: text, fromWho: FromWho.me);
    messagesList.add(newMessage);
    if (text.endsWith('?')) {
      herReplay();
    }
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> herReplay() async {
    final messageHer = await getYesNoAnserw.getAnswer();
    messagesList.add(messageHer);
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));
    chatController.animateTo(chatController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
  }
}
