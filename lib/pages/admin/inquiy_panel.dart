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
              )
            ],
          ),
        ),
        Row(
        //  mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 220,
              height: MediaQuery.of(context).size.height * 1 - 50,
              decoration: BoxDecoration(border: Border(right: BorderSide(width: 0.7, color: const Color.fromARGB(255, 150, 149, 149)))),
            )
          ],
        )
      ],
    );
  }
}
