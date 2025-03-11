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
}
