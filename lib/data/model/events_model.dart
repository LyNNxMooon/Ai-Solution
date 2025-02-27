import 'package:ai_solution/data/vos/event_vo.dart';
import 'package:ai_solution/data/vos/promo_event_vo.dart';

import 'package:ai_solution/domain/events_repo.dart';

import 'package:ai_solution/firebase/firebase_events_repo.dart';

class EventsModel implements EventsRepo {
  EventsModel._();
  static final EventsModel _singleton = EventsModel._();
  factory EventsModel() => _singleton;
  final _firebaseAgent = FirebaseEventsRepo();

  //for data manipulation

  @override
  Future<List<EventVO>> fetchAllUpComingEvents() async {
    try {
      return await _firebaseAgent.fetchAllUpComingEvents();
    } on Exception catch (error) {
      return Future.error(error);
    }
  }

  @override
  Future<List<PromoEventVO>> fetchAllPromoEvents() async {
    try {
      return await _firebaseAgent.fetchAllPromoEvents();
    } on Exception catch (error) {
      return Future.error(error);
    }
  }
}
