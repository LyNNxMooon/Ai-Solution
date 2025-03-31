// ignore_for_file: deprecated_member_use

import 'package:ai_solution/BLoC/current_solutions/current_solutions_states.dart';
import 'package:ai_solution/BLoC/previous_solutions/previous_solutions_bloc.dart';
import 'package:ai_solution/BLoC/previous_solutions/previous_solutions_events.dart';
import 'package:ai_solution/BLoC/previous_solutions/previous_solutions_states.dart';
import 'package:ai_solution/constant/colors.dart';

import 'package:ai_solution/data/vos/previous_solution_vo.dart';
import 'package:ai_solution/utils/navigation_extension.dart';
import 'package:ai_solution/widgets/confirmation_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:shimmer/shimmer.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class PreviousSolutionPanel extends StatefulWidget {
  const PreviousSolutionPanel({super.key});

  @override
  State<PreviousSolutionPanel> createState() => _PreviousSolutionPanelState();
}

class _PreviousSolutionPanelState extends State<PreviousSolutionPanel> {
  late final previousSolutionBloc = context.read<PreviousSolutionsBloc>();
  late final addPreviousSolutionBloc = context.read<AddPreviousSolutionsBloc>();
  late final updatePreviousSolutionBloc =
      context.read<UpdatePreviousSolutionsBloc>();
  late final deletePreviousSolutionBloc =
      context.read<DeletePreviousSolutionsBloc>();

  final _nameController = TextEditingController();
  final _bodyController = TextEditingController();
  final _newNameController = TextEditingController();
  final _newDescriptionController = TextEditingController();
  final _urlController = TextEditingController();

  final _cientController = TextEditingController();

  final _clientLogoController = TextEditingController();
  bool selectAll = false;

