import 'package:ai_solution/data/vos/event_vo.dart';
import 'package:ai_solution/data/vos/promo_event_vo.dart';
import 'package:ai_solution/domain/events_repo.dart';
import 'package:firebase_database/firebase_database.dart';

class FirebaseEventsRepo implements EventsRepo {
  final databaseRef = FirebaseDatabase.instance.ref();

  @override
  Future<List<PromoEventVO>> fetchAllPromoEvents() async {
    try {
      final snapshot = await databaseRef.child("promotional_events").once();
      return snapshot.snapshot.children.map<PromoEventVO>((snapshot) {
        return PromoEventVO.fromJson(
            Map<String, dynamic>.from(snapshot.value as Map));
      }).toList();
    } catch (error) {
      throw Exception("Error fetching prommotional events: $error");
    }
  }

  @override
  Future<List<EventVO>> fetchAllUpComingEvents() async {
    try {
      final snapshot = await databaseRef.child("upcoming_events").once();
      return snapshot.snapshot.children.map<EventVO>((snapshot) {
        return EventVO.fromJson(
            Map<String, dynamic>.from(snapshot.value as Map));
      }).toList();
    } catch (error) {
      throw Exception("Error fetching upcoming events: $error");
    }
  }
}
