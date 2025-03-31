import 'package:ai_solution/data/vos/event_vo.dart';
import 'package:ai_solution/data/vos/promo_event_vo.dart';

abstract class UpcomingEventsStates {}

class UpcomingEventsInitial extends UpcomingEventsStates {}

class UpcomingEventsLoading extends UpcomingEventsStates {}

class UpcomingEventsError extends UpcomingEventsStates {
  final String message;

  UpcomingEventsError(this.message);
}

class UpcomingEventsLoaded extends UpcomingEventsStates {
  final List<EventVO> upcomingEvents;

  UpcomingEventsLoaded(this.upcomingEvents);
}

//Promotional Events

abstract class PromotionalEventsStates {}

class PromotionalEventsInitial extends PromotionalEventsStates {}

class PromotionalEventsLoading extends PromotionalEventsStates {}

class PromotionalEventsError extends PromotionalEventsStates {
  final String message;
  PromotionalEventsError(this.message);
}

class PromotionalEventsLoaded extends PromotionalEventsStates {
  final List<PromoEventVO> promotionalEvents;

  PromotionalEventsLoaded(this.promotionalEvents);
}


abstract class AddUpcomingEventsStates {}

class AddUpcomingEventsInitial extends AddUpcomingEventsStates {}

class AddUpcomingEventsLoading extends AddUpcomingEventsStates {}

class AddUpcomingEventsError extends AddUpcomingEventsStates {
  final String message;

  AddUpcomingEventsError(this.message);
}

class UpcomingEventsAdded extends AddUpcomingEventsStates {
  final String message;

  UpcomingEventsAdded(this.message);
}

abstract class UpdateUpcomingEventsStates {}

class UpdateUpcomingEventsInitial extends UpdateUpcomingEventsStates {}

class UpdateUpcomingEventsLoading extends UpdateUpcomingEventsStates {}

class UpdateUpcomingEventsError extends UpdateUpcomingEventsStates {
  final String message;

  UpdateUpcomingEventsError(this.message);
}

class UpcomingEventsUpdated extends UpdateUpcomingEventsStates {
  final String message;

  UpcomingEventsUpdated(this.message);
}

abstract class DeleteUpcomingEventsStates {}

class DeleteUpcomingEventsInitial extends DeleteUpcomingEventsStates {}

class DeleteeCurrentSolutionLoading extends DeleteUpcomingEventsStates {}

class DeleteUpcomingEventsError extends DeleteUpcomingEventsStates {
  final String message;

  DeleteUpcomingEventsError(this.message);
}

class UpcomingEventsDeleted extends DeleteUpcomingEventsStates {
  final String message;

  UpcomingEventsDeleted(this.message);
}
