import 'package:flutter/material.dart';

abstract class AdminAuthEvents {}

class AdminLogin extends AdminAuthEvents {
  final String email;
  final String password;
  final BuildContext context;

  AdminLogin(
      {required this.email, required this.password, required this.context});
}

class VerifyOTP extends AdminAuthEvents {
  final String otp;
  final BuildContext context;

  VerifyOTP({required this.otp, required this.context});
}
