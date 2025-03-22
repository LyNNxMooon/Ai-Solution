import 'package:ai_solution/BLoC/chatting/chatting_bloc.dart';
import 'package:ai_solution/constant/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class ChattingPanel extends StatefulWidget {
  const ChattingPanel({super.key});

  @override
  State<ChattingPanel> createState() => _ChattingPanelState();
}

class _ChattingPanelState extends State<ChattingPanel> {
  bool selectAll = false;

  int selectedTileIndex = 0;

  late final chattingBloc = context.read<MessageBloc>();

  @override
  Widget build(BuildContext context) {
    return Column(
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
                            itemBuilder: (context, index) => chatUserTile(
                                snapshot.data![index].chattedUserName,
                                snapshot.data![index].lastMessage,
                                index),
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
            )
          ],
        )
      ],
    );
  }

  Widget chatUserTile(String name, String message, int index) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      tileColor: index == selectedTileIndex ? Colors.black12 : kPrimaryColor,
      onTap: () {
        setState(() {
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
            name,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          const Gap(8),
          Text(
             message.length >= 40 ? "${ message.substring(0,40)} ..." : message,
            style: TextStyle(
                fontSize: 13, color: const Color.fromARGB(255, 141, 141, 141)),
          ),
        ],
      ),

      //contentPadding: EdgeInsets.all(0),
    );
  }
}
