// ignore_for_file: deprecated_member_use

import 'package:ai_solution/BLoC/feedback/feedback_bloc.dart';
import 'package:ai_solution/BLoC/feedback/feedback_events.dart';
import 'package:ai_solution/BLoC/feedback/feeeback_states.dart';
import 'package:ai_solution/constant/colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:shimmer/shimmer.dart';

class FeedbackAndRatingPanel extends StatefulWidget {
  const FeedbackAndRatingPanel({super.key});

  @override
  State<FeedbackAndRatingPanel> createState() => _FeedbackAndRatingPanelState();
}

class _FeedbackAndRatingPanelState extends State<FeedbackAndRatingPanel> {
  late final feedbackBloc = context.read<FeedbackFetchingBloc>();
  late final ratingBloc = context.read<RatingFetchingBloc>();

  bool selectAll = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(left: 50, right: 60),
          width: MediaQuery.of(context).size.width * 1 - 70,
          height: 50,
          color: const Color.fromRGBO(34, 34, 34, 1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Checkbox(
                value: selectAll,
                onChanged: (value) {
                  setState(() {
                    selectAll = !selectAll;
                  });
                },
                activeColor: kPrimaryColor,
                focusColor: Colors.white,
                side: BorderSide(color: kPrimaryColor),
              ),
              const Gap(5),
              Padding(
                padding: const EdgeInsets.only(top: 1),
                child: Text(
                  "Select All",
                  style: TextStyle(
                      color: kPrimaryColor, fontWeight: FontWeight.w500),
                ),
              ),
              const Gap(60),
              Container(
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
                      "Delete",
                      style: TextStyle(color: kPrimaryColor, fontSize: 13),
                    ),
                    const Gap(10)
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 1 - 70,
          height: MediaQuery.of(context).size.height * 1 - 50,
          padding: EdgeInsets.only(top: 30, left: 60, right: 60),
          child: ListView(
            children: [
              Row(
                children: [
                  Text(
                    "Ratings",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: IconButton(
                        onPressed: () {
                          ratingBloc.add(FetchRatings());
                        },
                        icon: Icon(Icons.refresh_sharp)),
                  )
                ],
              ),
              const Divider(
                height: 80,
                thickness: 0.8,
              ),
              BlocBuilder<RatingFetchingBloc, RatingStates>(
                builder: (context, state) {
                  if (state is RatingLoading) {
                    return shimmerLoadingCurrentSolutions();
                  } else if (state is RatingError) {
                    return Center(
                      child: Text(state.message),
                    );
                  } else if (state is RatingLoaded) {
                    return SizedBox(
                      height: 105,
                      width: MediaQuery.of(context).size.width * 1 - 70,
                      child: ListView.separated(
                        separatorBuilder: (context, index) => const Gap(55),
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () {},
                          child: Container(
                            margin: EdgeInsets.only(top: 7,bottom: 7, left: 6),
                            padding: EdgeInsets.all(5),
                            height: 250,
                            width: 200,
                            decoration: BoxDecoration(
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
                                borderRadius: BorderRadius.circular(8)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 40,
                                      height: 40,
                                      child: Image.network(
                                        "https://th.bing.com/th/id/OIP.Ii15573m21uyos5SZQTdrAHaHa?rs=1&pid=ImgDetMain",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    const Gap(10),
                                    Text(
                                      state.rating[index].name.length >= 10
                                          ? "${state.rating[index].name.substring(0, 10)} ..."
                                          : state.rating[index].name,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 5),
                                  width: 200,
                                  height: 40,
                                  child: ListView.separated(
                                      scrollDirection: Axis.horizontal,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) => Icon(
                                            Icons.star,
                                            color: Colors.amberAccent,
                                          ),
                                      separatorBuilder: (context, index) =>
                                          const Gap(10),
                                      itemCount: state.rating[index].rate),
                                )
                              ],
                            ),
                          ),
                        ),
                        itemCount: state.rating.length,
                      ),
                    );
                  } else {
                    return SizedBox();
                  }
                },
              ),
              const Gap(60),
              Row(
                children: [
                  Text(
                    "Feedbacks",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: IconButton(
                        onPressed: () {
                          feedbackBloc.add(FetchFeedbacks());
                        },
                        icon: Icon(Icons.refresh_sharp)),
                  )
                ],
              ),
              const Divider(
                height: 80,
                thickness: 0.8,
              ),
              BlocBuilder<FeedbackFetchingBloc, FeedbackStates>(
                builder: (context, state) {
                  if (state is FeedbackLoading) {
                    return shimmerLoadingFeedbacks();
                  } else if (state is FeedbackError) {
                    return Center(
                      child: Text(state.message),
                    );
                  } else if (state is FeedbackLoaded) {
                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5,
                        mainAxisSpacing: 50,
                        crossAxisSpacing: 40,
                        mainAxisExtent:
                            MediaQuery.of(context).size.height * 0.25,
                      ),
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black
                                    .withOpacity(0.2), // Shadow color
                                spreadRadius: 3, // Spread radius
                                blurRadius: 4, // Blur radius
                                offset:
                                    const Offset(2, 3), // Offset of the shadow
                              ),
                            ],
                            borderRadius: BorderRadius.circular(8)
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 80,
                                height: 80,
                                child: Image.network(
                                  "https://th.bing.com/th/id/OIP.Ii15573m21uyos5SZQTdrAHaHa?rs=1&pid=ImgDetMain",
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const Gap(25),
                              Text(
                                state.feedback[index].name,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              const Gap(15),
                              Text(
                                state.feedback[index].body.length >= 45
                                    ? "${state.feedback[index].body.substring(0, 45)} ...."
                                    : state.feedback[index].body,
                                
                              )
                            ],
                          ),
                        ),
                      ),
                      itemCount: state.feedback.length,
                    );
                  } else {
                    return SizedBox();
                  }
                },
              )
            ],
          ),
        )
      ],
    );
  }

  Widget shimmerLoadingFeedbacks() {
    return Shimmer.fromColors(
      baseColor: Colors.black26,
      highlightColor: Colors.white,
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          mainAxisSpacing: 50,
          crossAxisSpacing: 40,
          mainAxisExtent: MediaQuery.of(context).size.height * 0.4,
        ),
        itemBuilder: (context, index) => Container(
          color: Colors.black26,
        ),
        itemCount: 10,
      ),
    );
  }

  Widget shimmerLoadingCurrentSolutions() {
    return Shimmer.fromColors(
      baseColor: Colors.black26,
      highlightColor: Colors.white,
      child: SizedBox(
        height: 90,
        width: MediaQuery.of(context).size.width * 1 - 70,
        child: ListView.separated(
          separatorBuilder: (context, index) => const Gap(60),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => Container(
            height: 250,
            width: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), color: Colors.black26),
          ),
          itemCount: 10,
        ),
      ),
    );
  }
}
