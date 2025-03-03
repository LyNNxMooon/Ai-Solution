abstract class FeedbackAndRatingEvents {}

class SubmitFeedbackAndRating extends FeedbackAndRatingEvents {
  final String name;
  final String body;
  final int rate;

  SubmitFeedbackAndRating({
    required this.name,
    required this.body,
    required this.rate,
  });
}
