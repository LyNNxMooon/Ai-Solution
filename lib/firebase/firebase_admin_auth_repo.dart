import 'package:ai_solution/data/vos/admin_uid_vo.dart';
import 'package:ai_solution/domain/admin_auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class FirebaseAdminAuthRepo implements AdminAuthRepo {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final databaseRef = FirebaseDatabase.instance.ref();

  @override
  Future<UserCredential?> adminLogin(String email, String password) async {
    try {
      UserCredential? userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      if (userCredential.user != null) {
        final AdminUidVO adminID = AdminUidVO(id: userCredential.user!.uid);
        await databaseRef
            .child("admin_uid")
            .child(adminID.id.toString())
            .set(adminID.toJson());
      }

      return userCredential;
    } on FirebaseException catch (error) {
      throw Exception("Login Failed: $error");
    }
  }
}
