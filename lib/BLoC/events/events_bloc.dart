import 'package:ai_solution/BLoC/events/events_events.dart';
import 'package:ai_solution/BLoC/events/events_states.dart';
import 'package:ai_solution/data/vos/event_vo.dart';
import 'package:ai_solution/domain/admin_repo.dart';
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

  Future _onFetchPromotionalEvents(FetchPromotionalEvents event,
      Emitter<PromotionalEventsStates> emit) async {
    try {
      emit(PromotionalEventsLoading());
      final fetchedPromotionalEvents = await eventsRepo.fetchAllPromoEvents();

      emit(PromotionalEventsLoaded(fetchedPromotionalEvents));
    } catch (error) {
      emit(PromotionalEventsError('$error'));
    }
  }
}

class AddUpcomingEventssBloc
    extends Bloc<EventsEvents, AddUpcomingEventsStates> {
  final AdminRepo adminRepo;

  AddUpcomingEventssBloc({required this.adminRepo})
      : super(AddUpcomingEventsInitial()) {
    on<AddUpcomingEvents>(_onAddUpcomingEvents);
  }

  Future _onAddUpcomingEvents(
      AddUpcomingEvents event, Emitter<AddUpcomingEventsStates> emit) async {
    try {
      emit(AddUpcomingEventsLoading());

      int id = DateTime.now().millisecondsSinceEpoch;

      final EventVO solution = EventVO(
        id: id,
        name: event.name.isEmpty ? "Default" : event.name,
        url: event.url.isEmpty
            ? "https://cdn.cs.1worldsync.com/syndication/mediaserverredirect/9c761667cec1f9964212eb7ef2874bf8/original.png"
            : event.url,
        description: event.description.isEmpty ? "...... " : event.description,
      );

      await adminRepo.saveUpcomingEvent(solution).then(
        (value) {
          emit(UpcomingEventsAdded("UpcomingEvents added successfully!"));
        },
      );
    } catch (error) {
      emit(AddUpcomingEventsError('$error'));
    }
  }
}

class UpdateUpcomingEventssBloc
    extends Bloc<EventsEvents, UpdateUpcomingEventsStates> {
  final AdminRepo adminRepo;

  UpdateUpcomingEventssBloc({required this.adminRepo})
      : super(UpdateUpcomingEventsInitial()) {
    on<UpdateUpcomingEvents>(_onUpdateUpcomingEvents);
  }

  Future _onUpdateUpcomingEvents(UpdateUpcomingEvents event,
      Emitter<UpdateUpcomingEventsStates> emit) async {
    try {
      emit(UpdateUpcomingEventsLoading());

      final EventVO solution = EventVO(
        id: event.id,
        name: event.name.isEmpty ? "Default" : event.name,
        url: event.url,
        description: event.description.isEmpty ? "...... " : event.description,
      );

      await adminRepo.saveUpcomingEvent(solution).then(
        (value) {
          emit(UpcomingEventsUpdated("UpcomingEvents updated successfully!"));
        },
      );
    } catch (error) {
      emit(UpdateUpcomingEventsError('$error'));
    }
  }
}

class DeleteUpcomingEventssBloc
    extends Bloc<EventsEvents, DeleteUpcomingEventsStates> {
  final AdminRepo adminRepo;

  DeleteUpcomingEventssBloc({required this.adminRepo})
      : super(DeleteUpcomingEventsInitial()) {
    on<DeleteUpcomingEvents>(_onDeleteUpcomingEvents);
  }

  Future _onDeleteUpcomingEvents(DeleteUpcomingEvents event,
      Emitter<DeleteUpcomingEventsStates> emit) async {
    try {
      emit(DeleteUpcomingEventsInitial());

      await adminRepo.deleteUpcomingEvent(event.id).then(
        (value) {
          emit(UpcomingEventsDeleted("UpcomingEvents deleted successfully!"));
        },
      );
    } catch (error) {
      emit(DeleteUpcomingEventsError('$error'));
    }
  }
}
