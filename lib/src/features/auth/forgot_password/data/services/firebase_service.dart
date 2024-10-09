import '/config/firebase/auth_service.dart';
import 'forgot_password_service.dart';

class ForgotPasswordFirebaseService implements ForgotPasswordService {
  const ForgotPasswordFirebaseService(this._firebaseService);

  final AuthService _firebaseService;

  @override
  Future<void> resetPassword(String email) async {
    await _firebaseService.sendPasswordResetEmail(email);
  }
}
