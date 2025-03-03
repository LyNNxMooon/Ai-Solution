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