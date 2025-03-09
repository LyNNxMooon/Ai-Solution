// ignore_for_file: use_build_context_synchronously

import 'package:ai_solution/BLoC/admin_auth/admin_auth_events.dart';
import 'package:ai_solution/BLoC/admin_auth/admin_auth_states.dart';
import 'package:ai_solution/domain/admin_auth_repo.dart';
import 'package:email_otp_auth/email_otp_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class AdminAuthBloc extends Bloc<AdminAuthEvents, AdminAuthStates> {
  final AdminAuthRepo adminAuthRepo;

  AdminAuthBloc({required this.adminAuthRepo}) : super(AdminAuthsInitial()) {
    on<AdminLogin>(_onAdminLogin);
    on<VerifyOTP>(_onVerifyOTP);
  }

  Future<void> _onAdminLogin(
      AdminLogin event, Emitter<AdminAuthStates> emit) async {
    try {
      emit(AdminAuthLoading());
      UserCredential? userCredential =
          await adminAuthRepo.adminLogin(event.email, event.password);

      if (userCredential != null) {
        var res = await EmailOtpAuth.sendOTP(email: event.email);

        if (res["message"] == "Email Send" && event.context.mounted) {
          emit(OTPVerification());
        } else {
          if (event.context.mounted) {
            emit(OTPFail("Invalid Email Address!"));
          }
        }
      } else {
        emit(UnAuthenticated("User Unauthenticated!"));
      }
    } catch (error) {
      emit(UnAuthenticated('$error'));
    }
  }

  Future<void> _onVerifyOTP(
      VerifyOTP event, Emitter<AdminAuthStates> emit) async {
    try {
      emit(OTPLoading());
      var res = await EmailOtpAuth.verifyOtp(otp: event.otp);

      if (res["message"] == "OTP Verified" && event.context.mounted) {
        emit(Authenticated());
      } else if (res["data"] == "Invalid OTP" && event.context.mounted) {
        emit(OTPFail("Invalid OTP!"));
      } else if (res["data"] == "OTP Expired" && event.context.mounted) {
        emit(OTPFail("OTP Expired!"));
      } else {
        return;
      }
    } catch (error) {
      emit(OTPFail("$error"));
    }
  }
}
