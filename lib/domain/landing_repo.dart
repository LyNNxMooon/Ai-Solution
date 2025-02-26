import 'package:ai_solution/data/vos/client_vo.dart';
import 'package:ai_solution/data/vos/current_solution_vo.dart';
import 'package:ai_solution/data/vos/previous_solution_vo.dart';

abstract class LandingRepo {
  Future<List<ClientVO>> fetchAllClients();

  Future<List<CurrentSolutionVO>> fetchAllCurrentSolutions();

  Future<List<PreviousSolutionVO>> fetchAllPreviousSolutions();
}
