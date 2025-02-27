import 'package:ai_solution/data/vos/event_vo.dart';
import 'package:ai_solution/data/vos/promo_event_vo.dart';

abstract class EventsRepo {
  Future<List<EventVO>> fetchAllUpComingEvents();

  Future<List<PromoEventVO>> fetchAllPromoEvents();
}
