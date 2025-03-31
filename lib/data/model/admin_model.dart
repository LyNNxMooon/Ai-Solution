import 'package:ai_solution/data/vos/current_solution_vo.dart';
import 'package:ai_solution/data/vos/event_vo.dart';
import 'package:ai_solution/data/vos/feedback_vo.dart';
import 'package:ai_solution/data/vos/gallery_vo.dart';
import 'package:ai_solution/data/vos/inquiry_vo.dart';
import 'package:ai_solution/data/vos/previous_solution_vo.dart';
import 'package:ai_solution/data/vos/rating_vo.dart';
import 'package:ai_solution/domain/admin_repo.dart';
import 'package:ai_solution/firebase/firebase_admin_repo.dart';

class AdminModel implements AdminRepo {
  AdminModel._();
  static final AdminModel _singleton = AdminModel._();
  factory AdminModel() => _singleton;
  final _firebaseAgent = FirebaseAdminRepo();

  @override
  Future<List<InquiryVO>> fetchAllClosedInquires() async {
    try {
      List<InquiryVO> rawList = <InquiryVO>[];
      rawList = await _firebaseAgent.fetchAllClosedInquires();

      List<InquiryVO> closedList = rawList
          .where(
            (element) => !element.isOpened,
          )
          .toList();

      return closedList;
    } on Exception catch (error) {
      return Future.error(error);
    }
  }

  @override
  Future<List<InquiryVO>> fetchAllOpenedInquiries() async {
    try {
      List<InquiryVO> rawList = <InquiryVO>[];
      rawList = await _firebaseAgent.fetchAllOpenedInquiries();

      List<InquiryVO> openedList = rawList
          .where(
            (element) => element.isOpened,
          )
          .toList();

      return openedList;
    } on Exception catch (error) {
      return Future.error(error);
    }
  }

  @override
  Future<List<InquiryVO>> filterClosedInquires(
      String keyword, bool isSearch) async {
    try {
      List<InquiryVO> rawList = <InquiryVO>[];
      rawList = await _firebaseAgent.filterClosedInquires(keyword, isSearch);

      List<InquiryVO> closedList = <InquiryVO>[];

      if (isSearch) {
        closedList = rawList
            .where(
              (element) =>
                  !element.isOpened &&
                  element.emailAddress
                      .toLowerCase()
                      .contains(keyword.toLowerCase()),
            )
            .toList();
      } else {
        if (keyword == "All") {
          closedList = rawList
              .where(
                (element) => !element.isOpened,
              )
              .toList();
        } else {
          closedList = rawList
              .where(
                (element) => !element.isOpened && element.service == keyword,
              )
              .toList();
        }
      }

      return closedList;
    } on Exception catch (error) {
      return Future.error(error);
    }
  }

  @override
  Future<List<InquiryVO>> filterOpenedInquires(
      String keyword, bool isSearch) async {
    try {
      List<InquiryVO> rawList = <InquiryVO>[];
      rawList = await _firebaseAgent.filterOpenedInquires(keyword, isSearch);

      List<InquiryVO> openedList = <InquiryVO>[];

      if (isSearch) {
        openedList = rawList
            .where(
              (element) =>
                  element.isOpened &&
                  element.emailAddress
                      .toLowerCase()
                      .contains(keyword.toLowerCase()),
            )
            .toList();
      } else {
        if (keyword == "All") {
          openedList = rawList
              .where(
                (element) => element.isOpened,
              )
              .toList();
        } else {
          openedList = rawList
              .where(
                (element) => element.isOpened && element.service == keyword,
              )
              .toList();
        }
      }

      return openedList;
    } on Exception catch (error) {
      return Future.error(error);
    }
  }

  @override
  Future<void> updateInquiry(InquiryVO inquiry) async {
    try {
      return await _firebaseAgent.updateInquiry(inquiry);
    } on Exception catch (error) {
      return Future.error(error);
    }
  }

  @override
  Future<void> deleteInquiry(int id) async {
    try {
      return await _firebaseAgent.deleteInquiry(id);
    } on Exception catch (error) {
      return Future.error(error);
    }
  }

  @override
  Future<void> saveCurrentSolution(CurrentSolutionVO currentSolution) async {
    try {
      await _firebaseAgent.saveCurrentSolution(currentSolution);
    } on Exception catch (error) {
      return Future.error(error);
    }
  }

  @override
  Future<void> deleteCurrentSolution(int id) async {
    try {
      await _firebaseAgent.deleteCurrentSolution(id);
    } on Exception catch (error) {
      return Future.error(error);
    }
  }

  @override
  Future<void> deletePreviousSolution(int id) async {
    try {
      await _firebaseAgent.deletePreviousSolution(id);
    } on Exception catch (error) {
      return Future.error(error);
    }
  }

  @override
  Future<List<FeedbackVO>> fetchAllFeedbacks() async {
    try {
      return await _firebaseAgent.fetchAllFeedbacks();
    } on Exception catch (error) {
      return Future.error(error);
    }
  }

  @override
  Future<List<RatingVO>> fetchAllRatings() async {
    try {
      return await _firebaseAgent.fetchAllRatings();
    } on Exception catch (error) {
      return Future.error(error);
    }
  }

  @override
  Future<void> savePreviousSolution(PreviousSolutionVO previousSolution) async {
    try {
      await _firebaseAgent.savePreviousSolution(previousSolution);
    } on Exception catch (error) {
      return Future.error(error);
    }
  }

  @override
  Future<void> deleteGallery(int id) async {
    try {
      return await _firebaseAgent.deleteGallery(id);
    } on Exception catch (error) {
      return Future.error(error);
    }
  }

  @override
  Future<void> deleteUpcomingEvent(int id) async {
    try {
      return await _firebaseAgent.deleteUpcomingEvent(id);
    } on Exception catch (error) {
      return Future.error(error);
    }
  }

  @override
  Future<void> saveGallery(GalleryVO gallery) async {
    try {
      await _firebaseAgent.saveGallery(gallery);
    } on Exception catch (error) {
      return Future.error(error);
    }
  }

  @override
  Future<void> saveUpcomingEvent(EventVO upcomingEvent) async {
    try {
      await _firebaseAgent.saveUpcomingEvent(upcomingEvent);
    } on Exception catch (error) {
      return Future.error(error);
    }
  }
}
