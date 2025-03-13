import 'package:ai_solution/data/vos/country_vo.dart';
import 'package:ai_solution/data/vos/inquiry_vo.dart';
import 'package:ai_solution/data/vos/services_vo.dart';

abstract class InquiryRepo {
  Future<List<CountryVO>> fetchAllCountires();
 
  Future<List<ServicesVO>> fetchAllServices(bool isAdmin);

  Future<void> submitInquiry(InquiryVO inquiry);
}