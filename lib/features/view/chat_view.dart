import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/chat/chat_cubit.dart';
import '../cubit/chat/chat_state.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MessagingCubit, MessagingState>(
      builder: (context, state) {
        if (state is MessagingCompletedState) {
          return ListView.builder(
            itemCount: state.messages.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(state.messages[index].message),
              );
            },
          );
        } else {
          return Text("Hadi Soru Soralım!");
        }
      },
    );
  }
}

class SendMessageButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        final MessagingCubit messagingCubit = BlocProvider.of<MessagingCubit>(context);
        messagingCubit.sendMessage('New message'); // Burada gerçek bir mesaj yerine örnek bir mesaj gönderiliyor
      },
      child: Icon(Icons.send),
    );
  }
}
