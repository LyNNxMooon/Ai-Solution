import 'package:ai_solution/BLoC/current_solutions/current_solutions_events.dart';
import 'package:ai_solution/BLoC/current_solutions/current_solutions_states.dart';
import 'package:ai_solution/domain/landing_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrentSolutionsBloc
    extends Bloc<CurrentSolutionsEvents, CurrentSolutionsStates> {
  final LandingRepo landingRepo;

  CurrentSolutionsBloc({required this.landingRepo})
      : super(CurrentSolutionsInitial()) {
    on<FetchCurrentSolutions>(_onFetchCurrentSolutions);
  }

  Future _onFetchCurrentSolutions(FetchCurrentSolutions event,
      Emitter<CurrentSolutionsStates> emit) async {
        try {
      emit(CurrentSolutionsLoading());
      final fetchedCurrentSolutions = await landingRepo.fetchAllCurrentSolutions();

      emit(CurrentSolutionsLoaded(fetchedCurrentSolutions));
    } catch (error) {
      emit(CurrentSolutionsError('$error'));
    }
      }
}
