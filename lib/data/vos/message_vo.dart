import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class MessageVO {
  final String senderID;
  final String receiverID;
  final String message;
  final DateTime timeStamp;

  MessageVO({
    required this.senderID,
    required this.receiverID,
    required this.message,
    required this.timeStamp,
  });

  Map<String, dynamic> toJson() {
    return {
      'sender_id': senderID,
      'receiver_id': receiverID,
      'message': message,
      'time_stamp': timeStamp.millisecondsSinceEpoch,
    };
  }

  factory MessageVO.fromJson(Map<String, dynamic> json) {
    return MessageVO(
      senderID: json['sender_id'] as String,
      receiverID: json['receiver_id'] as String,
      message: json['message'] as String,
      timeStamp: DateTime.fromMillisecondsSinceEpoch(json['time_stamp'] as int),
    );
  }
}