import 'package:ai_solution/data/vos/previous_solution_vo.dart';

abstract class PreviousSolutionsStates {}

class PreviousSolutionsInitial extends PreviousSolutionsStates {}

class PreviousSolutionsLoading extends PreviousSolutionsStates {}

class PreviousSolutionsError extends PreviousSolutionsStates {
  final String message;

  PreviousSolutionsError(this.message);
}

class PreviousSolutionsLoaded extends PreviousSolutionsStates {
  final List<PreviousSolutionVO> previousSolutions;

  PreviousSolutionsLoaded(this.previousSolutions);
}

abstract class AddPreviousSolutionStates {}

class AddPreviousSolutionInitial extends AddPreviousSolutionStates {}

class AddPreviousSolutionLoading extends AddPreviousSolutionStates {}

class AddPreviousSolutionError extends AddPreviousSolutionStates {
  final String message;

  AddPreviousSolutionError(this.message);
}

class PreviousSolutionAdded extends AddPreviousSolutionStates {
  final String message;

  PreviousSolutionAdded(this.message);
}

abstract class UpdatePreviousSolutionStates {}

class UpdatePreviousSolutionInitial extends UpdatePreviousSolutionStates {}

class UpdatePreviousSolutionLoading extends UpdatePreviousSolutionStates {}

class UpdatePreviousSolutionError extends UpdatePreviousSolutionStates {
  final String message;

  UpdatePreviousSolutionError(this.message);
}

class PreviousSolutionUpdated extends UpdatePreviousSolutionStates {
  final String message;

  PreviousSolutionUpdated(this.message);
}

abstract class DeletePreviousSolutionStates {}

class DeletePreviousSolutionInitial extends DeletePreviousSolutionStates {}

class DeleteeCurrentSolutionLoading extends DeletePreviousSolutionStates {}

class DeletePreviousSolutionError extends DeletePreviousSolutionStates {
  final String message;

  DeletePreviousSolutionError(this.message);
}

class PreviousSolutionDeleted extends DeletePreviousSolutionStates {
  final String message;

  PreviousSolutionDeleted(this.message);
}
