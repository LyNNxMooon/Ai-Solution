import 'package:ai_solution/data/vos/feedback_vo.dart';
import 'package:ai_solution/data/vos/rating_vo.dart';

abstract class FeedbackRepo {
  Future<void> submitFeedbackAndRate(FeedbackVO feedback, RatingVO rating);
 
}
