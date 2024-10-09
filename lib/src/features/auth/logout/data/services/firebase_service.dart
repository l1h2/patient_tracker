import '/config/firebase/auth_service.dart';
import 'logout_service.dart';

class LogoutFirebaseService implements LogoutService {
  const LogoutFirebaseService(this._firebaseService);

  final AuthService _firebaseService;

  @override
  Future<void> logout() async {
    await _firebaseService.signOut();
  }
}
