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
