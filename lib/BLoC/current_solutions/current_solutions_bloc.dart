import 'package:ai_solution/BLoC/current_solutions/current_solutions_events.dart';
import 'package:ai_solution/BLoC/current_solutions/current_solutions_states.dart';
import 'package:ai_solution/data/vos/current_solution_vo.dart';
import 'package:ai_solution/domain/admin_repo.dart';
import 'package:ai_solution/domain/landing_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrentSolutionsBloc
    extends Bloc<CurrentSolutionsEvents, CurrentSolutionsStates> {
  final LandingRepo landingRepo;

  CurrentSolutionsBloc({required this.landingRepo})
      : super(CurrentSolutionsInitial()) {
    on<FetchCurrentSolutions>(_onFetchCurrentSolutions);
  }

  Future _onFetchCurrentSolutions(
      FetchCurrentSolutions event, Emitter<CurrentSolutionsStates> emit) async {
    try {
      emit(CurrentSolutionsLoading());
      final fetchedCurrentSolutions =
          await landingRepo.fetchAllCurrentSolutions();

      emit(CurrentSolutionsLoaded(fetchedCurrentSolutions));
    } catch (error) {
      emit(CurrentSolutionsError('$error'));
    }
  }
}

class AddCurrentSolutionsBloc
    extends Bloc<CurrentSolutionsEvents, AddCurrentSolutionStates> {
  final AdminRepo adminRepo;

  AddCurrentSolutionsBloc({required this.adminRepo})
      : super(AddCurrentSolutionInitial()) {
    on<AddCurrentSolution>(_onAddCurrentSolution);
  }

  Future _onAddCurrentSolution(
      AddCurrentSolution event, Emitter<AddCurrentSolutionStates> emit) async {
    try {
      emit(AddCurrentSolutionLoading());

      int id = DateTime.now().millisecondsSinceEpoch;

      final CurrentSolutionVO solution = CurrentSolutionVO(
          id: id,
          name: event.name.isEmpty ? "Default" : event.name,
          url: event.url.isEmpty
              ? "https://cdn.cs.1worldsync.com/syndication/mediaserverredirect/9c761667cec1f9964212eb7ef2874bf8/original.png"
              : event.url,
          description:
              event.description.isEmpty ? "...... " : event.description);

      await adminRepo.saveCurrentSolution(solution).then(
        (value) {
          emit(CurrentSolutionAdded("Current Solution added successfully!"));
        },
      );
    } catch (error) {
      emit(AddCurrentSolutionError('$error'));
    }
  }
}

class UpdateCurrentSolutionsBloc
    extends Bloc<CurrentSolutionsEvents, UpdateCurrentSolutionStates> {
  final AdminRepo adminRepo;

  UpdateCurrentSolutionsBloc({required this.adminRepo})
      : super(UpdateCurrentSolutionInitial()) {
    on<UpdateCurrrentSolution>(_onUpdateCurrentSolution);
  }

  Future _onUpdateCurrentSolution(UpdateCurrrentSolution event,
      Emitter<UpdateCurrentSolutionStates> emit) async {
    try {
      emit(UpdateCurrentSolutionLoading());

      final CurrentSolutionVO solution = CurrentSolutionVO(
          id: event.id,
          name: event.name.isEmpty ? "Default" : event.name,
          url: event.url,
          description:
              event.description.isEmpty ? "...... " : event.description);

      await adminRepo.saveCurrentSolution(solution).then(
        (value) {
          emit(
              CurrentSolutionUpdated("Current Solution updated successfully!"));
        },
      );
    } catch (error) {
      emit(UpdateCurrentSolutionError('$error'));
    }
  }
}
