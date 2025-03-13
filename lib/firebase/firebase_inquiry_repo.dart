import 'package:ai_solution/data/vos/country_vo.dart';
import 'package:ai_solution/data/vos/inquiry_vo.dart';
import 'package:ai_solution/data/vos/services_vo.dart';
import 'package:ai_solution/domain/inquiry_repo.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class FirebaseInquiryRepo implements InquiryRepo {
  final databaseRef = FirebaseDatabase.instance.ref();

  @override
  Future<List<CountryVO>> fetchAllCountires() async {
    try {
      final snapshot = await databaseRef.child("countries").once();
      return snapshot.snapshot.children.map<CountryVO>((snapshot) {
        return CountryVO.fromJson(
            Map<String, dynamic>.from(snapshot.value as Map));
      }).toList();
    } catch (error) {
      throw Exception("Error fetching countries: $error");
    }
  }

  @override
  Future<void> submitInquiry(InquiryVO inquiry) {
    try {
      return databaseRef
          .child("inquries")
          .child(inquiry.id.toString())
          .set(inquiry.toJson());
    } on FirebaseException catch (error) {
      //print(error);
      return Future.error(error);
    }
  }

  @override
  Future<List<ServicesVO>> fetchAllServices(bool isAdmin) async {
   try {
      final snapshot = await databaseRef.child("services").once();
      return snapshot.snapshot.children.map<ServicesVO>((snapshot) {
        return ServicesVO.fromJson(
            Map<String, dynamic>.from(snapshot.value as Map));
      }).toList();
    } catch (error) {
      throw Exception("Error fetching services: $error");
    }
  }
}
