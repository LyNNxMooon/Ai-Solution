import 'package:ai_solution/BLoC/clients/client_bloc.dart';
import 'package:ai_solution/BLoC/clients/client_events.dart';
import 'package:ai_solution/BLoC/current_solutions/current_solutions_bloc.dart';
import 'package:ai_solution/BLoC/current_solutions/current_solutions_events.dart';
import 'package:ai_solution/BLoC/events/events_bloc.dart';
import 'package:ai_solution/BLoC/events/events_events.dart';
import 'package:ai_solution/BLoC/gallery/gallery_bloc.dart';
import 'package:ai_solution/BLoC/gallery/gallery_events.dart';
import 'package:ai_solution/BLoC/inquiry/inquiry_bloc.dart';
import 'package:ai_solution/BLoC/inquiry/inquiry_events.dart';
import 'package:ai_solution/BLoC/previous_solutions/previous_solutions_bloc.dart';
import 'package:ai_solution/BLoC/previous_solutions/previous_solutions_events.dart';
import 'package:ai_solution/data/model/events_model.dart';
import 'package:ai_solution/data/model/gallery_model.dart';
import 'package:ai_solution/data/model/inquiry_model.dart';
import 'package:ai_solution/data/model/landing_model.dart';
import 'package:ai_solution/pages/index_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final landingRepo = LandingModel();
  final eventsRepo = EventsModel();
  final galleryRepo = GalleryModel();
  final inquiryRepo = InquiryModel();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<ClientBloc>(
            create: (context) =>
                ClientBloc(landingRepo: landingRepo)..add(FetchClients()),
          ),
          BlocProvider<ClientDetailsBloc>(
              create: (context) => ClientDetailsBloc(landingRepo: landingRepo)),
          BlocProvider<CurrentSolutionsBloc>(
            create: (context) => CurrentSolutionsBloc(landingRepo: landingRepo)
              ..add(FetchCurrentSolutions()),
          ),
          BlocProvider<PreviousSolutionsBloc>(
            create: (context) => PreviousSolutionsBloc(landingRepo: landingRepo)
              ..add(FetchPreviousSolutions()),
          ),
          BlocProvider<UpcomingEventsBloc>(
            create: (context) => UpcomingEventsBloc(eventsRepo: eventsRepo)
              ..add(FetchUpcomingEvents()),
          ),
          BlocProvider<PromotionalEventsBloc>(
            create: (context) => PromotionalEventsBloc(eventsRepo: eventsRepo)
              ..add(FetchPromotionalEvents()),
          ),
          BlocProvider<GalleryBloc>(
            create: (context) =>
                GalleryBloc(galleryRepo: galleryRepo)..add(FetchGallery()),
          ),
          BlocProvider<CountryBloc>(
            create: (context) =>
                CountryBloc(inquiryRepo: inquiryRepo)..add(FetchCountry()),
          ),
          BlocProvider<InquirySubmissionBloc>(
            create: (context) =>
                InquirySubmissionBloc(inquiryRepo: inquiryRepo),
          ),
        ],
        child: MaterialApp(
          theme: ThemeData(fontFamily: "InterTight"),
          debugShowCheckedModeBanner: false,
          home: IndexPage(),
        ));
  }
}
