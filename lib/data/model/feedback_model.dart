import 'package:ai_solution/data/vos/feedback_vo.dart';
import 'package:ai_solution/data/vos/rating_vo.dart';
import 'package:ai_solution/domain/feedback_repo.dart';
import 'package:ai_solution/firebase/firebase_feedback_repo.dart';

class FeedbackModel implements FeedbackRepo {
  FeedbackModel._();
  static final FeedbackModel _singleton = FeedbackModel._();
  factory FeedbackModel() => _singleton;
  final _firebaseAgent = FirebaseFeedbackRepo();

  @override
  Future<void> submitFeedbackAndRate(
      FeedbackVO feedback, RatingVO rating) async {
    try {
      return await _firebaseAgent.submitFeedbackAndRate(feedback, rating);
    } on Exception catch (error) {
      return Future.error(error);
    }
  }
}
