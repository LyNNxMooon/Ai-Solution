// ignore_for_file: prefer_final_fields

import 'package:ai_solution/constant/colors.dart';
import 'package:ai_solution/pages/about_page.dart';
import 'package:ai_solution/pages/events_page.dart';
import 'package:ai_solution/pages/faq_page.dart';
import 'package:ai_solution/pages/gallery_page.dart';
import 'package:ai_solution/pages/landing_page.dart';
import 'package:ai_solution/utils/hover_extension.dart';
import 'package:ai_solution/widgets/text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final _searchController = TextEditingController();
  bool _isHoverItem = false;
  bool _isHoverItem2 = false;
  bool _isHoverItem3 = false;
  bool _isHoverItem4 = false;
  bool _isHoverItem5 = false;

  int _currentIndex = 0;

  bool _isChatVisible = false;

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
            Positioned(
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
                        child: ListView(
                          children: [
                            Text("Hello! How can I help you?"),
                            // Chat messages will be here
                          ],
                        ),
                      ),
                      TextField(
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
                          suffixIcon: Icon(Icons.send),
                        ),
                      ),
                    ],
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
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an",
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
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                  
              ],),
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
