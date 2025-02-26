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