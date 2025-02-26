abstract class ClientEvents {}

class FetchClients extends ClientEvents {}


class FetchClientByID extends ClientEvents {
  final String id;

  FetchClientByID({required this.id});
}
