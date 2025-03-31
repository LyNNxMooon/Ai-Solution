import 'package:ai_solution/data/vos/feedback_vo.dart';
import 'package:ai_solution/data/vos/rating_vo.dart';

abstract class FeedbackAndRatingStates {}

class FeedbackAndRatingInitial extends FeedbackAndRatingStates {}

class FeedbackAndRatingLoading extends FeedbackAndRatingStates {}

class FeedbackAndRatingSubmitted extends FeedbackAndRatingStates {
  final String message;

  FeedbackAndRatingSubmitted(this.message);
}

class FeedbackAndRatingError extends FeedbackAndRatingStates {
  final String message;

  FeedbackAndRatingError(this.message);
}

abstract class FeedbackStates {}

class FeedbackInitial extends FeedbackStates {}

class FeedbackLoading extends FeedbackStates {}

class FeedbackError extends FeedbackStates {
  final String message;

  FeedbackError(this.message);
}

class FeedbackLoaded extends FeedbackStates {
  final List<FeedbackVO> feedback;

  FeedbackLoaded(this.feedback);
}

abstract class RatingStates {}

class RatingInitial extends RatingStates {}

class RatingLoading extends RatingStates {}

class RatingError extends RatingStates {
  final String message;

  RatingError(this.message);
}

class RatingLoaded extends RatingStates {
  final List<RatingVO> rating;

  RatingLoaded(this.rating);
}
