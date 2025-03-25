import 'package:ai_solution/BLoC/inquiry/inquiry_bloc.dart';
import 'package:ai_solution/BLoC/inquiry/inquiry_events.dart';
import 'package:ai_solution/BLoC/inquiry/inquiry_states.dart';
import 'package:ai_solution/constant/colors.dart';
import 'package:ai_solution/data/vos/inquiry_vo.dart';
import 'package:ai_solution/utils/navigation_extension.dart';
import 'package:ai_solution/widgets/confirmation_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:shimmer/shimmer.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class InquiryPanel extends StatefulWidget {
  const InquiryPanel({super.key});

  @override
  State<InquiryPanel> createState() => _InquiryPanelState();
}

class _InquiryPanelState extends State<InquiryPanel> {
  List<String> placeHolderItems = ["Loading..."];

  late final inquiryBloc = context.read<SerivceBloc>();

  bool isOpenTapped = true;

  late final openedInquiryBloc = context.read<OpenInquiryBloc>();
  late final closedInquiryBloc = context.read<ClosedInquiryBloc>();
  late final inquiryUpdateBloc = context.read<UpdateInquiryBloc>();
  late final inquiryDeleteBloc = context.read<DeleteInquiryBloc>();

  InquiryVO? openedInquiry;

  InquiryVO? closedInquiry;

  @override
  void initState() {
    inquiryBloc.add(FetchServicesByAdmin());
    super.initState();
  }

