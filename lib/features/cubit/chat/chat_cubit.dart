import 'package:agriculture_app/core/constants/error_constants.dart';
import 'package:agriculture_app/features/model/chat/message_model.dart';
import 'package:agriculture_app/product/service/chat/chatting_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'chat_state.dart';

class MessagingCubit extends Cubit<MessagingState> {
  MessagingCubit() : super(MessagingInitialState()) {
    loadInitialMessages();
  }
  List<MessageModel> messageList = [];

  void sendMessage(String message) async {
    emit(MessagingLoadingState());
    try {
      MessageModel model = MessageModel.create(message: message);
      //messageList.insert(0, model);
      messageList.add(model);
      emit(MessagingCompletedState(messageList));
      await getMessage(model);
    } catch (e) {
      emit(MessagingErrorState(ErrorConstants.SENDING_MESSAGE_ERROR));
    }
  }

  Future<void> getMessage(MessageModel model) async {
    emit(MessagingLoadingState());
    try {
      String? response = await ChattingManager.instance.askQuestionToGpt(question: model.message);
      response = splitString(response!, 45);
      final answer = MessageModel.create(message: response);
      answer.isSenderGpt = true;
      messageList.add(answer);
      emit(MessagingCompletedState(messageList));
    } catch (e) {
      emit(MessagingErrorState(ErrorConstants.GETTING_MESSAGE_ERROR));
    }
  }

  Future<void> loadInitialMessages() async {
    emit(MessagingLoadingState());
    try {
      //final List<MessageModel> oldMessages = await ChattingHistoryManager.instance.fetchMessagesFromDB();
      //messageList = response;
      var defaultMessage = MessageModel.create(message: "ChatGpt'ye soru sor");
      defaultMessage.isSenderGpt = true;
      messageList.addAll([defaultMessage]);
      emit(MessagingCompletedState(messageList));
    } catch (e) {
      emit(MessagingErrorState(ErrorConstants.GETTING_MESSAGE_ERROR));
    }
  }
}

String splitString(String input, int chunkSize) {
  StringBuffer buffer = StringBuffer();

  for (int i = 0; i < input.length; i += chunkSize) {
    int end = (i + chunkSize < input.length) ? i + chunkSize : input.length;
    buffer.write(input.substring(i, end));
    if (end != input.length) {
      buffer.write('\n'); // Sadece son parça değilse yeni satır ekle
    }
  }

  return buffer.toString();
}



/* Iterable<MessageModel>

An [Iterable] of the objects in this list in reverse order.

final numbers = <String>['two', 'three', 'four'];
final reverseOrder = numbers.reversed;
print(reverseOrder.toList()); // [four, three, two] */
