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
        final ScrollController scrollController = ScrollController();
        //context.read<MessagingCubit>().messageList.sort((a, b) => a.createdAt!.compareTo(b.createdAt!));
        if (state is MessagingCompletedState) {
          //Bu kod bloğu yeni mesaj geldiğinde hep klavyenin üstünde olmasını sağlıyor.  
          WidgetsBinding.instance.addPostFrameCallback((_) {
                    scrollController.animateTo(
                      scrollController.position.maxScrollExtent,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOut,
                    );
                  });
          return state.messages.isNotEmpty ?
           ListView.builder(
            controller: scrollController,
           // reverse: true, //mesajların aşağıdan başlamasını sağlar
                     itemCount: state.messages.length,
                     itemBuilder: (BuildContext context, int index) {
            return Row( //containerın mesaj boyutu kadar olmasını sağlar.
            mainAxisAlignment: state.messages[index].isSenderGpt ? MainAxisAlignment.start : MainAxisAlignment.end,
              children: [
                Padding(
                  padding: context.paddingLowHorizontal,
                  child: Container(
                    margin: context.paddingLowVertical,
                    padding: context.paddingMediumLow,
                    decoration: state.messages[index].isSenderGpt 
                    ? const BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.only(topRight: Radius.circular(50), bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50))
                    )
                    : BoxDecoration(
                      color: context.theme.colorScheme.primary,
                      borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20), bottomLeft: Radius.circular(20))
                    ),
                    child: Text(
                      state.messages[index].message, 
                      style: const TextStyle(color: Colors.white),
                      maxLines: null,
                      ),
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
