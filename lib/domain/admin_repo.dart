import 'package:ai_solution/data/vos/client_vo.dart';
import 'package:ai_solution/data/vos/current_solution_vo.dart';
import 'package:ai_solution/data/vos/event_vo.dart';
import 'package:ai_solution/data/vos/feedback_vo.dart';
import 'package:ai_solution/data/vos/gallery_vo.dart';
import 'package:ai_solution/data/vos/inquiry_vo.dart';
import 'package:ai_solution/data/vos/previous_solution_vo.dart';
import 'package:ai_solution/data/vos/rating_vo.dart';

abstract class AdminRepo {
  Future<List<InquiryVO>> fetchAllOpenedInquiries();
  Future<List<InquiryVO>> fetchAllClosedInquires();

  Future<List<InquiryVO>> filterOpenedInquires(String keyword, bool isSearch);

  Future<List<InquiryVO>> filterClosedInquires(String keyword, bool isSearch);

  Future<void> updateInquiry(InquiryVO inquiry);

  Future<void> deleteInquiry(int id);

  //Current solutions CUD

  Future<void> saveCurrentSolution(CurrentSolutionVO currentSolution);

  Future<void> deleteCurrentSolution(int id);

  // Previous Solutions CUD

  Future<void> savePreviousSolution(PreviousSolutionVO previousSolution, ClientVO client);

  Future<void> deletePreviousSolution(int id);

  // Upcoming events CUD

  Future<void> saveUpcomingEvent(EventVO upcomingEvent);

  Future<void> deleteUpcomingEvent(int id);

  // Gallery CUD

  Future<void> saveGallery(GalleryVO gallery);

  Future<void> deleteGallery(int id);


  Future<List<FeedbackVO>> fetchAllFeedbacks();

  Future<List<RatingVO>> fetchAllRatings();
}
