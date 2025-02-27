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
