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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {},
        child: Icon(
          CupertinoIcons.chat_bubble_2,
          color: kFourthColor,
          size: 30,
        ),
      ),
      body: ListView(
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
          Center(child: Text("Copyright 2025 - AI-Solution")),
          const Gap(30)
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
                height: 35,
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
