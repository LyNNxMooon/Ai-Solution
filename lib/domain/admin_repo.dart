import 'package:ai_solution/data/vos/current_solution_vo.dart';
import 'package:ai_solution/data/vos/inquiry_vo.dart';

abstract class AdminRepo {
  Future<List<InquiryVO>> fetchAllOpenedInquiries();
  Future<List<InquiryVO>> fetchAllClosedInquires();

  Future<List<InquiryVO>> filterOpenedInquires(String keyword, bool isSearch);

  Future<List<InquiryVO>> filterClosedInquires(String keyword, bool isSearch);

  Future<void> updateInquiry (InquiryVO inquiry);

  Future<void> deleteInquiry (int id);

  Future<void> saveCurrentSolution (CurrentSolutionVO currentSolution);
}
