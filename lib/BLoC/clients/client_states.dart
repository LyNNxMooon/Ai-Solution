import 'package:ai_solution/data/vos/client_vo.dart';

abstract class ClientStates {}

class ClientsInitial extends ClientStates {}

class ClientsLoading extends ClientStates {}

class ClientsError extends ClientStates {
  final String message;

  ClientsError(this.message);
}

class ClientsLoaded extends ClientStates {
  final List<ClientVO> clients;

  ClientsLoaded(this.clients);
}
