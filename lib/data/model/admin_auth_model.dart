import 'package:ai_solution/domain/admin_auth_repo.dart';
import 'package:ai_solution/firebase/firebase_admin_auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AdminAuthModel extends AdminAuthRepo {
  AdminAuthModel._();
  static final AdminAuthModel _singleton = AdminAuthModel._();
  factory AdminAuthModel() => _singleton;
  final _firebaseAgent = FirebaseAdminAuthRepo();

  @override
  Future<UserCredential?> adminLogin(String email, String password) async {
    try {
      return await _firebaseAgent.adminLogin(email, password);
    } on Exception catch (error) {
      return Future.error(error);
    }
  }
}
