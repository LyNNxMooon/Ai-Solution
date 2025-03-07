import 'package:firebase_auth/firebase_auth.dart';

abstract class AdminAuthRepo {

  Future<UserCredential?> adminLogin (String email, String password);
}