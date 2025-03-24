// ignore_for_file: deprecated_member_use

import 'package:ai_solution/BLoC/current_solutions/current_solutions_bloc.dart';
import 'package:ai_solution/BLoC/current_solutions/current_solutions_events.dart';
import 'package:ai_solution/BLoC/current_solutions/current_solutions_states.dart';
import 'package:ai_solution/constant/colors.dart';
import 'package:ai_solution/data/vos/current_solution_vo.dart';
import 'package:ai_solution/utils/navigation_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:shimmer/shimmer.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class CurrentSolutionPanel extends StatefulWidget {
  const CurrentSolutionPanel({super.key});

  @override
  State<CurrentSolutionPanel> createState() => _CurrentSolutionPanelState();
}

class _CurrentSolutionPanelState extends State<CurrentSolutionPanel> {
  late final currentSolutionBloc = context.read<CurrentSolutionsBloc>();
  late final addCurrentSolutionBloc = context.read<AddCurrentSolutionsBloc>();
  late final updateCurrentSolutionBloc =
      context.read<UpdateCurrentSolutionsBloc>();

  final _nameController = TextEditingController();
  final _bodyController = TextEditingController();
  bool selectAll = false;

  @override
  void dispose() {
    _nameController.dispose();
    _bodyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(left: 15),
          width: MediaQuery.of(context).size.width * 1 - 70,
          height: 50,
          color: const Color.fromRGBO(34, 34, 34, 1),
          child: Row(
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
                    "Current Solutions",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: IconButton(
                        onPressed: () {
                          currentSolutionBloc.add(FetchCurrentSolutions());
                        },
                        icon: Icon(Icons.refresh_sharp)),
                  )
                ],
              ),
              const Divider(
                height: 80,
                thickness: 0.8,
              ),
              BlocBuilder<CurrentSolutionsBloc, CurrentSolutionsStates>(
                builder: (context, state) {
                  if (state is CurrentSolutionsLoading) {
                    return shimmerLoadingCurrentSolutions();
                  } else if (state is CurrentSolutionsError) {
                    return Center(
                      child: Text(state.message),
                    );
                  } else if (state is CurrentSolutionsLoaded) {
                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5,
                        mainAxisSpacing: 50,
                        crossAxisSpacing: 40,
                        mainAxisExtent:
                            MediaQuery.of(context).size.height * 0.4,
                      ),
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => detailedSolutionWidget(
                                state.currentSolutions[index]),
                          );
                        },
                        child: Container(
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
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                width: double.infinity,
                                height:
                                    MediaQuery.of(context).size.height * 0.25,
                                child: Image.network(
                                  state.currentSolutions[index].url,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const Gap(25),
                              Text(
                                state.currentSolutions[index].name,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              const Gap(15),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 50),
                                child: Text(
                                  state.currentSolutions[index].description
                                              .length >=
                                          45
                                      ? "${state.currentSolutions[index].description.substring(0, 45)} ...."
                                      : state
                                          .currentSolutions[index].description,
                                  textAlign: TextAlign.center,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      itemCount: state.currentSolutions.length,
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

  Widget detailedSolutionWidget(CurrentSolutionVO solution) {
    _nameController.text = solution.name;
    _bodyController.text = solution.description;
    return AlertDialog(
      contentPadding: EdgeInsets.all(0),
      content: Material(
        elevation: 8,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: 600,
          height: 650,
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
                  width: 200,
                  height: 200,
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
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  hintText: "Current Solution Name",
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
                controller: _bodyController,
                maxLines: 8,
                decoration: InputDecoration(
                  hintText: "Description...",
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
              BlocConsumer<AddCurrentSolutionsBloc, AddCurrentSolutionStates>(
                builder: (context, state) {
                  if (state is AddCurrentSolutionLoading) {
                    return Center(child: CupertinoActivityIndicator());
                  } else {
                    return Center(
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  WidgetStatePropertyAll(kMessageBubbleColor),
                              foregroundColor:
                                  WidgetStatePropertyAll(kFourthColor)),
                          onPressed: () {
                            addCurrentSolutionBloc.add(AddCurrentSolution(
                                description: _bodyController.text,
                                name: _nameController.text,
                                url: solution.url));
                          },
                          child: Text("Update")),
                    );
                  }
                },
                listener: (context, state) {
                  if (state is AddCurrentSolutionError) {
                    showTopSnackBar(
                      Overlay.of(context),
                      CustomSnackBar.error(
                        message: state.message,
                      ),
                    );
                  }

                  if (state is CurrentSolutionAdded) {
                    currentSolutionBloc.add(FetchCurrentSolutions());
                    context.navigateBack();
                    showTopSnackBar(
                      Overlay.of(context),
                      CustomSnackBar.success(
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
    );
  }

  Widget shimmerLoadingCurrentSolutions() {
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
}
