import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({super.key});

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        const Gap(100),
        upcomingEventsSession(),
        const Gap(140),
        promotionalEventSession(),
        const Gap(200),
      ],
    );
  }

  Widget promotionalEventSession() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 220),
      child: ListView.separated(
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
                        width: (MediaQuery.of(context).size.width - 440) * 0.7,
                        height: 380,
                        child: Image.network(
                          "https://cdn.prod.website-files.com/660aa0984e7024f991719a87/66be3d390f61cfa425c6642b_66be3d302a0a3358af84c984_1718905562414.jpeg",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: (MediaQuery.of(context).size.width - 440) * 0.45,
                        height: 280,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color:
                                  Colors.black.withOpacity(0.2), // Shadow color
                              spreadRadius: 3, // Spread radius
                              blurRadius: 4, // Blur radius
                              offset:
                                  const Offset(2, 3), // Offset of the shadow
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
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const Gap(20),
                            Text(
                              "Promotional Event",
                              style: TextStyle(
                                  fontFamily: "KaiseiDecol", fontSize: 28),
                            ),
                            const Gap(20),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 40),
                              child: Text(
                                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the ypesetting industry. Lorem Ipsum has been the"),
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
                        width: (MediaQuery.of(context).size.width - 440) * 0.7,
                        height: 380,
                        child: Image.network(
                          "https://cdn.prod.website-files.com/660aa0984e7024f991719a87/66be3d390f61cfa425c6642b_66be3d302a0a3358af84c984_1718905562414.jpeg",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        width: (MediaQuery.of(context).size.width - 440) * 0.45,
                        height: 280,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color:
                                  Colors.black.withOpacity(0.2), // Shadow color
                              spreadRadius: 3, // Spread radius
                              blurRadius: 4, // Blur radius
                              offset:
                                  const Offset(2, 3), // Offset of the shadow
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
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const Gap(20),
                            Text(
                              "Promotional Event",
                              style: TextStyle(
                                  fontFamily: "KaiseiDecol", fontSize: 28),
                            ),
                            const Gap(20),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 40),
                              child: Text(
                                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the ypesetting industry. Lorem Ipsum has been the"),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
        itemCount: 2,
        separatorBuilder: (context, index) => const Gap(110),
      ),
    );
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
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 15,
                  mainAxisExtent: 80,
                ),
                itemBuilder: (context, index) => Container(
                  color: Colors.black,
                ),
                itemCount: 15,
              ),
            )
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  "https://cdn.prod.website-files.com/660aa0984e7024f991719a87/66be3d390f61cfa425c6642b_66be3d302a0a3358af84c984_1718905562414.jpeg",
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.fill,
                ),
                const Gap(30),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Event Title",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                const Gap(20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the ypesetting industry. Lorem Ipsum has been the",
                  ),
                )
              ],
            ))
      ],
    );
  }
}
