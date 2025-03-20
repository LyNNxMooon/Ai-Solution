abstract class MessagingStates {}

class MessagingInitial extends MessagingStates {}

//class MessageLoading extends  MessagingStates{}

//class MessageLoaded extends MessagingStates {}

class SentMessageError extends MessagingStates {
  final String message;

  SentMessageError(this.message);
}