  String? selectedServiceValue;
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
                    placeholder: "Search by email",
                    style: TextStyle(fontSize: 13, color: Colors.white),
                    onSubmitted: (value) {
                      setState(() {
                        openedInquiry = null;
                        closedInquiry = null;
                      });
                      isOpenTapped
                          ? openedInquiryBloc.add(FilterOpenedInquiriesByAdmin(
                              keyword: value, isSearch: true))
                          : closedInquiryBloc.add(FilterClosedInquiriesByAdmin(
                              keyword: value, isSearch: true));
                    },
                  )),
              const Gap(20),
              Text(
                selectedServiceValue ?? "All",
                style: TextStyle(
                    color: kPrimaryColor, fontWeight: FontWeight.w500),
              ),
              BlocBuilder<SerivceBloc, ServiceStates>(
                builder: (context, state) {
                  if (state is ServiceLoading) {
                    return PopupMenuButton<String>(
                      color: Colors.white,
                      icon: Icon(Icons.filter_alt,
                          size: 25, color: kPrimaryColor), // Icon button
                      onSelected: (String value) {
                        setState(() {
                          selectedServiceValue = value;
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
                          openedInquiry = null;
                          closedInquiry = null;
                          selectedServiceValue = value;
                        });
                        isOpenTapped
                            ? openedInquiryBloc.add(
                                FilterOpenedInquiriesByAdmin(
                                    keyword: value, isSearch: false))
                            : closedInquiryBloc.add(
                                FilterClosedInquiriesByAdmin(
                                    keyword: value, isSearch: false));
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
                  ? closeInquiryButton()
                  : openInquiryButtonAndDeleteButton()
            ],
          ),
        ),
        Row(
          //  mainAxisAlignment: MainAxisAlignment.start,
          //mainAxisAlignment: MainAxisAlignment.center,

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
                    child: Row(
                      children: [
                        Text(
                          "Inquires",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                        IconButton(
                            onPressed: () {
                              openedInquiryBloc
                                  .add(FetchOpenedInquiresByAdmin());
                              closedInquiryBloc
                                  .add(FetchClosedInquiresByAdmin());
                            },
                            icon: Icon(Icons.refresh_sharp))
                      ],
                    ),
                  ),
                  const Divider(
                    height: 50,
                    thickness: 0.8,
                    indent: 10,
                    endIndent: 10,
                  ),
                  ListTile(
                    tileColor: isOpenTapped ? Colors.black12 : kPrimaryColor,
                    onTap: () {
                      setState(() {
                        isOpenTapped = true;
                        //openedInquiryBloc.add(FetchOpenedInquiresByAdmin());
                      });
                    },
                    leading: Text(
                      "All Opened",
                      style: TextStyle(fontSize: 14),
                    ),
                    trailing: BlocBuilder<OpenInquiryBloc, OpenInquiryStates>(
                      builder: (context, state) {
                        if (state is OpenedInquiriesLoaded) {
                          return Text(
                            "${state.openedInquiries.length}",
                            style: TextStyle(fontSize: 14),
                          );
                        } else {
                          return Text(
                            "0",
                            style: TextStyle(fontSize: 14),
                          );
                        }
                      },
                    ),
                    //contentPadding: EdgeInsets.all(0),
                  ),
                  ListTile(
                    tileColor: !isOpenTapped ? Colors.black12 : kPrimaryColor,
                    onTap: () {
                      setState(() {
                        isOpenTapped = false;
                        // closedInquiryBloc.add(FetchClosedInquiresByAdmin());
                      });
                    },
                    leading: Text(
                      "All  Closed",
                      style: TextStyle(fontSize: 14),
                    ),
                    trailing:
                        BlocBuilder<ClosedInquiryBloc, ClosedInquiryStates>(
                      builder: (context, state) {
                        if (state is ClosedInquiriesLoaded) {
                          return Text(
                            "${state.closedInquires.length}",
                            style: TextStyle(fontSize: 14),
                          );
                        } else {
                          return Text(
                            "0",
                            style: TextStyle(fontSize: 14),
                          );
                        }
                      },
                    ),
                    //contentPadding: EdgeInsets.all(0),
                  )
                ],
              ),
            ),
            isOpenTapped ? openedInquiriesUI() : closedInquiresUI(),
            Container(
              padding: EdgeInsets.only(left: 50, right: 50),
              width: MediaQuery.of(context).size.width * 1 -
                  ((MediaQuery.of(context).size.width * 0.55) + 290),
              height: MediaQuery.of(context).size.height * 1 - 50,
              child:
                  isOpenTapped ? openedInquiryDetail() : closedInquiryDetail(),
            )
          ],
        )
      ],
    );
  }

  Widget openInquiryButtonAndDeleteButton() {
    return Row(children: [
      BlocConsumer<UpdateInquiryBloc, InquiryUpdateStates>(
        builder: (context, state) {
          if (state is InquiryUpdateLoading) {
            return CupertinoActivityIndicator(
              color: kPrimaryColor,
            );
          } else {
            return GestureDetector(
              onTap: () {
                if (closedInquiry == null) {
                  showTopSnackBar(
                    Overlay.of(context),
                    CustomSnackBar.error(
                      message: "Please select an inquiry to open!",
                    ),
                  );
                } else {
                  closedInquiry!.isOpened = true;
                  inquiryUpdateBloc.add(UpdateInquiry(inquiry: closedInquiry!));
                }
              },
              child: Container(
                width: 160,
                height: 30,
                color: const Color.fromARGB(255, 64, 64, 64),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.restore,
                      color: kPrimaryColor,
                      size: 20,
                    ),
                    const Gap(10),
                    Text(
                      "Open Inquiry",
                      style: TextStyle(color: kPrimaryColor, fontSize: 13),
                    ),
                    const Gap(10)
                  ],
                ),
              ),
            );
          }
        },
        listener: (context, state) {
          if (state is InquiryUpdated) {
            setState(() {
              closedInquiry = null;
            });
            closedInquiryBloc.add(FetchClosedInquiresByAdmin());
            openedInquiryBloc.add(FetchOpenedInquiresByAdmin());
            showTopSnackBar(
              Overlay.of(context),
              CustomSnackBar.success(
                message: state.message,
              ),
            );
          }

          if (state is InquiryUpdateError) {
            showTopSnackBar(
              Overlay.of(context),
              CustomSnackBar.error(
                message: state.message,
              ),
            );
          }
        },
      ),
      const Gap(20),
      BlocConsumer<DeleteInquiryBloc, DeleteInquiryStates>(
        builder: (context, state) {
          if (state is DeleteInquiryLoading) {
            return CupertinoActivityIndicator(
              color: kPrimaryColor,
            );
          } else {
            return GestureDetector(
              onTap: () {
                if (closedInquiry == null) {
                  showTopSnackBar(
                    Overlay.of(context),
                    CustomSnackBar.error(
                      message: "Please select an inquiry to delete!",
                    ),
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (context) => ConfirmationWidget(
                      message: "Are you sure to delete this inquiry forever?",
                      function: () {
                        inquiryDeleteBloc
                            .add(DeleteInquiry(id: closedInquiry!.id));
                      },
                    ),
                  );
                }
              },
              child: Container(
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
                      "Delete Inquiry",
                      style: TextStyle(color: kPrimaryColor, fontSize: 13),
                    ),
                    const Gap(10)
                  ],
                ),
              ),
            );
          }
        },
        listener: (context, state) {
          if (state is InquiryDeleted) {
            context.navigateBack();
            setState(() {
              closedInquiry = null;
            });
            closedInquiryBloc.add(FetchClosedInquiresByAdmin());

            showTopSnackBar(
              Overlay.of(context),
              CustomSnackBar.success(
                message: state.message,
              ),
            );
          }

          if (state is DeleteInquiryError) {
            showTopSnackBar(
              Overlay.of(context),
              CustomSnackBar.error(
                message: state.message,
              ),
            );
          }
        },
      )
    ]);
  }

  Widget closeInquiryButton() {
    return BlocConsumer<UpdateInquiryBloc, InquiryUpdateStates>(
      builder: (context, state) {
        if (state is InquiryUpdateLoading) {
          return CupertinoActivityIndicator(
            color: kPrimaryColor,
          );
        } else {
          return GestureDetector(
            onTap: () {
              if (openedInquiry == null) {
                showTopSnackBar(
                  Overlay.of(context),
                  CustomSnackBar.error(
                    message: "Please select an inquiry to close!",
                  ),
                );
              } else {
                openedInquiry!.isOpened = false;
                inquiryUpdateBloc.add(UpdateInquiry(inquiry: openedInquiry!));
              }
            },
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
                    style: TextStyle(color: kPrimaryColor, fontSize: 13),
                  ),
                  const Gap(10)
                ],
              ),
            ),
          );
        }
      },
      listener: (context, state) {
        if (state is InquiryUpdated) {
          setState(() {
            openedInquiry = null;
          });

          openedInquiryBloc.add(FetchOpenedInquiresByAdmin());
          closedInquiryBloc.add(FetchClosedInquiresByAdmin());

          showTopSnackBar(
            Overlay.of(context),
            CustomSnackBar.success(
              message: state.message,
            ),
          );
        }

        if (state is InquiryUpdateError) {
          showTopSnackBar(
            Overlay.of(context),
            CustomSnackBar.error(
              message: state.message,
            ),
          );
        }
      },
    );
  }

  Widget openedInquiryDetail() {
    return openedInquiry == null
        ? SizedBox()
        : SingleChildScrollView(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(20),
                Row(
                  children: [
                    Icon(
                      Icons.business,
                      color: const Color.fromRGBO(34, 34, 34, 1),
                      size: 40,
                    ),
                    const Gap(15),
                    Text(
                      openedInquiry!.companyName,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: const Color.fromRGBO(34, 34, 34, 1)),
                    ),
                  ],
                ),
                SizedBox(
                    width: 200,
                    child: Divider(
                      height: 60,
                      thickness: 0.8,
                    )),
                Text(
                  "About this Inquiry",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                const Gap(30),
                Text(
                  "Name",
                  style: TextStyle(fontSize: 12, color: Colors.black54),
                ),
                Text("${openedInquiry!.firstName} ${openedInquiry!.lastName}"),
                const Gap(30),
                Text(
                  "Email",
                  style: TextStyle(fontSize: 12, color: Colors.black54),
                ),
                Text(openedInquiry!.emailAddress),
                const Gap(30),
                Text(
                  "Country",
                  style: TextStyle(fontSize: 12, color: Colors.black54),
                ),
                Text(openedInquiry!.country),
                const Gap(30),
                Text(
                  "Phone",
                  style: TextStyle(fontSize: 12, color: Colors.black54),
                ),
                Text(openedInquiry!.phone),
                SizedBox(
                    width: 200,
                    child: Divider(
                      height: 60,
                      thickness: 0.8,
                    )),
                Row(
                  children: [
                    Icon(
                      Icons.work,
                      color: const Color.fromRGBO(34, 34, 34, 1),
                    ),
                    const Gap(10),
                    Text(
                      "About Job",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ],
                ),
                const Gap(30),
                Text(
                  "Service",
                  style: TextStyle(fontSize: 12, color: Colors.black54),
                ),
                Text(openedInquiry!.service),
                const Gap(30),
                Text(
                  "Title",
                  style: TextStyle(fontSize: 12, color: Colors.black54),
                ),
                Text(openedInquiry!.jobTitle),
                const Gap(30),
                Text(
                  "Details",
                  style: TextStyle(fontSize: 12, color: Colors.black54),
                ),
                Text(
                  openedInquiry!.jobDetails,
                ),
              ],
            ),
          );
  }

  Widget closedInquiryDetail() {
    return closedInquiry == null
        ? SizedBox()
        : SingleChildScrollView(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(20),
                Row(
                  children: [
                    Icon(
                      Icons.business,
                      color: const Color.fromRGBO(34, 34, 34, 1),
                      size: 40,
                    ),
                    const Gap(15),
                    Text(
                      closedInquiry!.companyName,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: const Color.fromRGBO(34, 34, 34, 1)),
                    ),
                  ],
                ),
                SizedBox(
                    width: 200,
                    child: Divider(
                      height: 60,
                      thickness: 0.8,
                    )),
                Text(
                  "About this Inquiry",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                const Gap(30),
                Text(
                  "Name",
                  style: TextStyle(fontSize: 12, color: Colors.black54),
                ),
                Text("${closedInquiry!.firstName} ${closedInquiry!.lastName}"),
                const Gap(30),
                Text(
                  "Email",
                  style: TextStyle(fontSize: 12, color: Colors.black54),
                ),
                Text(closedInquiry!.emailAddress),
                const Gap(30),
                Text(
                  "Country",
                  style: TextStyle(fontSize: 12, color: Colors.black54),
                ),
                Text(closedInquiry!.country),
                const Gap(30),
                Text(
                  "Phone",
                  style: TextStyle(fontSize: 12, color: Colors.black54),
                ),
                Text(closedInquiry!.phone),
                SizedBox(
                    width: 200,
                    child: Divider(
                      height: 60,
                      thickness: 0.8,
                    )),
                Row(
                  children: [
                    Icon(
                      Icons.work,
                      color: const Color.fromRGBO(34, 34, 34, 1),
                    ),
                    const Gap(10),
                    Text(
                      "About Job",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ],
                ),
                const Gap(30),
                Text(
                  "Service",
                  style: TextStyle(fontSize: 12, color: Colors.black54),
                ),
                Text(closedInquiry!.service),
                const Gap(30),
                Text(
                  "Title",
                  style: TextStyle(fontSize: 12, color: Colors.black54),
                ),
                Text(closedInquiry!.jobTitle),
                const Gap(30),
                Text(
                  "Details",
                  style: TextStyle(fontSize: 12, color: Colors.black54),
                ),
                Text(
                  closedInquiry!.jobDetails,
                ),
              ],
            ),
          );
  }

  Widget openedInquiriesUI() {
    return BlocBuilder<OpenInquiryBloc, OpenInquiryStates>(
      builder: (context, state) {
        if (state is OpenInquiryLoading) {
          return Container(
            padding: EdgeInsets.only(top: 10, left: 40, right: 40),
            width: MediaQuery.of(context).size.width * 0.55,
            height: MediaQuery.of(context).size.height * 1 - 50,
            decoration: BoxDecoration(
                border: Border(
                    right: BorderSide(
                        width: 0.7,
                        color: const Color.fromARGB(255, 150, 149, 149)))),
            child: Shimmer.fromColors(
              baseColor: Colors.black26,
              highlightColor: Colors.white,
              child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 90,
                        decoration: BoxDecoration(
                            color: Colors.black26,
                            borderRadius: BorderRadius.circular(3)),
                      )),
                  separatorBuilder: (context, index) => const Gap(10),
                  itemCount: 20),
            ),
          );
        } else if (state is OpenedInquiriesLoaded) {
          if (state.openedInquiries.isEmpty) {
            return Container(
              padding: EdgeInsets.only(top: 10, left: 40, right: 40),
              width: MediaQuery.of(context).size.width * 0.55,
              height: MediaQuery.of(context).size.height * 1 - 50,
              decoration: BoxDecoration(
                  border: Border(
                      right: BorderSide(
                          width: 0.7,
                          color: const Color.fromARGB(255, 150, 149, 149)))),
              child: Center(
                child: Icon(
                  Icons.mail_outline,
                  size: 100,
                  color: Colors.black26,
                ),
              ),
            );
          } else {
            return Container(
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
                        onTap: () {
                          setState(() {
                            openedInquiry = state.openedInquiries[index];
                          });
                        },
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
                                    "${state.openedInquiries[index].firstName} ${state.openedInquiries[index].lastName}",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  const Gap(5),
                                  Text(
                                    state.openedInquiries[index].companyName,
                                    style: TextStyle(fontSize: 13),
                                  ),
                                  const Gap(5),
                                  Text(
                                    state.openedInquiries[index].emailAddress,
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                            trailing: Text(
                              state.openedInquiries[index].country,
                              style: TextStyle(
                                  color: const Color.fromARGB(255, 64, 64, 64),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13),
                            ),
                          ),
                        ),
                      ),
                  separatorBuilder: (context, index) => const Gap(10),
                  itemCount: state.openedInquiries.length),
            );
          }
        } else if (state is OpenedInquiryError) {
          return Center(
            child: Text(state.message),
          );
        } else {
          return SizedBox();
        }
      },
    );
  }

  Widget closedInquiresUI() {
    return BlocBuilder<ClosedInquiryBloc, ClosedInquiryStates>(
      builder: (context, state) {
        if (state is ClosedInquiryLoading) {
          return Container(
            padding: EdgeInsets.only(top: 10, left: 40, right: 40),
            width: MediaQuery.of(context).size.width * 0.55,
            height: MediaQuery.of(context).size.height * 1 - 50,
            decoration: BoxDecoration(
                border: Border(
                    right: BorderSide(
                        width: 0.7,
                        color: const Color.fromARGB(255, 150, 149, 149)))),
            child: Shimmer.fromColors(
              baseColor: Colors.black26,
              highlightColor: Colors.white,
              child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 90,
                        decoration: BoxDecoration(
                            color: Colors.black26,
                            borderRadius: BorderRadius.circular(3)),
                      )),
                  separatorBuilder: (context, index) => const Gap(10),
                  itemCount: 20),
            ),
          );
        } else if (state is ClosedInquiriesLoaded) {
          if (state.closedInquires.isEmpty) {
            return Container(
              padding: EdgeInsets.only(top: 10, left: 40, right: 40),
              width: MediaQuery.of(context).size.width * 0.55,
              height: MediaQuery.of(context).size.height * 1 - 50,
              decoration: BoxDecoration(
                  border: Border(
                      right: BorderSide(
                          width: 0.7,
                          color: const Color.fromARGB(255, 150, 149, 149)))),
              child: Center(
                child: Icon(
                  Icons.mail_outline,
                  size: 100,
                  color: Colors.black26,
                ),
              ),
            );
          } else {
            return Container(
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
                        onTap: () {
                          setState(() {
                            closedInquiry = state.closedInquires[index];
                          });
                        },
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
                                    "${state.closedInquires[index].firstName} ${state.closedInquires[index].lastName}",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  const Gap(5),
                                  Text(
                                    state.closedInquires[index].companyName,
                                    style: TextStyle(fontSize: 13),
                                  ),
                                  const Gap(5),
                                  Text(
                                    state.closedInquires[index].emailAddress,
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                            trailing: Text(
                              state.closedInquires[index].country,
                              style: TextStyle(
                                  color: const Color.fromARGB(255, 64, 64, 64),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13),
                            ),
                          ),
                        ),
                      ),
                  separatorBuilder: (context, index) => const Gap(10),
                  itemCount: state.closedInquires.length),
            );
          }
        } else if (state is ClosedInquiryError) {
          return Center(
            child: Text(state.message),
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}
