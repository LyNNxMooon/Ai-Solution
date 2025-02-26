import 'package:ai_solution/data/vos/client_vo.dart';
import 'package:ai_solution/data/vos/current_solution_vo.dart';
import 'package:ai_solution/data/vos/previous_solution_vo.dart';
import 'package:ai_solution/domain/landing_repo.dart';
import 'package:firebase_database/firebase_database.dart';

class FirebaseLandingRepo implements LandingRepo {
  final databaseRef = FirebaseDatabase.instance.ref();
  @override
  Future<List<ClientVO>> fetchAllClients() async {
    try {
      final snapshot = await databaseRef.child("clients").once();
      return snapshot.snapshot.children.map<ClientVO>((snapshot) {
        return ClientVO.fromJson(
            Map<String, dynamic>.from(snapshot.value as Map));
      }).toList();
    } catch (error) {
      throw Exception("Error fetching clients: $error");
    }
  }

  @override
  Future<List<CurrentSolutionVO>> fetchAllCurrentSolutions() async {
   try {
      final snapshot = await databaseRef.child("current_solutions").once();
      return snapshot.snapshot.children.map<CurrentSolutionVO>((snapshot) {
        return CurrentSolutionVO.fromJson(
            Map<String, dynamic>.from(snapshot.value as Map));
      }).toList();
    } catch (error) {
      throw Exception("Error fetching clients: $error");
    }
  }

  @override
  Future<List<PreviousSolutionVO>> fetchAllPreviousSolutions() async {
    try {
      final snapshot = await databaseRef.child("previous_solutions").once();
      return snapshot.snapshot.children.map<PreviousSolutionVO>((snapshot) {
        return PreviousSolutionVO.fromJson(
            Map<String, dynamic>.from(snapshot.value as Map));
      }).toList();
    } catch (error) {
      throw Exception("Error fetching clients: $error");
    }
  }
}
