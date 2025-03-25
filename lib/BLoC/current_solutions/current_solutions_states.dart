import 'package:ai_solution/data/vos/current_solution_vo.dart';

abstract class CurrentSolutionsStates {}

class CurrentSolutionsInitial extends CurrentSolutionsStates {}

class CurrentSolutionsLoading extends CurrentSolutionsStates {}

class CurrentSolutionsError extends CurrentSolutionsStates {
  final String message;

  CurrentSolutionsError(this.message);
}

class CurrentSolutionsLoaded extends CurrentSolutionsStates {
  final List<CurrentSolutionVO> currentSolutions;

  CurrentSolutionsLoaded(this.currentSolutions);
}

abstract class AddCurrentSolutionStates {}

class AddCurrentSolutionInitial extends AddCurrentSolutionStates {}

class AddCurrentSolutionLoading extends AddCurrentSolutionStates {}

class AddCurrentSolutionError extends AddCurrentSolutionStates {
  final String message;

  AddCurrentSolutionError(this.message);
}

class CurrentSolutionAdded extends AddCurrentSolutionStates {
  final String message;

  CurrentSolutionAdded(this.message);
}

abstract class UpdateCurrentSolutionStates {}

class UpdateCurrentSolutionInitial extends UpdateCurrentSolutionStates {}

class UpdateCurrentSolutionLoading extends UpdateCurrentSolutionStates {}

class UpdateCurrentSolutionError extends UpdateCurrentSolutionStates {
  final String message;

  UpdateCurrentSolutionError(this.message);
}

class CurrentSolutionUpdated extends UpdateCurrentSolutionStates {
  final String message;

  CurrentSolutionUpdated(this.message);
}

abstract class DeleteCurrentSolutionStates {}

class DeleteCurrentSolutionInitial extends DeleteCurrentSolutionStates {}

class DeleteeCurrentSolutionLoading extends DeleteCurrentSolutionStates {}

class DeleteCurrentSolutionError extends DeleteCurrentSolutionStates {
  final String message;

  DeleteCurrentSolutionError(this.message);
}

class CurrentSolutionDeleted extends DeleteCurrentSolutionStates {
  final String message;

  CurrentSolutionDeleted(this.message);
}
