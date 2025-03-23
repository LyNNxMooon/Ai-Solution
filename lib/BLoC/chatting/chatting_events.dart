abstract class ChattingEvents {}

class SendMessage extends ChattingEvents {
  final String receiverID;
  final String message;

  SendMessage({required this.receiverID, required this.message});
}

class SendMessageByAdmin extends ChattingEvents {
  final String receiverID;
  final String message;

  SendMessageByAdmin({required this.message, required this.receiverID});
}

//class GetMessage extends ChattingEvents {}

//class FetchChattedUsers extends ChattingEvents {}
