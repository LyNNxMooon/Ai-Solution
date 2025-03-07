import 'package:ai_solution/domain/admin_auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAdminAuthRepo implements AdminAuthRepo {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<UserCredential?> adminLogin(String email, String password) async {
    try {
      UserCredential? userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      return userCredential;
    } on FirebaseException catch (error) {
      throw Exception("Login Failed: $error");
    }
  }
}
