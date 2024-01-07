import 'package:agriculture_app/core/extension/context_extension.dart';
import 'package:agriculture_app/features/cubit/chat/chat_cubit.dart';
import 'package:agriculture_app/features/cubit/chat/chat_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessageItem extends StatelessWidget {
  const MessageItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MessagingCubit, MessagingState>(
      builder: (context, state) {
        //context.read<MessagingCubit>().messageList.sort((a, b) => a.createdAt!.compareTo(b.createdAt!));
        if (state is MessagingCompletedState || state is MessagingInitialState) {
          var messageList = context.read<MessagingCubit>().messageList; 
          return messageList.isNotEmpty ?
           ListView.builder(
            reverse: true, //mesajların aşağıdan başlamasını sağlar
          itemCount: messageList.length,
          itemBuilder: (BuildContext context, int index) {
            return Row( //containerın mesaj boyutu kadar olmasını sağlar.
            mainAxisAlignment: messageList[index].isSenderGpt ? MainAxisAlignment.start : MainAxisAlignment.end,
              children: [
                Padding(
                  padding: context.paddingLowHorizontal,
                  child: Container(
                    margin: context.paddingLowVertical,
                    padding: context.paddingMediumLow,
                    decoration: messageList[index].isSenderGpt 
                    ? const BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.only(topRight: Radius.circular(50), bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50))
                    )
                    : BoxDecoration(
                      color: context.theme.colorScheme.primary,
                      borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20), bottomLeft: Radius.circular(20))
                    ),
                    child: Text(context.read<MessagingCubit>().messageList[index].message, style: const TextStyle(color: Colors.white),),
                  ),
                ),
              ],
            );
          },
        )
        : const Column(
          children: [
            Text("Hadi Soru Soralım!"),
          ],
        );
        } else {
          return  const Column(
          children: [
            Text("Hadi Soru Soralım!"),
          ],
        );
          }
        /* ListView.builder(
          itemCount: context.read<MessagingCubit>().messageList.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(context.read<MessagingCubit>().messageList[index].message + " burası else"),
            );
          },
        ) */
      },
    );
  }
}
