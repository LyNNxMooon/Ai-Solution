import 'package:ai_solution/BLoC/clients/client_bloc.dart';
import 'package:ai_solution/BLoC/clients/client_events.dart';
import 'package:ai_solution/BLoC/current_solutions/current_solutions_bloc.dart';
import 'package:ai_solution/BLoC/current_solutions/current_solutions_events.dart';
import 'package:ai_solution/BLoC/previous_solutions/previous_solutions_bloc.dart';
import 'package:ai_solution/BLoC/previous_solutions/previous_solutions_events.dart';
import 'package:ai_solution/data/model/landing_model.dart';
import 'package:ai_solution/pages/index_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final landingRepo = LandingModel();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<ClientBloc>(
            create: (context) =>
                ClientBloc(landingRepo: landingRepo)..add(FetchClients()),
          ),
           BlocProvider<CurrentSolutionsBloc>(
            create: (context) =>
                CurrentSolutionsBloc(landingRepo: landingRepo)..add(FetchCurrentSolutions()),
          ),
           BlocProvider<PreviousSolutionsBloc>(
            create: (context) =>
                PreviousSolutionsBloc(landingRepo: landingRepo)..add(FetchPreviousSolutions()),
          )
        ],
        child: MaterialApp(
          theme: ThemeData(fontFamily: "InterTight"),
          debugShowCheckedModeBanner: false,
          home: IndexPage(),
        ));
  }
}
