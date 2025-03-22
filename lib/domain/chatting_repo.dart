import 'package:ai_solution/data/vos/admin_uid_vo.dart';
import 'package:ai_solution/data/vos/chatted_user_vo.dart';
import 'package:firebase_database/firebase_database.dart';

abstract class ChattingRepo {
  Future<List<AdminUidVO>> fetchAdminUID();

  Future<void> sendMessages(String receiverID, String senderID, String message);

  Future<void> sendMessagesByAdmin(
      String receiverID, String senderID, String message);

  Stream<DatabaseEvent> getMessages(String userID, String otherUserID);

  Stream<DatabaseEvent> getMessagesByAdmin(String userID, String otherUserID);

  Stream<List<ChattedUserVO>?> getChatListStream();
}
