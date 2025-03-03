import 'package:ai_solution/BLoC/feedback/feedback_bloc.dart';
import 'package:ai_solution/BLoC/feedback/feedback_events.dart';
import 'package:ai_solution/BLoC/feedback/feeeback_states.dart';
import 'package:ai_solution/constant/colors.dart';
import 'package:ai_solution/utils/navigation_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  List<bool> rates = <bool>[false, false, false, false, false];

  final _userNameController = TextEditingController();
  final _feedbackController = TextEditingController();

  int rateCalculation() {
    int rateNumber = 0;
    for (bool isRated in rates) {
      if (isRated) {
        rateNumber++;
      }
    }

    return rateNumber;
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _feedbackController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        shrinkWrap: true,
        children: [
          const Gap(20),
          aboutUsVideo(),
          const Gap(80),
          customerFeedBacks(),
          const Gap(120),
          ratings(context),
          const Gap(120)
        ],
      ),
    );
  }

  Widget ratings(BuildContext context) {
    final feedbackBloc = context.read<FeedbackAndRatingBloc>();
    return Column(
      children: [
        Text(
          "Ratings",
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
        ),
        const Gap(50),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          child: Text(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to ",
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
        ),
        const Gap(80),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 120),
          child: Center(
            child: SizedBox(
              height: 50,
              child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Container(
                        width: 130,
                        // decoration: BoxDecoration(
                        //     border: Border.all(width: 1),
                        //     borderRadius: BorderRadius.circular(5)),
                        decoration: BoxDecoration(
                          //border: Border.all(width: 1),
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
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.star,
                              color: kRateColor,
                              size: 30,
                            ),
                            const Gap(10),
                            Text(
                              "x",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const Gap(10),
                            Text(
                              "5",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w300),
                            )
                          ],
                        ),
                      ),
                  separatorBuilder: (context, index) => const Gap(40),
                  itemCount: 8),
            ),
          ),
        ),
        const Gap(100),
        Padding(
          padding: const EdgeInsets.only(left: 125),
          child: Align(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return StatefulBuilder(
                      builder: (context, setState) => AlertDialog(
                        contentPadding: EdgeInsets.all(0),
                        content: Material(
                          elevation: 8,
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            width: 500,
                            height: 600,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              children: [
                                // Chat Header
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Feedback",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18)),
                                    IconButton(
                                      icon: Icon(Icons.close),
                                      onPressed: () {
                                        context.navigateBack();
                                      },
                                    ),
                                  ],
                                ),
                                Divider(),
                                const Gap(20),
                                Center(
                                  child: SizedBox(
                                    height: 40,
                                    child: ListView.separated(
                                        scrollDirection: Axis.horizontal,
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemBuilder: (context, index) =>
                                            IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    rates[index] =
                                                        !rates[index];
                                                  });
                                                },
                                                icon: rates[index]
                                                    ? const Icon(
                                                        Icons.star,
                                                        color: kRateColor,
                                                      )
                                                    : const Icon(
                                                        Icons.star_border)),
                                        separatorBuilder: (context, index) =>
                                            const Gap(0),
                                        itemCount: rates.length),
                                  ),
                                ),
                                const Gap(20),
                                Divider(),
                                TextField(
                                  controller: _userNameController,
                                  decoration: InputDecoration(
                                    hintText: "What's your name?",
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide:
                                            BorderSide(color: kFourthColor)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide:
                                            BorderSide(color: kFourthColor)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide:
                                            BorderSide(color: kFourthColor)),
                                  ),
                                ),
                                const Gap(15),

                                TextField(
                                  // minLines: 2,
                                  controller: _feedbackController,
                                  maxLines: 10,
                                  decoration: InputDecoration(
                                    hintText: "Type a feed back...",
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide:
                                            BorderSide(color: kFourthColor)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide:
                                            BorderSide(color: kFourthColor)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide:
                                            BorderSide(color: kFourthColor)),
                                    // suffixIcon: Icon(Icons.send),
                                  ),
                                ),
                                const Gap(30),
                                BlocConsumer<FeedbackAndRatingBloc,
                                    FeedbackAndRatingStates>(
                                  builder: (context, state) {
                                    if (state is FeedbackAndRatingLoading) {
                                      return Center(
                                        child: CupertinoActivityIndicator(),
                                      );
                                    } else {
                                      return Center(
                                        child: ElevatedButton(
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    WidgetStatePropertyAll(
                                                        kMessageBubbleColor),
                                                foregroundColor:
                                                    WidgetStatePropertyAll(
                                                        kFourthColor)),
                                            onPressed: () {
                                              feedbackBloc.add(
                                                  SubmitFeedbackAndRating(
                                                      name: _userNameController
                                                          .text,
                                                      body: _feedbackController
                                                          .text,
                                                      rate: rateCalculation()));
                                            },
                                            child: Text("Post")),
                                      );
                                    }
                                  },
                                  listener: (context, state) {
                                    if (state is FeedbackAndRatingSubmitted) {
                                      showTopSnackBar(
                                        Overlay.of(context),
                                        CustomSnackBar.success(
                                          message: state.message,
                                        ),
                                      );

                                      _userNameController.clear();
                                      _feedbackController.clear();
                                      setState(() {
                                        rates = [
                                          false,
                                          false,
                                          false,
                                          false,
                                          false
                                        ];
                                      });
                                    }

                                    if (state is FeedbackAndRatingError) {
                                      showTopSnackBar(
                                        Overlay.of(context),
                                        CustomSnackBar.error(
                                          message: state.message,
                                        ),
                                      );
                                    }
                                  },
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
              child: Container(
                width: 300,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Center(
                  child: Text(
                    "Rate Us",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget customerFeedBacks() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 120),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Customer Feedbacks",
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
          ),
          const Gap(120),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 60,
                crossAxisSpacing: 120,
                mainAxisExtent: 200,
              ),
              itemBuilder: (context, index) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Sample Feedback",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const Gap(20),
                  Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummyLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy"),
                  const Gap(30),
                  ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          side: WidgetStatePropertyAll(
                              BorderSide(width: 1, color: kFourthColor)),
                          backgroundColor: WidgetStatePropertyAll(Colors.white),
                          foregroundColor:
                              WidgetStatePropertyAll(kFourthColor)),
                      child: Text("Learn More"))
                ],
              ),
              itemCount: 4,
            ),
          )
        ],
      ),
    );
  }

  Widget aboutUsVideo() {
    final controller = YoutubePlayerController.fromVideoId(
      videoId: "DZLlw5BNQ3g",
      autoPlay: false,
      params: const YoutubePlayerParams(
        showFullscreenButton: true,
        loop: true,
      ),
    );
    return SizedBox(
      width: double.infinity,
      height: 450,
      child: YoutubePlayer(controller: controller),
    );
  }
}


/*
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  // Function to show the dialog
  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            // State change happens within the builder
            String _dialogMessage = "Initial Message";

            return AlertDialog(
              title: Text('Change Dialog Content'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(_dialogMessage),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _dialogMessage = "Updated Message!";
                      });
                    },
                    child: Text('Change Message'),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Close'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Stateful AlertDialog")),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _showDialog(context),
          child: Text('Open Dialog'),
        ),
      ),
    );
  }
}

*/