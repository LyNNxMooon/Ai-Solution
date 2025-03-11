import 'package:ai_solution/BLoC/inquiry/inquiry_bloc.dart';
import 'package:ai_solution/BLoC/inquiry/inquiry_events.dart';
import 'package:ai_solution/BLoC/inquiry/inquiry_states.dart';
import 'package:ai_solution/constant/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class InquiryPanel extends StatefulWidget {
  const InquiryPanel({super.key});

  @override
  State<InquiryPanel> createState() => _InquiryPanelState();
}

class _InquiryPanelState extends State<InquiryPanel> {
  List<String> placeHolderItems = ["Loading..."];

  late final inquiryBloc = context.read<SerivceBloc>();

  bool isOpenTapped = true;

  @override
  void initState() {
    inquiryBloc.add(FetchServicesByAdmin());
    super.initState();
  }

  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(left: 3),
          width: MediaQuery.of(context).size.width * 1 - 70,
          height: 50,
          color: const Color.fromRGBO(34, 34, 34, 1),
          child: Row(
            children: [
              SizedBox(
                  width: 400,
                  height: 30,
                  child: CupertinoSearchTextField(
                    backgroundColor: const Color.fromARGB(255, 64, 64, 64),
                    itemColor: kPrimaryColor,
                    itemSize: 16,
                    style: TextStyle(fontSize: 13, color: Colors.white),
                  )),
              const Gap(20),
              BlocBuilder<SerivceBloc, ServiceStates>(
                builder: (context, state) {
                  if (state is ServiceLoading) {
                    return PopupMenuButton<String>(
                      color: Colors.white,
                      icon: Icon(Icons.filter_alt,
                          size: 25, color: kPrimaryColor), // Icon button
                      onSelected: (String value) {
                        setState(() {
                          selectedValue = value;
                        });
                      },
                      itemBuilder: (BuildContext context) {
                        return placeHolderItems.map((String item) {
                          return PopupMenuItem<String>(
                            value: item,
                            child: Text(item),
                          );
                        }).toList();
                      },
                    );
                  } else if (state is ServicesLoadedByAdmin) {
                    return PopupMenuButton<String>(
                      color: Colors.white,
                      icon: Icon(Icons.filter_alt,
                          size: 25, color: kPrimaryColor), // Icon button
                      onSelected: (String value) {
                        setState(() {
                          selectedValue = value;
                        });
                      },
                      itemBuilder: (BuildContext context) {
                        return state.services.map((String item) {
                          return PopupMenuItem<String>(
                            value: item,
                            child: Text(item),
                          );
                        }).toList();
                      },
                    );
                  } else {
                    return SizedBox();
                  }
                },
              ),
              const Gap(40),
              isOpenTapped
                  ? GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 160,
                        height: 30,
                        color: const Color.fromARGB(255, 64, 64, 64),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.check,
                              color: kPrimaryColor,
                              size: 20,
                            ),
                            const Gap(10),
                            Text(
                              "Close Inquiry",
                              style:
                                  TextStyle(color: kPrimaryColor, fontSize: 13),
                            ),
                            const Gap(10)
                          ],
                        ),
                      ),
                    )
                  : SizedBox()
            ],
          ),
        ),
        Row(
          //  mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 10),
              width: 220,
              height: MediaQuery.of(context).size.height * 1 - 50,
              decoration: BoxDecoration(
                  border: Border(
                      right: BorderSide(
                          width: 0.7,
                          color: const Color.fromARGB(255, 150, 149, 149)))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      "Inquires",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                  ),
                  const Divider(
                    height: 50,
                    thickness: 0.8,
                    indent: 10,
                    endIndent: 10,
                  ),
                  ListTile(
                    tileColor:
                        isOpenTapped ? kMessageBubbleColor : kPrimaryColor,
                    onTap: () {
                      setState(() {
                        isOpenTapped = true;
                      });
                    },
                    leading: Text(
                      "All Opened",
                      style: TextStyle(fontSize: 14),
                    ),
                    trailing: Text(
                      "0",
                      style: TextStyle(fontSize: 14),
                    ),
                    //contentPadding: EdgeInsets.all(0),
                  ),
                  ListTile(
                    tileColor:
                        !isOpenTapped ? kMessageBubbleColor : kPrimaryColor,
                    onTap: () {
                      setState(() {
                        isOpenTapped = false;
                      });
                    },
                    leading: Text(
                      "All Closed",
                      style: TextStyle(fontSize: 14),
                    ),
                    trailing: Text(
                      "0",
                      style: TextStyle(fontSize: 14),
                    ),
                    //contentPadding: EdgeInsets.all(0),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10, left: 40, right: 40),
              width: MediaQuery.of(context).size.width * 0.55,
              height: MediaQuery.of(context).size.height * 1 - 50,
              decoration: BoxDecoration(
                  border: Border(
                      right: BorderSide(
                          width: 0.7,
                          color: const Color.fromARGB(255, 150, 149, 149)))),
              child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => GestureDetector(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(width: 0.15),
                              borderRadius: BorderRadius.circular(3)),
                          child: ListTile(
                            tileColor: Colors.white,
                            //style: ListTileStyle.list,
                            leading: Icon(Icons.mail),
                            title: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Lynn Thant",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  const Gap(5),
                                  Text(
                                    "AAAPOS",
                                    style: TextStyle(fontSize: 13),
                                  ),
                                  const Gap(5),
                                  Text(
                                    "lyne.thant@aaapos.com",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                            trailing: Text(
                              "Cambodia",
                              style: TextStyle(
                                  color: const Color.fromARGB(255, 64, 64, 64),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13),
                            ),
                          ),
                        ),
                      ),
                  separatorBuilder: (context, index) => const Gap(10),
                  itemCount: 5),
            ),
          ],
        )
      ],
    );
  }

  Widget openedInquiriesUI() {
    return SizedBox();
  }

  Widget closedInquiresUI() {
    return SizedBox();
  }
}
