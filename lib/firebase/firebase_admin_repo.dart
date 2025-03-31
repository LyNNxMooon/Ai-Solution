import 'package:ai_solution/data/vos/current_solution_vo.dart';
import 'package:ai_solution/data/vos/event_vo.dart';
import 'package:ai_solution/data/vos/feedback_vo.dart';
import 'package:ai_solution/data/vos/gallery_vo.dart';
import 'package:ai_solution/data/vos/inquiry_vo.dart';
import 'package:ai_solution/data/vos/previous_solution_vo.dart';
import 'package:ai_solution/data/vos/rating_vo.dart';
import 'package:ai_solution/domain/admin_repo.dart';
import 'package:firebase_core/firebase_core.dart';
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
  Future<List<InquiryVO>> filterClosedInquires(
      String keyword, bool isSearch) async {
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
  Future<List<InquiryVO>> filterOpenedInquires(
      String keyword, bool isSearch) async {
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
  Future<void> updateInquiry(InquiryVO inquiry) async {
    try {
      return databaseRef
          .child("inquries")
          .child(inquiry.id.toString())
          .set(inquiry.toJson());
    } on FirebaseException catch (error) {
      return Future.error(error);
    }
  }

  @override
  Future<void> deleteInquiry(int id) async {
    try {
      await databaseRef.child("inquries").child(id.toString()).remove();
    } on FirebaseException catch (error) {
      //print(error);
      return Future.error(error);
    }
  }

  @override
  Future<void> saveCurrentSolution(CurrentSolutionVO currentSolution) async {
    try {
      await databaseRef
          .child("current_solutions")
          .child(currentSolution.id.toString())
          .set(currentSolution.toJson());
    } on FirebaseException catch (error) {
      //print(error);
      return Future.error(error);
    }
  }

  @override
  Future<void> deleteCurrentSolution(int id) async {
    try {
      await databaseRef
          .child("current_solutions")
          .child(id.toString())
          .remove();
    } on FirebaseException catch (error) {
      //print(error);
      return Future.error(error);
    }
  }

  @override
  Future<void> deletePreviousSolution(int id) async {
    try {
      await databaseRef
          .child("previous_solutions")
          .child(id.toString())
          .remove();
    } on FirebaseException catch (error) {
      //print(error);
      return Future.error(error);
    }
  }

  @override
  Future<List<FeedbackVO>> fetchAllFeedbacks() async {
    try {
      final snapshot = await databaseRef.child("feedbacks").once();
      return snapshot.snapshot.children.map<FeedbackVO>((snapshot) {
        return FeedbackVO.fromJson(
            Map<String, dynamic>.from(snapshot.value as Map));
      }).toList();
    } catch (error) {
      throw Exception("Error fetching feedbacks: $error");
    }
  }

  @override
  Future<List<RatingVO>> fetchAllRatings() async {
    try {
      final snapshot = await databaseRef.child("ratings").once();
      return snapshot.snapshot.children.map<RatingVO>((snapshot) {
        return RatingVO.fromJson(
            Map<String, dynamic>.from(snapshot.value as Map));
      }).toList();
    } catch (error) {
      throw Exception("Error fetching ratings: $error");
    }
  }

  @override
  Future<void> savePreviousSolution(PreviousSolutionVO previousSolution) async {
    try {
      await databaseRef
          .child("previous_solutions")
          .child(previousSolution.id.toString())
          .set(previousSolution.toJson());
    } on FirebaseException catch (error) {
      //print(error);
      return Future.error(error);
    }
  }

  @override
  Future<void> deleteGallery(int id) async {
    try {
      await databaseRef.child("gallery").child(id.toString()).remove();
    } on FirebaseException catch (error) {
      //print(error);
      return Future.error(error);
    }
  }

  @override
  Future<void> deleteUpcomingEvent(int id) async {
    try {
      await databaseRef.child("upcoming_events").child(id.toString()).remove();
    } on FirebaseException catch (error) {
      //print(error);
      return Future.error(error);
    }
  }

  @override
  Future<void> saveGallery(GalleryVO gallery) async {
    try {
      await databaseRef
          .child("gallery")
          .child(gallery.id.toString())
          .set(gallery.toJson());
    } on FirebaseException catch (error) {
      //print(error);
      return Future.error(error);
    }
  }

  @override
  Future<void> saveUpcomingEvent(EventVO upcomingEvent) async {
    try {
      await databaseRef
          .child("upcoming_events")
          .child(upcomingEvent.id.toString())
          .set(upcomingEvent.toJson());
    } on FirebaseException catch (error) {
      //print(error);
      return Future.error(error);
    }
  }
}
