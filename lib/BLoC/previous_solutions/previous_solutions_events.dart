abstract class PreviousSolutionsEvents {}

class FetchPreviousSolutions extends PreviousSolutionsEvents {}

class AddPreviousSolution extends PreviousSolutionsEvents {
  final String name;
  final String url;
  final String description;
  final String clientName;
  final String clientLogo;

  AddPreviousSolution(
      {required this.description,
      required this.name,
      required this.url,
      required this.clientLogo,
      required this.clientName});
}

class UpdatePreviousSolution extends PreviousSolutionsEvents {
  final int id;
  final String name;
  final String url;
  final String description;

  UpdatePreviousSolution(
      {required this.description,
      required this.id,
      required this.name,
      required this.url});
}

class DeletePreviousSolution extends PreviousSolutionsEvents {
  final int id;

  DeletePreviousSolution({required this.id});
}
