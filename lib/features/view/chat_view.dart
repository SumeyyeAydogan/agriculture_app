import 'package:agriculture_app/core/extension/context_extension.dart';
import 'package:agriculture_app/product/widget/message_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/chat/chat_cubit.dart';
import '../cubit/chat/chat_state.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key});
  final TextEditingController _messageController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Column(
          children: [
            Expanded(child: BlocBuilder<MessagingCubit, MessagingState>(
              builder: (context, state) {
                if (state is MessagingLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return const MessageItem();
                }
              },
            )),
            ChatTextField(messageController: _messageController),
          ],
    );
  }
}

class ChatTextField extends StatelessWidget {
  const ChatTextField({
    super.key,
    required TextEditingController messageController,
  }) : _messageController = messageController;

  final TextEditingController _messageController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.paddingTopKeyboard, //klavyenin üstüne koyar
      width: context.textFieldValue,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Flexible(
            child: TextField(
              controller: _messageController,
              //autofocus: true,
              keyboardType: TextInputType.multiline,
              textInputAction: TextInputAction.newline,
              maxLines: null,
              minLines: 1,
              style: const TextStyle(fontSize: 20),
              decoration: InputDecoration(
                contentPadding: context.paddingMediumHorizontal,
                isDense: true,
                hintText: "Mesaj Yazın",
                border: InputBorder.none, //alttatki çizgiyi kaldırdı
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              final String newMessage = _messageController.text;
              if (newMessage.isNotEmpty) {
                context.read<MessagingCubit>().sendMessage(newMessage);
                _messageController.clear();
              }
            },
            icon: Icon(
              Icons.send,
              color: context.theme.colorScheme.primary,
            )),
        ], 
      ),
    );
  }
}
