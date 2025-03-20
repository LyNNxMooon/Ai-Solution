import 'dart:convert';
import 'dart:math';

import 'package:ai_solution/BLoC/chatting/chatting_events.dart';
import 'package:ai_solution/BLoC/chatting/chatting_states.dart';
import 'package:ai_solution/data/vos/admin_uid_vo.dart';
import 'package:ai_solution/domain/chatting_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessageBloc extends Bloc<ChattingEvents, MessagingStates> {
  final ChattingRepo chattingRepo;

  MessageBloc({required this.chattingRepo}) : super(MessagingInitial()) {
    on<SendMessage>(_onSendMessage);
  }

  Future<String> fetchAdminUID() async {
    List<AdminUidVO> adminID = await chattingRepo.fetchAdminUID();

    return adminID[0].id;
  }

  Future<void> _onSendMessage(
      SendMessage event, Emitter<MessagingStates> emit) async {
    try {
      var random = Random.secure();
      var values = List<int>.generate(16, (i) => random.nextInt(256));

      await chattingRepo.sendMessages(
          event.receiverID, base64UrlEncode(values), event.message);
    } catch (error) {
      emit(SentMessageError("$error"));
    }
  }
}
