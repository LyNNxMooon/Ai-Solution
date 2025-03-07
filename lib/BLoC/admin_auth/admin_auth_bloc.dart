// ignore_for_file: use_build_context_synchronously

import 'package:ai_solution/BLoC/admin_auth/admin_auth_events.dart';
import 'package:ai_solution/BLoC/admin_auth/admin_auth_states.dart';
import 'package:ai_solution/domain/admin_auth_repo.dart';
import 'package:ai_solution/pages/admin_dashboard_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_2fa/flutter_2fa.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminAuthBloc extends Bloc<AdminAuthEvents, AdminAuthStates> {
  final AdminAuthRepo adminAuthRepo;

  AdminAuthBloc({required this.adminAuthRepo}) : super(AdminAuthsInitial()) {
    on<AdminLogin>(_onAdminLogin);
  }

  Future<void> _onAdminLogin(
      AdminLogin event, Emitter<AdminAuthStates> emit) async {
    try {
      emit(AdminAuthLoading());
      UserCredential? userCredential =
          await adminAuthRepo.adminLogin(event.email, event.password);

      if (userCredential != null) {
        emit(Authenticated());
        Flutter2FA().verify(context: event.context, page: AdminDashboardPage());
      } else {
        emit(UnAuthenticated("Invalid Credentials!"));
      }
    } catch (error) {
      emit(UnAuthenticated('$error'));
    }
  }
}
