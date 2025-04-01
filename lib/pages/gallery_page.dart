import 'package:ai_solution/BLoC/gallery/gallery_bloc.dart';
import 'package:ai_solution/BLoC/gallery/galllery_states.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:shimmer/shimmer.dart';

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

  Widget shimmerLoadingForGallery() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 120),
      child: Shimmer.fromColors(
        baseColor: Colors.black26,
        highlightColor: Colors.white,
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
            color: Colors.black26,
          ),
          itemCount: 12,
        ),
      ),
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
            "At AI-Solution, we believe in transparency, creativity, and the power of visual storytelling. Explore our photo galleries to witness the people, projects, and moments",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
        ),
        const Gap(100),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 120),
            child: BlocBuilder<GalleryBloc, GalleryStates>(
              builder: (context, state) {
                if (state is GalleryLoading) {
                  return shimmerLoadingForGallery();
                } else if (state is GalleryLoaded) {
                  return GridView.builder(
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
                            color:
                                Colors.black.withOpacity(0.2), // Shadow color
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
                            height: MediaQuery.of(context).size.height * 0.35,
                            child: Image.network(
                              state.galleries[index].url,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const Gap(25),
                          Text(
                            state.galleries[index].name,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          const Gap(10),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 60),
                            child: Text(
                              state.galleries[index].description,
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                    ),
                    itemCount: state.galleries.length,
                  );
                } else if (state is GalleryError) {
                  return Center(
                    child: Text(state.message),
                  );
                } else {
                  return SizedBox();
                }
              },
            ))
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
                      "At AI-Solution, we specialize in crafting intuitive tools and tailored software solutions that simplify operations, empower decision-making, and drive growth. From smart inquiry forms to end-to-end software development, we turn complexity into clarity",
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
