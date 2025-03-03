import 'package:ai_solution/data/vos/feedback_vo.dart';
import 'package:ai_solution/data/vos/rating_vo.dart';
import 'package:ai_solution/domain/feedback_repo.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class FirebaseFeedbackRepo implements FeedbackRepo {
  final databaseRef = FirebaseDatabase.instance.ref();

  @override
  Future<void> submitFeedbackAndRate(
      FeedbackVO feedback, RatingVO rating) async {
    try {
      await databaseRef
          .child("feedbacks")
          .child(feedback.id.toString())
          .set(feedback.toJson());
      await databaseRef
          .child("ratings")
          .child(rating.id.toString())
          .set(rating.toJson());
    } on FirebaseException catch (error) {
      return Future.error(error);
    }
  }
}
