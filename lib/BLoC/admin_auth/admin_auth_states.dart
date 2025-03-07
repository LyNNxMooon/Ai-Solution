abstract class AdminAuthStates{}

class AdminAuthsInitial extends AdminAuthStates{}

class AdminAuthLoading extends AdminAuthStates {}

class Authenticated extends AdminAuthStates {}

class UnAuthenticated extends AdminAuthStates {

  final String message;

  UnAuthenticated(this.message);
}