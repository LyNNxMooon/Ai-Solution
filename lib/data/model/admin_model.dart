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
  Future<List<InquiryVO>> filterClosedInquires(String service) async {
    try {
      List<InquiryVO> rawList = <InquiryVO>[];
      rawList = await _firebaseAgent.filterClosedInquires(service);

      List<InquiryVO> closedList = <InquiryVO>[];

      if (service == "All") {
        closedList = rawList
            .where(
              (element) => !element.isOpened,
            )
            .toList();
      } else {
        closedList = rawList
            .where(
              (element) => !element.isOpened && element.service == service,
            )
            .toList();
      }

      return closedList;
    } on Exception catch (error) {
      return Future.error(error);
    }
  }

  @override
  Future<List<InquiryVO>> filterOpenedInquires(String service) async {
    try {
      List<InquiryVO> rawList = <InquiryVO>[];
      rawList = await _firebaseAgent.fetchAllOpenedInquiries();

      List<InquiryVO> openedList = <InquiryVO>[];

      if (service == "All") {
        openedList = rawList
            .where(
              (element) => element.isOpened,
            )
            .toList();
      } else {
        openedList = rawList
            .where(
              (element) => element.isOpened && element.service == service,
            )
            .toList();
      }

      return openedList;
    } on Exception catch (error) {
      return Future.error(error);
    }
  }
}
