import 'package:ai_solution/BLoC/events/events_events.dart';
import 'package:ai_solution/BLoC/events/events_states.dart';
import 'package:ai_solution/domain/events_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpcomingEventsBloc extends Bloc<EventsEvents, UpcomingEventsStates> {
  final EventsRepo eventsRepo;

  UpcomingEventsBloc({required this.eventsRepo})
      : super(UpcomingEventsInitial()) {
    on<FetchUpcomingEvents>(_onFetchUpcomingEvents);
  }

  Future _onFetchUpcomingEvents(
      FetchUpcomingEvents event, Emitter<UpcomingEventsStates> emit) async {
    try {
      emit(UpcomingEventsLoading());
      final fetchedUpcomingEvents = await eventsRepo.fetchAllUpComingEvents();

      emit(UpcomingEventsLoaded(fetchedUpcomingEvents));
    } catch (error) {
      emit(UpcomingEventsError('$error'));
    }
  }
}

class PromotionalEventsBloc
    extends Bloc<EventsEvents, PromotionalEventsStates> {
  final EventsRepo eventsRepo;

  PromotionalEventsBloc({required this.eventsRepo})
      : super(PromotionalEventsInitial()) {
    on<FetchPromotionalEvents>(_onFetchPromotionalEvents);
  }

  Future _onFetchPromotionalEvents(
      FetchPromotionalEvents event, Emitter<PromotionalEventsStates> emit) async {
    try {
      emit(PromotionalEventsLoading());
      final fetchedPromotionalEvents = await eventsRepo.fetchAllPromoEvents();

      emit(PromotionalEventsLoaded(fetchedPromotionalEvents));
    } catch (error) {
      emit(PromotionalEventsError('$error'));
    }
  }
}
