abstract class CurrentSolutionsEvents {}

class FetchCurrentSolutions extends CurrentSolutionsEvents {}

class AddCurrentSolution extends CurrentSolutionsEvents {
  final String name;
  final String url;
  final String description;

  AddCurrentSolution(
      {required this.description, required this.name, required this.url});
}

class UpdateCurrrentSolution extends CurrentSolutionsEvents {
  final int id;
  final String name;
  final String url;
  final String description;

  UpdateCurrrentSolution(
      {required this.description,
      required this.id,
      required this.name,
      required this.url});
}

class DeleteCurrentSolution extends CurrentSolutionsEvents {
  final int id;

  DeleteCurrentSolution({required this.id});
}
