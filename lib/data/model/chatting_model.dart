import 'package:ai_solution/data/vos/admin_uid_vo.dart';
import 'package:ai_solution/data/vos/chatted_user_vo.dart';
import 'package:ai_solution/domain/chatting_repo.dart';
import 'package:ai_solution/firebase/firebase_chatting_repo.dart';
import 'package:firebase_database/firebase_database.dart';

class ChattingModel implements ChattingRepo {
  ChattingModel._();
  static final ChattingModel _singleton = ChattingModel._();
  factory ChattingModel() => _singleton;
  final _firebaseAgent = FirebaseChattingRepo();
  @override
  Stream<List<ChattedUserVO>?> getChatListStream() {
    try {
      return _firebaseAgent.getChatListStream();
    } on Exception catch (error) {
      return Stream.error(error);
    }
  }

  @override
  Stream<DatabaseEvent> getMessages(String userID, String otherUserID) {
    return _firebaseAgent.getMessages(userID, otherUserID);
  }

  @override
  Future<void> sendMessages(
      String receiverID, String senderID, String message) async {
    await _firebaseAgent.sendMessages(receiverID, senderID, message);
  }

  @override
  Future<List<AdminUidVO>> fetchAdminUID() async {
    try {
      return await _firebaseAgent.fetchAdminUID();
    } on Exception catch (error) {
      return Future.error(error);
    }
  }

  @override
  Stream<DatabaseEvent> getMessagesByAdmin(String userID, String otherUserID) {
    return _firebaseAgent.getMessagesByAdmin(userID, otherUserID);
  }

  @override
  Future<void> sendMessagesByAdmin(
      String receiverID, String senderID, String message) async {
    await _firebaseAgent.sendMessagesByAdmin(receiverID, senderID, message);
  }
}
