import 'package:ai_solution/BLoC/clients/client_events.dart';
import 'package:ai_solution/BLoC/clients/client_states.dart';
import 'package:ai_solution/domain/landing_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClientBloc extends Bloc<ClientEvents, ClientStates> {
  final LandingRepo landingRepo;

  ClientBloc({required this.landingRepo}) : super(ClientsInitial()) {
    on<FetchClients>(_onFetchClients);
  }

  Future<void> _onFetchClients(
      FetchClients event, Emitter<ClientStates> emit) async {
    try {
      emit(ClientsLoading());
      final fetchedClients = await landingRepo.fetchAllClients();

      emit(ClientsLoaded(fetchedClients));
    } catch (error) {
      emit(ClientsError('$error'));
    }
  }
}

class ClientDetailsBloc extends Bloc<ClientEvents, ClientDetailStates> {
  final LandingRepo landingRepo;

  ClientDetailsBloc({required this.landingRepo})
      : super(ClientDetailsInitial()) {
    on<FetchClientByID>(_onFetchClientByID);
  }

  Future<void> _onFetchClientByID(
      FetchClientByID event, Emitter<ClientDetailStates> emit) async {
    try {
      emit(LoadingClientImageByID());
      final fetchedClientbyID = await landingRepo.loadClientByID(event.id);
      emit(LoadedClientImageByID(fetchedClientbyID));
    } catch (error) {
      emit(ErrorLoadingClientImageByID('$error'));
    }
  }
}
