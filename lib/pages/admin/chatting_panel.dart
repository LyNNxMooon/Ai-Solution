import 'package:ai_solution/BLoC/chatting/chatting_bloc.dart';
import 'package:ai_solution/BLoC/chatting/chatting_events.dart';
import 'package:ai_solution/BLoC/chatting/chatting_states.dart';
import 'package:ai_solution/constant/colors.dart';
import 'package:ai_solution/data/vos/chatted_user_vo.dart';
import 'package:ai_solution/data/vos/message_vo.dart';
import 'package:flutter/cupertino.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class ChattingPanel extends StatefulWidget {
  const ChattingPanel({super.key});

  @override
  State<ChattingPanel> createState() => _ChattingPanelState();
}

class _ChattingPanelState extends State<ChattingPanel> {
  bool selectAll = false;

  int selectedTileIndex = 0;

  late final chattingBloc = context.read<MessageBloc>();

  ChattedUserVO? chatUser;

  final _messageController = TextEditingController();

  // @override
  // void initState() {
  //   List<ChattedUserVO> userList = [];

  //   chattingBloc.chattingRepo
  //       .getChatListStream()
  //       .map((event) => userList = event ?? []);

  //   chatUser = userList[0];
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MessageBloc, MessagingStates>(
      listener: (context, state) {
        if (state is SentMessageByAdminError) {
          showTopSnackBar(
            Overlay.of(context),
            CustomSnackBar.error(
              message: state.message,
            ),
          );
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 15),
            width: MediaQuery.of(context).size.width * 1 - 70,
            height: 50,
            color: const Color.fromRGBO(34, 34, 34, 1),
            child: Row(
              children: [
                Checkbox(
                  value: selectAll,
                  onChanged: (value) {
                    setState(() {
                      selectAll = !selectAll;
                    });
                  },
                  activeColor: kPrimaryColor,
                  focusColor: Colors.white,
                  side: BorderSide(color: kPrimaryColor),
                ),
                const Gap(5),
                Padding(
                  padding: const EdgeInsets.only(top: 1),
                  child: Text(
                    "Select All",
                    style: TextStyle(
                        color: kPrimaryColor, fontWeight: FontWeight.w500),
                  ),
                ),
                const Gap(60),
                Container(
                  width: 160,
                  height: 30,
                  color: const Color.fromARGB(255, 64, 64, 64),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.delete,
                        color: kPrimaryColor,
                        size: 20,
                      ),
                      const Gap(10),
                      Text(
                        "Delete",
                        style: TextStyle(color: kPrimaryColor, fontSize: 13),
                      ),
                      const Gap(10)
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(top: 18),
                width: 500,
                height: MediaQuery.of(context).size.height * 1 - 50,
                decoration: BoxDecoration(
                    border: Border(
                        right: BorderSide(
                            width: 0.7,
                            color: const Color.fromARGB(255, 150, 149, 149)))),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 22),
                        child: Text(
                          "Live Chats",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                      ),
                      const Divider(
                        height: 50,
                        thickness: 0.8,
                        indent: 10,
                        endIndent: 10,
                      ),

                      StreamBuilder(
                        stream: chattingBloc.fetchAllChattedUsers(),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return const Center(
                              child: Text("Cannot load Users"),
                            );
                          }
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return SizedBox();
                          }
                          if (snapshot.hasData && snapshot.data != null) {
                            return ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) =>
                                  chatUserTile(snapshot.data![index], index),
                              itemCount: snapshot.data!.length,
                            );
                          } else {
                            return const Center(
                              child: Text("No users yet"),
                            );
                          }
                        },
                      )
                      //
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 1 - 570,
                height: MediaQuery.of(context).size.height * 1 - 50,
                // height: double.infinity,
                child: Column(
                  children: [
                    Expanded(
                      child: chatUser == null
                          ? SizedBox()
                          : StreamBuilder(
                              stream: chattingBloc
                                  .getMessagesByAdmin(chatUser!.chattedUserID),
                              builder: (context, snapshot) {
                                if (snapshot.hasError) {
                                  return const Center(
                                    child: Text("Cannot load messages"),
                                  );
                                }
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const Center(
                                    child: CupertinoActivityIndicator(),
                                  );
                                }

                                if (snapshot.hasData &&
                                    snapshot.data!.snapshot.value != null) {
                                  Map<dynamic, dynamic> messagesMap = snapshot
                                      .data!
                                      .snapshot
                                      .value as Map<dynamic, dynamic>;
                                  List<MessageVO> messages =
                                      messagesMap.values.map((message) {
                                    return MessageVO.fromJson(
                                        Map<String, dynamic>.from(message));
                                  }).toList();

                                  // Sort the messages by timeStamp in ascending order
                                  messages.sort((a, b) =>
                                      a.timeStamp.compareTo(b.timeStamp));

                                  messages = messages.reversed.toList();

                                  return ListView(
                                    reverse: true,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    // Removed reverse: true to fix the ordering
                                    children: messages
                                        .map((message) => MessageItemView(
                                              message: message,
                                              userID:
                                                  chattingBloc.getAdminUserId(),
                                            ))
                                        .toList(),
                                  );
                                } else {
                                  return const Center(
                                    child: Text("No messages yet"),
                                  );
                                }
                              },
                            ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: 20, right: 20, bottom: 10, top: 15),
                      //width: 300,
                      child: TextField(
                        controller: _messageController,
                        decoration: InputDecoration(
                          hintText: "Type a message...",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: kFourthColor)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: kFourthColor)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: kFourthColor)),
                          suffixIcon: GestureDetector(
                              onTap: () {
                                if (chatUser == null) {
                                  showTopSnackBar(
                                    Overlay.of(context),
                                    CustomSnackBar.error(
                                      message: "Open A Chat!",
                                    ),
                                  );
                                } else {
                                  chattingBloc.add(SendMessageByAdmin(
                                      receiverID: chatUser!.chattedUserID,
                                      message: _messageController.text));
                                  _messageController.clear();
                                }
                              },
                              child: Icon(Icons.send)),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget chatUserTile(ChattedUserVO chattedUser, int index) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      tileColor: index == selectedTileIndex ? Colors.black12 : kPrimaryColor,
      onTap: () {
        setState(() {
          chatUser = chattedUser;
          selectedTileIndex = index;
        });
      },
      leading: Checkbox(
        value: false,
        onChanged: (value) {},
        activeColor: kFourthColor,
        focusColor: kFourthColor,
        side: BorderSide(color: kFourthColor),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            chattedUser.chattedUserName,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          const Gap(8),
          Text(
            chattedUser.lastMessage.length >= 40
                ? "${chattedUser.lastMessage.substring(0, 40)} ..."
                : chattedUser.lastMessage,
            style: TextStyle(
                fontSize: 13, color: const Color.fromARGB(255, 141, 141, 141)),
          ),
        ],
      ),

      //contentPadding: EdgeInsets.all(0),
    );
  }
}

class MessageItemView extends StatelessWidget {
  const MessageItemView(
      {super.key, required this.message, required this.userID});

  final MessageVO message;

  final String userID;

  @override
  Widget build(BuildContext context) {
    // Determine the color and alignment based on the sender
    Color bubbleColor = (message.senderID == userID)
        ? const Color.fromARGB(255, 230, 227, 227)
        : const Color.fromARGB(156, 234, 235, 232);

    var alignment = (message.senderID == userID)
        ? Alignment.centerRight
        : Alignment.centerLeft;

    return Container(
      margin:  EdgeInsets.only(bottom: 20, right: 20, left: 20,  ),
      alignment: alignment,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
        constraints: const BoxConstraints(maxWidth: 650),
        decoration: BoxDecoration(
            color: bubbleColor, borderRadius: BorderRadius.circular(15)),
        child: Text(
          message.message,
          style: const TextStyle(fontSize: 14),
        ),
      ),
    );
  }
}
