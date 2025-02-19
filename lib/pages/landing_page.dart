import 'package:ai_solution/BLoC/clients/client_bloc.dart';
import 'package:ai_solution/BLoC/clients/client_states.dart';
import 'package:ai_solution/constant/colors.dart';
import 'package:ai_solution/constant/images.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        const Gap(70),
        sliderSession(),
        const Gap(100),
        ourClientsSession(context),
        const Gap(80),
        currentSolutionSession(context),
        const Gap(80),
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
      ],
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
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
      ),
    );
  }
}
