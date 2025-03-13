import 'package:ai_solution/data/vos/inquiry_vo.dart';
import 'package:ai_solution/domain/admin_repo.dart';
import 'package:firebase_database/firebase_database.dart';

class FirebaseAdminRepo implements AdminRepo {
  final databaseRef = FirebaseDatabase.instance.ref();

  @override
  Future<List<InquiryVO>> fetchAllClosedInquires() async {
    try {
      final snapshot = await databaseRef.child("inquries").once();
      return snapshot.snapshot.children.map<InquiryVO>((snapshot) {
        return InquiryVO.fromJson(
            Map<String, dynamic>.from(snapshot.value as Map));
      }).toList();
    } catch (error) {
      throw Exception("Error fetching inquires: $error");
    }
  }

  @override
  Future<List<InquiryVO>> fetchAllOpenedInquiries() async {
    try {
      final snapshot = await databaseRef.child("inquries").once();
      return snapshot.snapshot.children.map<InquiryVO>((snapshot) {
        return InquiryVO.fromJson(
            Map<String, dynamic>.from(snapshot.value as Map));
      }).toList();
    } catch (error) {
      throw Exception("Error fetching inquires: $error");
    }
  }

  @override
  Future<List<InquiryVO>> filterClosedInquires(String keyword, bool isSearch) async {
    try {
      final snapshot = await databaseRef.child("inquries").once();
      return snapshot.snapshot.children.map<InquiryVO>((snapshot) {
        return InquiryVO.fromJson(
            Map<String, dynamic>.from(snapshot.value as Map));
      }).toList();
    } catch (error) {
      throw Exception("Error fetching inquires: $error");
    }
  }

  @override
  Future<List<InquiryVO>> filterOpenedInquires(String keyword, bool isSearch) async {
    try {
      final snapshot = await databaseRef.child("inquries").once();
      return snapshot.snapshot.children.map<InquiryVO>((snapshot) {
        return InquiryVO.fromJson(
            Map<String, dynamic>.from(snapshot.value as Map));
      }).toList();
    } catch (error) {
      throw Exception("Error fetching inquires: $error");
    }
  }
}
