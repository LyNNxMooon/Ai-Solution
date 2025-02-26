
import 'package:ai_solution/BLoC/previous_solutions/previous_solutions_events.dart';
import 'package:ai_solution/BLoC/previous_solutions/previous_solutions_states.dart';
import 'package:ai_solution/domain/landing_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PreviousSolutionsBloc
    extends Bloc<PreviousSolutionsEvents, PreviousSolutionsStates> {
  final LandingRepo landingRepo;

 PreviousSolutionsBloc({required this.landingRepo})
      : super(PreviousSolutionsInitial()) {
    on<FetchPreviousSolutions>(_onFetchPreviousSolutions);
  }

  Future _onFetchPreviousSolutions(FetchPreviousSolutions event,
      Emitter<PreviousSolutionsStates> emit) async {
        try {
      emit(PreviousSolutionsLoading());
      final fetchedPreviousSolutions = await landingRepo.fetchAllPreviousSolutions();

      emit(PreviousSolutionsLoaded(fetchedPreviousSolutions));
    } catch (error) {
      emit(PreviousSolutionsError('$error'));
    }
      }
}
