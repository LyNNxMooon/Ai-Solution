import 'package:ai_solution/data/vos/client_vo.dart';

abstract class LandingRepo {
  Future<List<ClientVO>> fetchAllClients();
}
