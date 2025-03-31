abstract class EventsEvents {}

class FetchUpcomingEvents extends EventsEvents {}

class FetchPromotionalEvents extends EventsEvents {}

class AddUpcomingEvents extends EventsEvents {
  final String name;
  final String url;
  final String description;

  AddUpcomingEvents(
      {required this.description, required this.name, required this.url});
}

class UpdateUpcomingEvents extends EventsEvents {
  final int id;
  final String name;
  final String url;
  final String description;

  UpdateUpcomingEvents(
      {required this.description,
      required this.id,
      required this.name,
      required this.url});
}

class DeleteUpcomingEvents extends EventsEvents {
  final int id;

  DeleteUpcomingEvents({required this.id});
}
