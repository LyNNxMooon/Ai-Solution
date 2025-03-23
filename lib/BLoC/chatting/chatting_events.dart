abstract class ChattingEvents {}

class SendMessage extends ChattingEvents {
  final String receiverID;
  final String message;

  SendMessage({required this.receiverID, required this.message});
}

class SendMessageByAdmin extends ChattingEvents {
  final String receiverID;
  final String message;

  SendMessageByAdmin({required this.receiverID, required this.message});
}

//class GetMessage extends ChattingEvents {}

//class FetchChattedUsers extends ChattingEvents {}
