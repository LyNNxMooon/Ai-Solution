import 'package:ai_solution/data/vos/country_vo.dart';
import 'package:ai_solution/data/vos/inquiry_vo.dart';
import 'package:ai_solution/data/vos/services_vo.dart';
import 'package:ai_solution/domain/inquiry_repo.dart';
import 'package:ai_solution/firebase/firebase_inquiry_repo.dart';

class InquiryModel implements InquiryRepo {
  InquiryModel._();
  static final InquiryModel _singleton = InquiryModel._();
  factory InquiryModel() => _singleton;
  final _firebaseAgent = FirebaseInquiryRepo();
  @override
  Future<List<CountryVO>> fetchAllCountires() async {
    try {
      return await _firebaseAgent.fetchAllCountires();
    } on Exception catch (error) {
      return Future.error(error);
    }
  }

  @override
  Future<void> submitInquiry(InquiryVO inquiry) async {
    try {
      return await _firebaseAgent.submitInquiry(inquiry);
    } on Exception catch (error) {
      return Future.error(error);
    }
  }

  @override
  Future<List<ServicesVO>> fetchAllServices() async{
    try {
      return await _firebaseAgent.fetchAllServices();
    } on Exception catch (error) {
      return Future.error(error);
    }
  }
}
