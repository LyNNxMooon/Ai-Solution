import 'package:ai_solution/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        const Gap(30),
        headerSession(),
        const Gap(100),
        gallerySession(),
        const Gap(120)
      ],
    );
  }

  Widget gallerySession() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Company's Gallery",
          style: TextStyle(fontSize: 34, fontWeight: FontWeight.w600),
        ),
        const Gap(40),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.3,
          child: Text(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dumm Lorem Ipsum is simply",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
        ),
        const Gap(100),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 120),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 50,
              crossAxisSpacing: 40,
              mainAxisExtent: MediaQuery.of(context).size.height * 0.5,
            ),
            itemBuilder: (context, index) => Container(
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
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.35,
                    color: kMessageBubbleColor,
                  ),
                  const Gap(25),
                  Text(
                    "Gallery Name",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const Gap(10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60),
                    child: Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
            itemCount: 12,
          ),
        )
      ],
    );
  }

  Widget headerSession() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 80),
      color: Colors.black,
      width: double.infinity,
      height: 420,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: Image.asset(
                "assets/images/header.png",
                fit: BoxFit.fill,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              margin: EdgeInsets.all(40),
              width: MediaQuery.of(context).size.width * 0.3,
              decoration: BoxDecoration(
                //border: Border.all(width: 1),
                color: const Color.fromARGB(255, 255, 255, 255),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey, // Shadow color
                    spreadRadius: 3, // Spread radius
                    blurRadius: 4, // Blur radius
                    offset: const Offset(2, 3), // Offset of the shadow
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Our Features",
                    style: TextStyle(fontFamily: "KaiseiDecol", fontSize: 38),
                  ),
                  const Gap(30),
                  Text(
                    "Keep in Touch!",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const Gap(40),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60),
                    child: Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dumm Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dumm",
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