  @override
  void dispose() {
    _nameController.dispose();
    _bodyController.dispose();
    _newNameController.dispose();
    _newDescriptionController.dispose();
    _urlController.dispose();
    _cientController.dispose();
    _clientLogoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(left: 60, right: 60),
          width: MediaQuery.of(context).size.width * 1 - 70,
          height: 50,
          color: const Color.fromRGBO(34, 34, 34, 1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => addSolutionWidget(),
                  );
                },
                child: Container(
                  width: 160,
                  height: 30,
                  color: const Color.fromARGB(255, 64, 64, 64),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.create_new_folder_outlined,
                        color: kPrimaryColor,
                        size: 20,
                      ),
                      const Gap(10),
                      Text(
                        "Add New",
                        style: TextStyle(color: kPrimaryColor, fontSize: 13),
                      ),
                      const Gap(10)
                    ],
                  ),
                ),
              ),
              Row(
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
                    "Previous Solutions",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: IconButton(
                        onPressed: () {
                          previousSolutionBloc.add(FetchPreviousSolutions());
                        },
                        icon: Icon(Icons.refresh_sharp)),
                  )
                ],
              ),
              const Divider(
                height: 80,
                thickness: 0.8,
              ),
              BlocBuilder<PreviousSolutionsBloc, PreviousSolutionsStates>(
                builder: (context, state) {
                  if (state is PreviousSolutionsLoading) {
                    return shimmerLoadingCurrentSolutions();
                  } else if (state is PreviousSolutionsError) {
                    return Center(
                      child: Text(state.message),
                    );
                  } else if (state is PreviousSolutionsLoaded) {
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
                      itemBuilder: (context, index) {
                        final controllerForCard =
                            YoutubePlayerController.fromVideoId(
                          videoId: state.previousSolutions[index].url,
                          autoPlay: false,
                          params: const YoutubePlayerParams(
                            showFullscreenButton: true,
                            loop: true,
                          ),
                        );
                        return GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) => detailedSolutionWidget(
                                  state.previousSolutions[index]),
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
                                  offset: const Offset(
                                      2, 3), // Offset of the shadow
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                SizedBox(
                                    width: double.infinity,
                                    height: MediaQuery.of(context).size.height *
                                        0.25,
                                    child: YoutubePlayer(
                                        controller: controllerForCard)),
                                const Gap(25),
                                Text(
                                  state.previousSolutions[index].name,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Gap(15),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 50),
                                  child: Text(
                                    state.previousSolutions[index].description
                                                .length >=
                                            45
                                        ? "${state.previousSolutions[index].description.substring(0, 45)} ...."
                                        : state.previousSolutions[index]
                                            .description,
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: state.previousSolutions.length,
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

  Widget detailedSolutionWidget(PreviousSolutionVO solution) {
    _nameController.text = solution.name;
    _bodyController.text = solution.description;
    final controller = YoutubePlayerController.fromVideoId(
      videoId: solution.url,
      autoPlay: false,
      params: const YoutubePlayerParams(
        showFullscreenButton: true,
        loop: true,
      ),
    );
    return AlertDialog(
      contentPadding: EdgeInsets.all(0),
      content: Material(
        elevation: 8,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: 600,
          height: 765,
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
                    width: 600,
                    height: 300,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: YoutubePlayer(controller: controller)),
              ),

              Divider(),
              const Gap(10),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  hintText: "Previous Solution Name",
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BlocConsumer<UpdatePreviousSolutionsBloc,
                      UpdatePreviousSolutionStates>(
                    builder: (context, state) {
                      if (state is UpdatePreviousSolutionLoading) {
                        return Center(child: CupertinoActivityIndicator());
                      } else {
                        return Center(
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: WidgetStatePropertyAll(
                                      kMessageBubbleColor),
                                  foregroundColor:
                                      WidgetStatePropertyAll(kFourthColor)),
                              onPressed: () {
                                updatePreviousSolutionBloc.add(
                                    UpdatePreviousSolution(
                                        id: solution.id,
                                        description: _bodyController.text,
                                        name: _nameController.text,
                                        url: solution.url));
                              },
                              child: Text("Update")),
                        );
                      }
                    },
                    listener: (context, state) {
                      if (state is UpdatePreviousSolutionError) {
                        showTopSnackBar(
                          Overlay.of(context),
                          CustomSnackBar.error(
                            message: state.message,
                          ),
                        );
                      }

                      if (state is PreviousSolutionUpdated) {
                        previousSolutionBloc.add(FetchPreviousSolutions());
                        context.navigateBack();
                        showTopSnackBar(
                          Overlay.of(context),
                          CustomSnackBar.success(
                            message: state.message,
                          ),
                        );
                      }
                    },
                  ),
                  const Gap(40),
                  BlocConsumer<DeletePreviousSolutionsBloc,
                      DeletePreviousSolutionStates>(
                    builder: (context, state) {
                      if (state is DeleteeCurrentSolutionLoading) {
                        return Center(child: CupertinoActivityIndicator());
                      } else {
                        return Center(
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      WidgetStatePropertyAll(Colors.red),
                                  foregroundColor:
                                      WidgetStatePropertyAll(kFourthColor)),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => ConfirmationWidget(
                                    message:
                                        "Are you sure to delete this previous solution forever?",
                                    function: () {
                                      deletePreviousSolutionBloc
                                          .add(DeletePreviousSolution(
                                        id: solution.id,
                                      ));
                                    },
                                  ),
                                );
                              },
                              child: Text(
                                "Delete",
                                style: TextStyle(color: Colors.white),
                              )),
                        );
                      }
                    },
                    listener: (context, state) {
                      if (state is DeletePreviousSolutionError) {
                        showTopSnackBar(
                          Overlay.of(context),
                          CustomSnackBar.error(
                            message: state.message,
                          ),
                        );
                      }

                      if (state is PreviousSolutionDeleted) {
                        previousSolutionBloc.add(FetchPreviousSolutions());
                        context.navigateBack();
                        context.navigateBack();
                        showTopSnackBar(
                          Overlay.of(context),
                          CustomSnackBar.success(
                            message: state.message,
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
              const Gap(20)
            ],
          ),
        ),
      ),
    );
  }

  Widget addSolutionWidget() {
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
                  Text("Add Previous Solution",
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
              const Gap(10),
              Divider(),
              const Gap(10),
              TextField(
                controller: _urlController,
                decoration: InputDecoration(
                  hintText: "Solution YouTube Video ID",
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
                controller: _cientController,
                decoration: InputDecoration(
                  hintText: "Client Name",
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
                controller: _clientLogoController,
                decoration: InputDecoration(
                  hintText: "Client Logo Url",
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
              const Gap(10),
              Divider(),
              const Gap(10),
              TextField(
                controller: _newNameController,
                decoration: InputDecoration(
                  hintText: "Previous Solution Name",
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
                controller: _newDescriptionController,
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
              BlocConsumer<AddPreviousSolutionsBloc, AddPreviousSolutionStates>(
                builder: (context, state) {
                  if (state is AddPreviousSolutionLoading) {
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
                            addPreviousSolutionBloc.add(AddPreviousSolution(
                                description: _newDescriptionController.text,
                                name: _newNameController.text,
                                url: _urlController.text,
                                clientLogo: _clientLogoController.text,
                                clientName: _cientController.text));
                          },
                          child: Text("Add")),
                    );
                  }
                },
                listener: (context, state) {
                  if (state is AddPreviousSolutionError) {
                    showTopSnackBar(
                      Overlay.of(context),
                      CustomSnackBar.error(
                        message: state.message,
                      ),
                    );
                  }

                  if (state is PreviousSolutionAdded) {
                    previousSolutionBloc.add(FetchPreviousSolutions());
                    _urlController.clear();
                    _newDescriptionController.clear();
                    _newNameController.clear();
                    _cientController.clear();
                    _clientLogoController.clear();
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
