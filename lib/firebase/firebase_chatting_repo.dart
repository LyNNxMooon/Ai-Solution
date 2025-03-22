import 'package:ai_solution/data/vos/admin_uid_vo.dart';
import 'package:ai_solution/data/vos/chatted_user_vo.dart';
import 'package:ai_solution/domain/chatting_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import '../data/vos/message_vo.dart';

class FirebaseChattingRepo implements ChattingRepo {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseDatabase _firebaseDatabase = FirebaseDatabase.instance;
  final databaseRef = FirebaseDatabase.instance.ref();
  @override
  Stream<List<ChattedUserVO>?> getChatListStream() {
    //final String currentUserID = _firebaseAuth.currentUser!.uid;
    final String currentUserID = "RN9p2uOaTjR3zY2FG4ABf1GIlb83";

    return _firebaseDatabase
        .ref('users/$currentUserID/chats')
        .orderByChild('date_time') 
        .onValue 
        .map((event) {
      if (event.snapshot.value != null) {
        final data = Map<String, dynamic>.from(event.snapshot.value as Map);
        return data.values.map((e) {
          return ChattedUserVO.fromJson(Map<String, dynamic>.from(e));
        }).toList();
      } else {
        print("Null Returned");
        return null; 
      }
    });
  }

  @override
  Stream<DatabaseEvent> getMessages(String userID, String otherUserID) {
    List<String> ids = [userID, otherUserID];
    ids.sort();
    String chatRoomID = ids.join("_");
    return _firebaseDatabase
        .ref('chat_rooms/$chatRoomID/messages')
        .orderByChild('time_stamp')
        .onValue;
  }

  @override
  Future<void> sendMessages(
      String receiverID, String senderID, String message) async {
    final DateTime timeStamp = DateTime.now();

    MessageVO newMessage = MessageVO(
        senderID: senderID,
        receiverID: receiverID,
        message: message,
        timeStamp: timeStamp);

    List<String> ids = [senderID, receiverID];
    ids.sort();
    String chatRoomID = ids.join("_");

    await _firebaseDatabase
        .ref('chat_rooms/$chatRoomID/messages')
        .push()
        .set(newMessage.toJson());

    await _firebaseDatabase.ref('users/$senderID/chats/$receiverID').set({
      'name': "Admin",
      'chatted_user_uid': receiverID,
      'last_sender_uid': senderID,
      'last_message': message,
      'date_time': timeStamp.toIso8601String(),
    });

    await _firebaseDatabase.ref('users/$receiverID/chats/$senderID').set({
      'name': "UnknownUser",
      'chatted_user_uid': senderID,
      'last_sender_uid': senderID,
      'last_message': message,
      'date_time': timeStamp.toIso8601String(),
    });
  }
  
  @override
  Future<List<AdminUidVO>> fetchAdminUID() async {
       try {
      final snapshot = await databaseRef.child("admin_uid").once();
      return snapshot.snapshot.children.map<AdminUidVO>((snapshot) {
        return AdminUidVO.fromJson(
            Map<String, dynamic>.from(snapshot.value as Map));
      }).toList();
    } catch (error) {
      throw Exception("Error fetching admin id: $error");
    }
  }
}
