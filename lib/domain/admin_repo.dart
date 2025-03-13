import 'package:ai_solution/data/vos/inquiry_vo.dart';

abstract class AdminRepo {
  Future<List<InquiryVO>> fetchAllOpenedInquiries();
  Future<List<InquiryVO>> fetchAllClosedInquires();

  Future<List<InquiryVO>> filterOpenedInquires(String service);

  Future<List<InquiryVO>> filterClosedInquires(String service);
}
