

import 'package:ai_solution/BLoC/chatting/chatting_events.dart';
import 'package:ai_solution/BLoC/chatting/chatting_states.dart';
import 'package:ai_solution/data/vos/admin_uid_vo.dart';
import 'package:ai_solution/domain/chatting_repo.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessageBloc extends Bloc<ChattingEvents, MessagingStates> {
  final ChattingRepo chattingRepo;
  final String userID;

  MessageBloc({required this.chattingRepo, required this.userID}) : super(MessagingInitial()) {
    on<SendMessage>(_onSendMessage);
  }

  Future<String> fetchAdminUID() async {
    List<AdminUidVO> adminID = await chattingRepo.fetchAdminUID();

    return adminID[0].id;
  }

  Stream<DatabaseEvent> getMessages (String otherUserID ) {
    return chattingRepo.getMessages(userID, otherUserID);
  }

  Future<void> _onSendMessage(
      SendMessage event, Emitter<MessagingStates> emit) async {
    try {
     

      await chattingRepo.sendMessages(
          event.receiverID, userID, event.message);
    } catch (error) {
      emit(SentMessageError("$error"));
    }
  }
}
