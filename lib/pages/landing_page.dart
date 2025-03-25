import 'package:ai_solution/BLoC/clients/client_bloc.dart';
//import 'package:ai_solution/BLoC/clients/client_events.dart';
import 'package:ai_solution/BLoC/clients/client_states.dart';
import 'package:ai_solution/BLoC/current_solutions/current_solutions_bloc.dart';
import 'package:ai_solution/BLoC/current_solutions/current_solutions_states.dart';
import 'package:ai_solution/BLoC/previous_solutions/previous_solutions_bloc.dart';
import 'package:ai_solution/BLoC/previous_solutions/previous_solutions_states.dart';
import 'package:ai_solution/constant/colors.dart';
import 'package:ai_solution/constant/images.dart';
import 'package:ai_solution/data/vos/client_vo.dart';
import 'package:ai_solution/data/vos/current_solution_vo.dart';
import 'package:ai_solution/data/vos/previous_solution_vo.dart';
import 'package:ai_solution/utils/navigation_extension.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  List<ClientVO> clientList = [];

  @override
  Widget build(BuildContext context) {
    return ListView(shrinkWrap: true, children: [
      const Gap(100),
      sliderSession(),
      const Gap(120),
      ourClientsSession(context),
      const Gap(100),
      currentSolutionSession(context),
      const Gap(100),
      previousSolutionSession(context),
      const Gap(120),
    ]);
  }

  Widget cardVideoPlayer(
      PreviousSolutionVO previousSolution, BuildContext context) {
    //final clientBloc = context.read<ClientDetailsBloc>();
    final controller = YoutubePlayerController.fromVideoId(
      videoId: previousSolution.url,
      autoPlay: false,
      params: const YoutubePlayerParams(
        showFullscreenButton: true,
        loop: true,
      ),
    );
    //clientBloc.add(FetchClientByID(id: "${previousSolution.clientID}"));
    return Container(
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
          children: [
            SizedBox(
              width: double.infinity,
              height: 240,
              child: YoutubePlayer(controller: controller),
            ),
            const Gap(20),
            SizedBox(
              width: double.infinity,
              child: Center(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            (clientList.firstWhere((element) =>
                                element.id == previousSolution.clientID)).url,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      // BlocBuilder<ClientDetailsBloc, ClientDetailStates>(
                      //   builder: (context, state) {
                      //     if (state is LoadingClientImageByID) {
                      //       return CupertinoActivityIndicator();
                      //     } else if (state is LoadedClientImageByID) {
                      //       return
                      //     } else if (state is ErrorLoadingClientImageByID) {
                      //       return Container(
                      //         width: 40,
                      //         height: 40,
                      //         decoration: BoxDecoration(
                      //             borderRadius: BorderRadius.circular(20),
                      //             color: Colors.black),
                      //       );
                      //     } else {
                      //       return SizedBox();
                      //     }
                      //   },
                      // ),
                      const Gap(10),
                      Text(
                        previousSolution.name,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Gap(10),
            SizedBox(
              height: 40,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        previousSolution.description,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }

  Widget previousSolutionSession(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Previous Solutions",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
        ),
        const Gap(60),
        BlocBuilder<PreviousSolutionsBloc, PreviousSolutionsStates>(
          builder: (context, state) {
            if (state is PreviousSolutionsLoading) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 200),
                child: CupertinoActivityIndicator(),
              );
            } else if (state is PreviousSolutionsLoaded) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 150),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 30,
                    crossAxisSpacing: 30,
                    mainAxisExtent: 380,
                  ),
                  itemBuilder: (context, index) =>
                      cardVideoPlayer(state.previousSolutions[index], context),
                  itemCount: state.previousSolutions.length,
                ),
              );
            } else if (state is PreviousSolutionsError) {
              return Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text(state.message));
            } else {
              return SizedBox();
            }
          },
        )
      ],
    );
  }

  Widget currentSolutionSession(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Current Solutions",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
        ),
        const Gap(60),
        BlocBuilder<CurrentSolutionsBloc, CurrentSolutionsStates>(
          builder: (context, state) {
            if (state is CurrentSolutionsLoading) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 200),
                child: CupertinoActivityIndicator(),
              );
            } else if (state is CurrentSolutionsLoaded) {
              return Center(
                  child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 100),
                      height: 355,
                      child: ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return detailedSolutionWidget(
                                          state.currentSolutions[index]);
                                    },
                                  );
                                },
                                child: Container(
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  width: 260,
                                  decoration: BoxDecoration(
                                    color: kBtnGrayColor,
                                    borderRadius: BorderRadius.circular(7),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        height: 220,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(7),
                                                topRight: Radius.circular(7))),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(7),
                                            topRight: Radius.circular(7),
                                          ),
                                          child: Image.network(
                                            state.currentSolutions[index].url,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      const Gap(10),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15),
                                        child: Text(
                                          state.currentSolutions[index].name,
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      const Gap(15),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15),
                                        child: Text(
                                          state.currentSolutions[index]
                                                      .description.length >=
                                                  60
                                              ? "${state.currentSolutions[index].description.substring(0, 60)} ...."
                                              : state.currentSolutions[index]
                                                  .description,
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                          separatorBuilder: (context, index) => const Gap(140),
                          itemCount: state.currentSolutions.length)));
            } else if (state is CurrentSolutionsError) {
              return Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text(state.message));
            } else {
              return SizedBox();
            }
          },
        )
      ],
    );
  }

  Widget detailedSolutionWidget(CurrentSolutionVO solution) {
    return AlertDialog(
      contentPadding: EdgeInsets.all(1),
      content: Material(
        elevation: 8,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: 800,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListView(
            shrinkWrap: true,
            children: [
              // Chat Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(solution.name,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      context.navigateBack();
                    },
                  ),
                ],
              ),

              Divider(),

              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  width: 300,
                  height: 300,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      solution.url,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              Divider(),
              const Gap(10),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                decoration: BoxDecoration(
                    border: Border.all(width: 0.5),
                    borderRadius: BorderRadius.circular(7)),
                child: Text(solution.description),
              ),
              const Gap(30)
            ],
          ),
        ),
      ),
    );
  }

  Widget ourClientsSession(BuildContext context) {
    //final clientBloc = context.read<ClientBloc>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Our Clients",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
        ),
        const Gap(10),
        Text(
          "We have been working with some 500+ clients",
          // style: TextStyle(fontSize: 18),
        ),
        const Gap(40),
        BlocBuilder<ClientBloc, ClientStates>(builder: (context, state) {
          if (state is ClientsLoading) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: CupertinoActivityIndicator(),
            );
          } else if (state is ClientsLoaded) {
            clientList = state.clients;
            return SizedBox(
              height: 55,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.18),
                child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Image.network(
                          state.clients[index].url,
                          width: 65,
                          fit: BoxFit.fill,
                        ),
                    separatorBuilder: (context, index) => const Gap(120),
                    itemCount: state.clients.length),
              ),
            );
          } else if (state is ClientsError) {
            return Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Text(state.message));
          } else {
            return SizedBox();
          }
        }),
      ],
    );
  }

  Widget sliderSession() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Software Solutions",
              style: TextStyle(fontFamily: "KaiseiDecol", fontSize: 45),
            ),
            const Gap(10),
            SizedBox(
              width: 400,
              child: Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the",
              ),
            ),
            const Gap(20),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                      const Color.fromARGB(255, 237, 232, 232)),
                  foregroundColor: WidgetStatePropertyAll(kFourthColor)),
              onPressed: () {},
              child: Text("Get Started"),
            )
          ],
        ),
        const Gap(140),
        SizedBox(
          width: 420,
          height: 250,
          child: CarouselSlider.builder(
              itemCount: carousalMockUps.length,
              itemBuilder: (context, index, realIndex) => ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    carousalMockUps[index],
                    fit: BoxFit.fill,
                  )),
              options: CarouselOptions(
                reverse: true,
                autoPlay: true,
                viewportFraction: 0.95,
                initialPage: 0,
                enableInfiniteScroll: true,
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.7,
                scrollDirection: Axis.horizontal,
              )),
        )
      ],
    );
  }
}
