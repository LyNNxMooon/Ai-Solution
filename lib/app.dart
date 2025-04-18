import 'dart:convert';
import 'dart:math';

import 'package:ai_solution/BLoC/admin_auth/admin_auth_bloc.dart';
import 'package:ai_solution/BLoC/chatting/chatting_bloc.dart';
import 'package:ai_solution/BLoC/clients/client_bloc.dart';
import 'package:ai_solution/BLoC/clients/client_events.dart';
import 'package:ai_solution/BLoC/current_solutions/current_solutions_bloc.dart';
import 'package:ai_solution/BLoC/current_solutions/current_solutions_events.dart';
import 'package:ai_solution/BLoC/events/events_bloc.dart';
import 'package:ai_solution/BLoC/events/events_events.dart';
import 'package:ai_solution/BLoC/feedback/feedback_bloc.dart';
import 'package:ai_solution/BLoC/feedback/feedback_events.dart';
import 'package:ai_solution/BLoC/gallery/gallery_bloc.dart';
import 'package:ai_solution/BLoC/gallery/gallery_events.dart';
import 'package:ai_solution/BLoC/inquiry/inquiry_bloc.dart';
import 'package:ai_solution/BLoC/inquiry/inquiry_events.dart';
import 'package:ai_solution/BLoC/previous_solutions/previous_solutions_bloc.dart';
import 'package:ai_solution/BLoC/previous_solutions/previous_solutions_events.dart';
import 'package:ai_solution/data/model/admin_auth_model.dart';
import 'package:ai_solution/data/model/admin_model.dart';
import 'package:ai_solution/data/model/chatting_model.dart';
import 'package:ai_solution/data/model/events_model.dart';
import 'package:ai_solution/data/model/feedback_model.dart';
import 'package:ai_solution/data/model/gallery_model.dart';
import 'package:ai_solution/data/model/inquiry_model.dart';
import 'package:ai_solution/data/model/landing_model.dart';

import 'package:ai_solution/pages/admin/admin_panel.dart';
import 'package:ai_solution/pages/index_page.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final landingRepo = LandingModel();
  final eventsRepo = EventsModel();
  final galleryRepo = GalleryModel();
  final inquiryRepo = InquiryModel();
  final feedbackRepo = FeedbackModel();
  final adminAuthRepo = AdminAuthModel();
  final adminRepo = AdminModel();
  final chattingRepo = ChattingModel();

  final GoRouter router = GoRouter(routes: [
    GoRoute(
      path: '/admin-login',
      builder: (context, state) {
        return AdminPanel();
      },
    ),
    GoRoute(
      path: '/',
      builder: (context, state) {
        return IndexPage();
      },
    ),
  ]);

  @override
  Widget build(BuildContext context) {
    var random = Random.secure();
    var values = List<int>.generate(16, (i) => random.nextInt(256));

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
          BlocProvider<SerivceBloc>(
            create: (context) =>
                SerivceBloc(inquiryRepo: inquiryRepo)..add(FetchServices()),
          ),
          BlocProvider<InquirySubmissionBloc>(
            create: (context) =>
                InquirySubmissionBloc(inquiryRepo: inquiryRepo),
          ),
          BlocProvider<FeedbackAndRatingBloc>(
            create: (context) =>
                FeedbackAndRatingBloc(feedbackRepo: feedbackRepo),
          ),
          BlocProvider<AdminAuthBloc>(
            create: (context) => AdminAuthBloc(adminAuthRepo: adminAuthRepo),
          ),
          BlocProvider<OpenInquiryBloc>(
            create: (context) => OpenInquiryBloc(adminRepo: adminRepo)
              ..add(FetchOpenedInquiresByAdmin()),
          ),
          BlocProvider<ClosedInquiryBloc>(
            create: (context) => ClosedInquiryBloc(adminRepo: adminRepo)
              ..add(FetchClosedInquiresByAdmin()),
          ),
          BlocProvider<UpdateInquiryBloc>(
            create: (context) => UpdateInquiryBloc(adminRepo: adminRepo),
          ),
          BlocProvider<DeleteInquiryBloc>(
            create: (context) => DeleteInquiryBloc(adminRepo: adminRepo),
          ),
          BlocProvider<MessageBloc>(
            create: (context) => MessageBloc(
                chattingRepo: chattingRepo, userID: base64UrlEncode(values)),
          ),
          BlocProvider<AddCurrentSolutionsBloc>(
            create: (context) => AddCurrentSolutionsBloc(adminRepo: adminRepo),
          ),
          BlocProvider<UpdateCurrentSolutionsBloc>(
            create: (context) =>
                UpdateCurrentSolutionsBloc(adminRepo: adminRepo),
          ),
          BlocProvider<DeleteCurrentSolutionsBloc>(
            create: (context) =>
                DeleteCurrentSolutionsBloc(adminRepo: adminRepo),
          ),
          BlocProvider<AddPreviousSolutionsBloc>(
            create: (context) => AddPreviousSolutionsBloc(adminRepo: adminRepo),
          ),
          BlocProvider<UpdatePreviousSolutionsBloc>(
            create: (context) =>
                UpdatePreviousSolutionsBloc(adminRepo: adminRepo),
          ),
          BlocProvider<DeletePreviousSolutionsBloc>(
            create: (context) =>
                DeletePreviousSolutionsBloc(adminRepo: adminRepo),
          ),
          BlocProvider<AddGallerysBloc>(
            create: (context) => AddGallerysBloc(adminRepo: adminRepo),
          ),
          BlocProvider<UpdateGallerysBloc>(
            create: (context) => UpdateGallerysBloc(adminRepo: adminRepo),
          ),
          BlocProvider<DeleteGallerysBloc>(
            create: (context) => DeleteGallerysBloc(adminRepo: adminRepo),
          ),
          BlocProvider<AddUpcomingEventssBloc>(
            create: (context) => AddUpcomingEventssBloc(adminRepo: adminRepo),
          ),
          BlocProvider<UpdateUpcomingEventssBloc>(
            create: (context) =>
                UpdateUpcomingEventssBloc(adminRepo: adminRepo),
          ),
          BlocProvider<DeleteUpcomingEventssBloc>(
            create: (context) =>
                DeleteUpcomingEventssBloc(adminRepo: adminRepo),
          ),
          BlocProvider<FeedbackFetchingBloc>(
            create: (context) => FeedbackFetchingBloc(adminRepo: adminRepo)
              ..add(FetchFeedbacks()),
          ),
          BlocProvider<RatingFetchingBloc>(
            create: (context) =>
                RatingFetchingBloc(adminRepo: adminRepo)..add(FetchRatings()),
          ),
        ],
        child: MaterialApp.router(
          theme: ThemeData(fontFamily: "InterTight"),
          debugShowCheckedModeBanner: false,
          routerConfig: router,
        ));
  }
}
