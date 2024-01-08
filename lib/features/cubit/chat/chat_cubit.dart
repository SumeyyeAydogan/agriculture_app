import 'package:agriculture_app/core/constants/error_constants.dart';
import 'package:agriculture_app/features/model/chat/message_model.dart';
import 'package:agriculture_app/product/service/chat/chatting_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'chat_state.dart';

class MessagingCubit extends Cubit<MessagingState> {
  MessagingCubit() : super(MessagingInitialState()) {
    loadInitialMessages();
  }
  late List<MessageModel> messageList = [MessageModel.create(message: "cubitten geldi")];

  void sendMessage(String message) {
    emit(MessagingLoadingState());
    try {
      MessageModel model = MessageModel.create(message: message);
      //messageList.insert(0, model);
      messageList.add(model);
      emit(MessagingCompletedState(messageList));
      //await getMessage(model);
    } catch (e) {
      emit(MessagingErrorState(ErrorConstants.SENDING_MESSAGE_ERROR));
    }
  }

  Future<void> getMessage(MessageModel model) async {
    emit(MessagingLoadingState());
    try {
      final response = await ChattingManager.instance.askQuestionToGpt(model: model);
      final answer = MessageModel.create(message: response!);
      answer.isSenderGpt = true;
      messageList.insert(0, answer);
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
      //messageList.insert(0, defaultMessage);
      messageList.add(defaultMessage);
      emit(MessagingCompletedState(messageList));
    } catch (e) {
      emit(MessagingErrorState(ErrorConstants.GETTING_MESSAGE_ERROR));
    }
  }
}

/* Iterable<MessageModel>

An [Iterable] of the objects in this list in reverse order.

final numbers = <String>['two', 'three', 'four'];
final reverseOrder = numbers.reversed;
print(reverseOrder.toList()); // [four, three, two] */
