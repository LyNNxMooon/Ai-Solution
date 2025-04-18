import 'package:ai_solution/BLoC/feedback/feedback_events.dart';
import 'package:ai_solution/BLoC/feedback/feeeback_states.dart';
import 'package:ai_solution/data/vos/feedback_vo.dart';
import 'package:ai_solution/data/vos/rating_vo.dart';
import 'package:ai_solution/domain/admin_repo.dart';
import 'package:ai_solution/domain/feedback_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeedbackAndRatingBloc
    extends Bloc<FeedbackAndRatingEvents, FeedbackAndRatingStates> {
  final FeedbackRepo feedbackRepo;

  FeedbackAndRatingBloc({required this.feedbackRepo})
      : super(FeedbackAndRatingInitial()) {
    on<SubmitFeedbackAndRating>(_onFeedbackAndRatingSubmission);
  }

  Future<void> _onFeedbackAndRatingSubmission(SubmitFeedbackAndRating event,
      Emitter<FeedbackAndRatingStates> emit) async {
    try {
      emit(FeedbackAndRatingLoading());

      if (event.name.isEmpty || event.body.isEmpty || event.rate == 0) {
        emit(FeedbackAndRatingError(
            "Fill into all fields to submit the feeback!"));
      } else {
        int id = DateTime.now().millisecondsSinceEpoch;
        final FeedbackVO feedback =
            FeedbackVO(id: id, name: event.name, body: event.body);
        final RatingVO rating =
            RatingVO(id: id, name: event.name, rate: event.rate);
        await feedbackRepo.submitFeedbackAndRate(feedback, rating).then(
          (value) {
            emit(FeedbackAndRatingSubmitted(
                "Your feedback is successfully submitted! Thank you!"));
          },
        );
      }
    } catch (error) {
      emit(FeedbackAndRatingError('$error'));
    }
  }
}

class FeedbackFetchingBloc
    extends Bloc<FeedbackAndRatingEvents, FeedbackStates> {
  final AdminRepo adminRepo;

  FeedbackFetchingBloc({required this.adminRepo}) : super(FeedbackInitial()) {
    on<FetchFeedbacks>(_onFetchFeedbacks);
  }

  Future _onFetchFeedbacks(
      FeedbackAndRatingEvents event, Emitter<FeedbackStates> emit) async {
    try {
      emit(FeedbackLoading());
      final fetchedFeedbacks = await adminRepo.fetchAllFeedbacks();

      emit(FeedbackLoaded(fetchedFeedbacks));
    } catch (error) {
      emit(FeedbackError('$error'));
    }
  }
}

class RatingFetchingBloc extends Bloc<FeedbackAndRatingEvents, RatingStates> {
  final AdminRepo adminRepo;

  RatingFetchingBloc({required this.adminRepo}) : super(RatingInitial()) {
    on<FetchRatings>(_onFetchRatings);
  }

  Future _onFetchRatings(
      FeedbackAndRatingEvents event, Emitter<RatingStates> emit) async {
    try {
      emit(RatingLoading());
      final fetchedRatings = await adminRepo.fetchAllRatings();

      emit(RatingLoaded(fetchedRatings));
    } catch (error) {
      emit(RatingError('$error'));
    }
  }
}
