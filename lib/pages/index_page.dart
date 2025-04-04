// ignore_for_file: prefer_final_fields

import 'package:ai_solution/BLoC/chatting/chatting_bloc.dart';
import 'package:ai_solution/BLoC/chatting/chatting_events.dart';
import 'package:ai_solution/BLoC/chatting/chatting_states.dart';
import 'package:ai_solution/constant/colors.dart';
import 'package:ai_solution/data/vos/message_vo.dart';
import 'package:ai_solution/pages/about_page.dart';
import 'package:ai_solution/pages/events_page.dart';
import 'package:ai_solution/pages/faq_page.dart';
import 'package:ai_solution/pages/gallery_page.dart';
import 'package:ai_solution/pages/landing_page.dart';
import 'package:ai_solution/utils/hover_extension.dart';
import 'package:ai_solution/widgets/text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final _searchController = TextEditingController();
  final _messageController = TextEditingController();
  bool _isHoverItem = false;
  bool _isHoverItem2 = false;
  bool _isHoverItem3 = false;
  bool _isHoverItem4 = false;
  bool _isHoverItem5 = false;

  int _currentIndex = 0;

  bool _isChatVisible = false;

  String adminUID = "";

  late final chattingBloc = context.read<MessageBloc>();

  @override
  void initState() {
    chattingBloc.fetchAdminUID().then(
      (value) {
        adminUID = value;
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          setState(() {
            _isChatVisible = !_isChatVisible;
          });
        },
        child: Icon(
          CupertinoIcons.chat_bubble_2,
          color: kFourthColor,
          size: 30,
        ),
      ),
      body: Stack(
        children: [
          Center(
            child: ListView(
              children: [
                naviBar(),
                _currentIndex == 0
                    ? LandingPage()
                    : _currentIndex == 1
                        ? EventsPage()
                        : _currentIndex == 2
                            ? AboutPage()
                            : _currentIndex == 3
                                ? GalleryPage()
                                : _currentIndex == 4
                                    ? FAQPage()
                                    : SizedBox(),
                footer(),
              ],
            ),
          ),
          if (_isChatVisible)
            BlocListener<MessageBloc, MessagingStates>(
              listener: (context, state) {
                if (state is SentMessageError) {
                  showTopSnackBar(
                    Overlay.of(context),
                    CustomSnackBar.error(
                      message: state.message,
                    ),
                  );
                }
              },
              child: Positioned(
                bottom: 80, // Adjust position above FAB
                right: 20, // Align to FAB
                child: Material(
                  elevation: 8,
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    width: 400,
                    height: 450,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        // Chat Header
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Live Chat",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18)),
                            IconButton(
                              icon: Icon(Icons.close),
                              onPressed: () {
                                setState(() {
                                  _isChatVisible = false;
                                });
                              },
                            ),
                          ],
                        ),
                        Divider(),
                        Expanded(
                          child: StreamBuilder(
                            stream: chattingBloc.getMessages(adminUID),
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
                                      .map((message) =>
                                          MessageItemView(message: message, userID: chattingBloc.userID,))
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
                        TextField(
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
                            suffixIcon: GestureDetector(onTap: () {
                              chattingBloc.add(SendMessage(receiverID: adminUID, message: _messageController.text));
                              _messageController.clear();
                            },child: Icon(Icons.send)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget footer() {
    return Container(
      color: const Color.fromRGBO(34, 34, 34, 1),
      width: double.infinity,
      padding: EdgeInsets.only(top: 50, left: 120, right: 120, bottom: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        "assets/images/logo.png",
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                      const Gap(15),
                      Text(
                        "Terms & Conditions",
                        style: TextStyle(
                            fontFamily: "KaiseiDecol",
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const Gap(30),
                  SizedBox(
                    width: 350,
                    child: Text(
                      "At Ai-Solution, we redefine how businesses connect, support, and grow. Our cutting-edge AI Virtual Assistant Chatbot is engineered to elevate customer experiences and streamline operations",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(10),
                  Text(
                    "Schedule",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: Colors.white),
                  ),
                  const Gap(30),
                  Row(
                    children: [
                      Icon(
                        Icons.timelapse,
                        color: Colors.white,
                      ),
                      const Gap(15),
                      Text(
                        "Monday : 9AM - 5PM",
                        style: TextStyle(color: Colors.white, fontSize: 13),
                      )
                    ],
                  ),
                  const Gap(10),
                  Row(
                    children: [
                      Icon(
                        Icons.timelapse,
                        color: Colors.white,
                      ),
                      const Gap(15),
                      Text(
                        "Tuesday : 9AM - 5PM",
                        style: TextStyle(color: Colors.white, fontSize: 13),
                      )
                    ],
                  ),
                  const Gap(10),
                  Row(
                    children: [
                      Icon(
                        Icons.timelapse,
                        color: Colors.white,
                      ),
                      const Gap(15),
                      Text(
                        "Wednesday : 9AM - 5PM",
                        style: TextStyle(color: Colors.white, fontSize: 13),
                      )
                    ],
                  ),
                  const Gap(10),
                  Row(
                    children: [
                      Icon(
                        Icons.timelapse,
                        color: Colors.white,
                      ),
                      const Gap(15),
                      Text(
                        "Thursday : 9AM - 5PM",
                        style: TextStyle(color: Colors.white, fontSize: 13),
                      )
                    ],
                  ),
                  const Gap(10),
                  Row(
                    children: [
                      Icon(
                        Icons.timelapse,
                        color: Colors.white,
                      ),
                      const Gap(15),
                      Text(
                        "Friday : 9AM - 5PM",
                        style: TextStyle(color: Colors.white, fontSize: 13),
                      )
                    ],
                  ),
                  const Gap(10),
                  Row(
                    children: [
                      Icon(
                        Icons.timelapse,
                        color: Colors.white,
                      ),
                      const Gap(15),
                      Text(
                        "Saturday : 9AM - 1PM",
                        style: TextStyle(color: Colors.white, fontSize: 13),
                      )
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(10),
                  Text(
                    "Contact Us",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: Colors.white),
                  ),
                  const Gap(30),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.white,
                      ),
                      const Gap(15),
                      Text(
                        "No. 12 MyayNiGone/ Yangon/ Myanmar",
                        style: TextStyle(color: Colors.white, fontSize: 13),
                      )
                    ],
                  ),
                  const Gap(10),
                  Row(
                    children: [
                      Icon(
                        Icons.phone,
                        color: Colors.white,
                      ),
                      const Gap(15),
                      Text(
                        "+855 69 330 432",
                        style: TextStyle(color: Colors.white, fontSize: 13),
                      )
                    ],
                  ),
                  const Gap(10),
                  Row(
                    children: [
                      Icon(
                        Icons.email_outlined,
                        color: Colors.white,
                      ),
                      const Gap(15),
                      Text(
                        "info@aisolution.com",
                        style: TextStyle(color: Colors.white, fontSize: 13),
                      )
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        "assets/images/facebook.png",
                        width: 30,
                        height: 30,
                      ),
                      const Gap(30),
                      Image.asset(
                        "assets/images/instagram.png",
                        width: 30,
                        height: 30,
                      ),
                      const Gap(30),
                      Image.asset(
                        "assets/images/linkedin.png",
                        width: 30,
                        height: 30,
                      ),
                    ],
                  ),
                  const Gap(30),
                  Row(
                    children: [
                      Image.asset(
                        "assets/images/youtube.png",
                        width: 30,
                        height: 30,
                      ),
                      const Gap(30),
                      Image.asset(
                        "assets/images/discord.png",
                        width: 30,
                        height: 30,
                      ),
                      const Gap(30),
                      Image.asset(
                        "assets/images/twitter.png",
                        width: 30,
                        height: 30,
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
          const Gap(120),
          Center(
              child: Text(
            "Copyright 2025 - AI-Solution",
            style: TextStyle(color: Colors.white),
          )),
        ],
      ),
    );
  }

  Widget naviBar() {
    return Padding(
      padding: EdgeInsets.only(top: 20, right: 20, left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                "assets/images/logo.png",
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
              const Gap(20),
              Text(
                "AI-Solution",
                style: TextStyle(fontSize: 24),
              )
            ],
          ),
          Row(
            children: [
              MouseRegion(
                onEnter: (_) => setState(() => _isHoverItem = true),
                onExit: (_) => setState(() => _isHoverItem = false),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _currentIndex = 0;
                    });
                  },
                  child: Column(
                    children: [
                      Text(
                        "Home",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        height: 2,
                        width:
                            _isHoverItem ? 40 : 0, // Underline width on hover
                        color: kFourthColor, // Underline color
                      ),
                    ],
                  ).showCursorOnHover,
                ),
              ),
              const Gap(25),
              MouseRegion(
                onEnter: (_) => setState(() => _isHoverItem2 = true),
                onExit: (_) => setState(() => _isHoverItem2 = false),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _currentIndex = 1;
                    });
                  },
                  child: Column(
                    children: [
                      Text(
                        "Events",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        height: 2,
                        width:
                            _isHoverItem2 ? 40 : 0, // Underline width on hover
                        color: kFourthColor, // Underline color
                      ),
                    ],
                  ).showCursorOnHover,
                ),
              ),
              const Gap(25),
              MouseRegion(
                onEnter: (_) => setState(() => _isHoverItem3 = true),
                onExit: (_) => setState(() => _isHoverItem3 = false),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _currentIndex = 2;
                    });
                  },
                  child: Column(
                    children: [
                      Text(
                        "About",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        height: 2,
                        width:
                            _isHoverItem3 ? 40 : 0, // Underline width on hover
                        color: kFourthColor, // Underline color
                      ),
                    ],
                  ).showCursorOnHover,
                ),
              ),
              const Gap(25),
              MouseRegion(
                onEnter: (_) => setState(() => _isHoverItem4 = true),
                onExit: (_) => setState(() => _isHoverItem4 = false),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _currentIndex = 3;
                    });
                  },
                  child: Column(
                    children: [
                      Text(
                        "Gallery",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        height: 2,
                        width:
                            _isHoverItem4 ? 40 : 0, // Underline width on hover
                        color: kFourthColor, // Underline color
                      ),
                    ],
                  ).showCursorOnHover,
                ),
              ),
              const Gap(25),
              MouseRegion(
                onEnter: (_) => setState(() => _isHoverItem5 = true),
                onExit: (_) => setState(() => _isHoverItem5 = false),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _currentIndex = 4;
                    });
                  },
                  child: Column(
                    children: [
                      Text(
                        "FAQ",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        height: 2,
                        width:
                            _isHoverItem5 ? 35 : 0, // Underline width on hover
                        color: kFourthColor, // Underline color
                      ),
                    ],
                  ).showCursorOnHover,
                ),
              ),
              const Gap(25),
              SizedBox(
                width: 150,
                height: 40,
                child: CustomTextField(
                    hintText: "Search",
                    label: "Search",
                    controller: _searchController),
              )
            ],
          )
        ],
      ),
    );
  }
}

class MessageItemView extends StatelessWidget {
  const MessageItemView({super.key, required this.message, required this.userID});

  final MessageVO message;

  final String userID;

  @override
  Widget build(BuildContext context) {
    // Determine the color and alignment based on the sender
    Color bubbleColor =
        (message.senderID == userID)
            ? const Color.fromARGB(255, 230, 227, 227)
            : const Color.fromARGB(156, 234, 235, 232);

    var alignment = (message.senderID == userID)
        ? Alignment.centerRight
        : Alignment.centerLeft;

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      alignment: alignment,
      child: Container(
        padding: 
             const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
        constraints: const BoxConstraints(maxWidth: 220),
        decoration: BoxDecoration(
            color: bubbleColor, borderRadius: BorderRadius.circular(15)),
        child:  Text(
                message.message,
                style: const TextStyle(fontSize: 14),
              ),
      ),
    );
  }
}
