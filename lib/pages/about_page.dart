import 'package:ai_solution/constant/colors.dart';
import 'package:ai_solution/utils/navigation_extension.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  List<bool> rates = <bool>[false, false, false, false, false];
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
          ratings(),
          const Gap(120)
        ],
      ),
    );
  }

  Widget ratings() {
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
                    return AlertDialog(
                      contentPadding: EdgeInsets.all(0),
                      content: feedbackDialog(),
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

  Widget feedbackDialog() {
    return Material(
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Feedback",
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
            const Gap(20),
            Center(
              child: SizedBox(
                height: 40,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => IconButton(
                        onPressed: () {
                          setState(() {
                            rates[index] = !rates[index];
                          });
                        },
                        icon: rates[index]
                            ? const Icon(
                                Icons.star,
                                color: kRateColor,
                              )
                            : const Icon(Icons.star_border)),
                    separatorBuilder: (context, index) => const Gap(0),
                    itemCount: rates.length),
              ),
            ),
            const Gap(20),
            Divider(),
            TextField(
              decoration: InputDecoration(
                hintText: "What's your name?",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: kFourthColor)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: kFourthColor)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: kFourthColor)),
              ),
            ),
            const Gap(15),

            TextField(
              // minLines: 2,
              maxLines: 10,
              decoration: InputDecoration(
                hintText: "Type a feed back...",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: kFourthColor)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: kFourthColor)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: kFourthColor)),
                // suffixIcon: Icon(Icons.send),
              ),
            ),
            const Gap(30),
            Center(
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll(kMessageBubbleColor),
                      foregroundColor: WidgetStatePropertyAll(kFourthColor)),
                  onPressed: () {},
                  child: Text("Post")),
            )
          ],
        ),
      ),
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
