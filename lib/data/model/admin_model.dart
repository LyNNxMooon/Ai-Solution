import 'package:ai_solution/data/vos/current_solution_vo.dart';
import 'package:ai_solution/data/vos/inquiry_vo.dart';
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
}
