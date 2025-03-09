abstract class AdminAuthStates{}

class AdminAuthsInitial extends AdminAuthStates{}

class AdminAuthLoading extends AdminAuthStates {}

class Authenticated extends AdminAuthStates {}

class OTPVerification extends AdminAuthStates {}

class OTPLoading extends AdminAuthStates {}

class OTPFail extends AdminAuthStates{
  final String message;

  OTPFail(this.message);
}

class UnAuthenticated extends AdminAuthStates {

  final String message;

  UnAuthenticated(this.message);
}