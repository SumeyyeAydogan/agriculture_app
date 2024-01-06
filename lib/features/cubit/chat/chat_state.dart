import 'package:agriculture_app/features/model/chat/message_model.dart';
import 'package:equatable/equatable.dart';

abstract class MessagingState extends Equatable {}

class MessagingInitialState extends MessagingState {
  @override
  List<Object?> get props => [];
}

class MessagingLoadingState extends MessagingState {
  MessagingLoadingState();
  @override
  List<Object?> get props => [];
}

class MessagingCompletedState extends MessagingState {
  MessagingCompletedState(this.messages);
  final List<MessageModel> messages;
  @override
  List<Object?> get props => [messages];
}

class MessagingErrorState extends MessagingState {
  MessagingErrorState(this.errorMessage);
  final String errorMessage;
  @override
  List<Object?> get props => [errorMessage];
}
