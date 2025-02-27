import 'package:ai_solution/BLoC/events/events_bloc.dart';
import 'package:ai_solution/BLoC/events/events_states.dart';
import 'package:ai_solution/data/vos/event_vo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({super.key});

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  List<EventVO> upcomingEvents = [];

  final eventPlaceHolder = EventVO(
      id: 0,
      name: "Loading Event....",
      description: "......",
      url:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSKbxFhEU0jcm9UPGfCRMkIBfK9sxxSu5W8jA&s");

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        const Gap(100),
        upcomingEventsSession(),
        const Gap(140),
        promotionalEventSession(),
        const Gap(120),
      ],
    );
  }

  Widget promotionalEventSession() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 220),
        child: BlocBuilder<PromotionalEventsBloc, PromotionalEventsStates>(
          builder: (context, state) {
            if (state is PromotionalEventsLoading) {
              return Center(
                child: CupertinoActivityIndicator(),
              );
            } else if (state is PromotionalEventsLoaded) {
              return ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => index % 2 != 0
                    ? SizedBox(
                        height: 380,
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.centerRight,
                              child: SizedBox(
                                width:
                                    (MediaQuery.of(context).size.width - 440) *
                                        0.7,
                                height: 380,
                                child: Image.network(
                                  state.promotionalEvents[index].url,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                width:
                                    (MediaQuery.of(context).size.width - 440) *
                                        0.45,
                                height: 280,
                                decoration: BoxDecoration(
                                  border: Border.all(width: 1),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black
                                          .withOpacity(0.2), // Shadow color
                                      spreadRadius: 3, // Spread radius
                                      blurRadius: 4, // Blur radius
                                      offset: const Offset(
                                          2, 3), // Offset of the shadow
                                    ),
                                  ],
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Promotional Event",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const Gap(20),
                                    Text(
                                      state.promotionalEvents[index].name,
                                      style: TextStyle(
                                          fontFamily: "KaiseiDecol",
                                          fontSize: 28),
                                    ),
                                    const Gap(20),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 40),
                                      child: Text(
                                        state.promotionalEvents[index]
                                            .description,
                                        textAlign: TextAlign.center,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : SizedBox(
                        height: 380,
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: SizedBox(
                                width:
                                    (MediaQuery.of(context).size.width - 440) *
                                        0.7,
                                height: 380,
                                child: Image.network(
                                  state.promotionalEvents[index].url,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                width:
                                    (MediaQuery.of(context).size.width - 440) *
                                        0.45,
                                height: 280,
                                decoration: BoxDecoration(
                                  border: Border.all(width: 1),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black
                                          .withOpacity(0.2), // Shadow color
                                      spreadRadius: 3, // Spread radius
                                      blurRadius: 4, // Blur radius
                                      offset: const Offset(
                                          2, 3), // Offset of the shadow
                                    ),
                                  ],
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Promotional Event",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const Gap(20),
                                    Text(
                                      state.promotionalEvents[index].name,
                                      style: TextStyle(
                                          fontFamily: "KaiseiDecol",
                                          fontSize: 28),
                                    ),
                                    const Gap(20),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 40),
                                      child: Text(
                                        state.promotionalEvents[index]
                                            .description,
                                        textAlign: TextAlign.center,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                itemCount: state.promotionalEvents.length,
                separatorBuilder: (context, index) => const Gap(110),
              );
            } else if (state is PromotionalEventsError) {
              return Center(
                child: Text(state.message),
              );
            } else {
              return SizedBox();
            }
          },
        ));
  }

  Widget upcomingEventsSession() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Up-Coming Events",
              style: TextStyle(fontFamily: "KaiseiDecol", fontSize: 40),
            ),
            const Gap(20),
            SizedBox(
              width: 500,
              child: Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the ypesetting industry. Lorem Ipsum has been the",
              ),
            ),
            const Gap(40),
            SizedBox(
                width: 500,
                height: 350,
                child: BlocBuilder<UpcomingEventsBloc, UpcomingEventsStates>(
                  builder: (context, state) {
                    if (state is UpcomingEventsLoading) {
                      return Center(child: CupertinoActivityIndicator());
                    } else if (state is UpcomingEventsLoaded) {
                      upcomingEvents = state.upcomingEvents;

                      return GridView.builder(
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 15,
                          mainAxisExtent: 80,
                        ),
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            setState(() {
                              currentIndex = index;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    currentIndex == index ? 12 : 0)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  currentIndex == index ? 12 : 0),
                              child: Image.network(
                                state.upcomingEvents[index].url,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        itemCount: state.upcomingEvents.length,
                      );
                    } else if (state is UpcomingEventsError) {
                      return Center(
                        child: Text(state.message),
                      );
                    } else {
                      return SizedBox();
                    }
                  },
                ))
          ],
        ),
        const Gap(100),
        Container(
            width: 500,
            height: 500,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2), // Shadow color
                  spreadRadius: 3, // Spread radius
                  blurRadius: 4, // Blur radius
                  offset: const Offset(2, 3), // Offset of the shadow
                ),
              ],
            ),
            child: BlocBuilder<UpcomingEventsBloc, UpcomingEventsStates>(
              builder: (context, state) {
                if (state is UpcomingEventsLoaded) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        upcomingEvents[currentIndex].url,
                        width: double.infinity,
                        height: 300,
                        fit: BoxFit.fill,
                      ),
                      const Gap(30),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          upcomingEvents[currentIndex].name,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Gap(20),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          upcomingEvents[currentIndex].description,
                        ),
                      )
                    ],
                  );
                } else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        eventPlaceHolder.url,
                        width: double.infinity,
                        height: 300,
                        fit: BoxFit.fill,
                      ),
                      const Gap(30),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          eventPlaceHolder.name,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Gap(20),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          eventPlaceHolder.description,
                        ),
                      )
                    ],
                  );
                }
              },
            ))
      ],
    );
  }
}
