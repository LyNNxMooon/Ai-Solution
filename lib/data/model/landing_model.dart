import 'package:ai_solution/data/vos/client_vo.dart';
import 'package:ai_solution/data/vos/current_solution_vo.dart';
import 'package:ai_solution/data/vos/previous_solution_vo.dart';
import 'package:ai_solution/domain/landing_repo.dart';
import 'package:ai_solution/firebase/firebase_landing_repo.dart';

class LandingModel implements LandingRepo {
  LandingModel._();
  static final LandingModel _singleton = LandingModel._();
  factory LandingModel() => _singleton;
  final _firebaseAgent = FirebaseLandingRepo();

  //for data manipulation

  @override
  Future<List<ClientVO>> fetchAllClients() async {
    try {
      return await _firebaseAgent.fetchAllClients();
    } on Exception catch (error) {
      return Future.error(error);
    }
  }

  @override
  Future<List<CurrentSolutionVO>> fetchAllCurrentSolutions()async {
    try {
      return await _firebaseAgent.fetchAllCurrentSolutions();
    } on Exception catch (error) {
      return Future.error(error);
    }
  }

  @override
  Future<List<PreviousSolutionVO>> fetchAllPreviousSolutions() async{
    try {
      return await _firebaseAgent.fetchAllPreviousSolutions();
    } on Exception catch (error) {
      return Future.error(error);
    }
  }
}
