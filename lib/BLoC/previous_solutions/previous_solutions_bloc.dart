import 'package:ai_solution/BLoC/previous_solutions/previous_solutions_events.dart';
import 'package:ai_solution/BLoC/previous_solutions/previous_solutions_states.dart';
import 'package:ai_solution/data/vos/client_vo.dart';
import 'package:ai_solution/data/vos/previous_solution_vo.dart';
import 'package:ai_solution/domain/admin_repo.dart';
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
      final fetchedPreviousSolutions =
          await landingRepo.fetchAllPreviousSolutions();

      emit(PreviousSolutionsLoaded(fetchedPreviousSolutions));
    } catch (error) {
      emit(PreviousSolutionsError('$error'));
    }
  }
}

class AddPreviousSolutionsBloc
    extends Bloc<PreviousSolutionsEvents, AddPreviousSolutionStates> {
  final AdminRepo adminRepo;

  AddPreviousSolutionsBloc({required this.adminRepo})
      : super(AddPreviousSolutionInitial()) {
    on<AddPreviousSolution>(_onAddPreviousSolution);
  }

  Future _onAddPreviousSolution(AddPreviousSolution event,
      Emitter<AddPreviousSolutionStates> emit) async {
    try {
      emit(AddPreviousSolutionLoading());

      int id = DateTime.now().millisecondsSinceEpoch;

      final PreviousSolutionVO solution = PreviousSolutionVO(
          id: id,
          name: event.name.isEmpty ? "Default" : event.name,
          url: event.url.isEmpty
              ? "https://cdn.cs.1worldsync.com/syndication/mediaserverredirect/9c761667cec1f9964212eb7ef2874bf8/original.png"
              : event.url,
          description:
              event.description.isEmpty ? "...... " : event.description,
          clientID: id);

      final ClientVO client =
          ClientVO(id: id, name: event.clientName, url: event.clientLogo);

      await adminRepo.savePreviousSolution(solution, client).then(
        (value) {
          emit(PreviousSolutionAdded("Previous Solution added successfully!"));
        },
      );
    } catch (error) {
      emit(AddPreviousSolutionError('$error'));
    }
  }
}

class UpdatePreviousSolutionsBloc
    extends Bloc<PreviousSolutionsEvents, UpdatePreviousSolutionStates> {
  final AdminRepo adminRepo;

  UpdatePreviousSolutionsBloc({required this.adminRepo})
      : super(UpdatePreviousSolutionInitial()) {
    on<UpdatePreviousSolution>(_onUpdatePreviousSolution);
  }

  Future _onUpdatePreviousSolution(UpdatePreviousSolution event,
      Emitter<UpdatePreviousSolutionStates> emit) async {
    try {
      emit(UpdatePreviousSolutionLoading());

      final PreviousSolutionVO solution = PreviousSolutionVO(
          id: event.id,
          name: event.name.isEmpty ? "Default" : event.name,
          url: event.url,
          description:
              event.description.isEmpty ? "...... " : event.description,
          clientID: event.id);

      final ClientVO temp = ClientVO(id: 100, name: "temp", url: "-");

      await adminRepo.savePreviousSolution(solution, temp).then(
        (value) {
          emit(PreviousSolutionUpdated(
              "Previous Solution updated successfully!"));
        },
      );
    } catch (error) {
      emit(UpdatePreviousSolutionError('$error'));
    }
  }
}

class DeletePreviousSolutionsBloc
    extends Bloc<PreviousSolutionsEvents, DeletePreviousSolutionStates> {
  final AdminRepo adminRepo;

  DeletePreviousSolutionsBloc({required this.adminRepo})
      : super(DeletePreviousSolutionInitial()) {
    on<DeletePreviousSolution>(_onDeletePreviousSolution);
  }

  Future _onDeletePreviousSolution(DeletePreviousSolution event,
      Emitter<DeletePreviousSolutionStates> emit) async {
    try {
      emit(DeletePreviousSolutionLoading());

      await adminRepo.deletePreviousSolution(event.id).then(
        (value) {
          emit(PreviousSolutionDeleted(
              "Previous Solution deleted successfully!"));
        },
      );
    } catch (error) {
      emit(DeletePreviousSolutionError('$error'));
    }
  }
}
