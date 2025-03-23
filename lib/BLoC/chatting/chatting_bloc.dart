// ignore_for_file: unused_field

import 'package:ai_solution/BLoC/chatting/chatting_events.dart';
import 'package:ai_solution/BLoC/chatting/chatting_states.dart';
import 'package:ai_solution/data/vos/admin_uid_vo.dart';
import 'package:ai_solution/data/vos/chatted_user_vo.dart';
import 'package:ai_solution/domain/chatting_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessageBloc extends Bloc<ChattingEvents, MessagingStates> {
  final ChattingRepo chattingRepo;
  final String userID;

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  String getAdminUserId() {
    //return _firebaseAuth.currentUser?.uid ?? "";
    return "RN9p2uOaTjR3zY2FG4ABf1GIlb83";
  }

  MessageBloc({required this.chattingRepo, required this.userID})
      : super(MessagingInitial()) {
    on<SendMessage>(_onSendMessage);
    on<SendMessageByAdmin>(_onSendMessageByAdmin);
  }

  Future<String> fetchAdminUID() async {
    List<AdminUidVO> adminID = await chattingRepo.fetchAdminUID();

    return adminID[0].id;
  }

  Stream<DatabaseEvent> getMessages(String otherUserID) {
    return chattingRepo.getMessages(userID, otherUserID);
  }

  Stream<DatabaseEvent> getMessagesByAdmin(String otherUserID) {
    return chattingRepo.getMessagesByAdmin(getAdminUserId(), otherUserID);
  }

  Future<void> _onSendMessage(
      SendMessage event, Emitter<MessagingStates> emit) async {
    try {
      await chattingRepo.sendMessages(event.receiverID, userID, event.message);
    } catch (error) {
      emit(SentMessageError("$error"));
    }
  }

  Future<void> _onSendMessageByAdmin(
      SendMessageByAdmin event, Emitter<MessagingStates> emit) async {
    try {
      await chattingRepo.sendMessagesByAdmin(event.receiverID, getAdminUserId(), event.message);
    } catch (error) {
      emit(SentMessageError("$error"));
    }
  }

  Stream<List<ChattedUserVO>?> fetchAllChattedUsers() {
    return chattingRepo.getChatListStream();
  }
}
