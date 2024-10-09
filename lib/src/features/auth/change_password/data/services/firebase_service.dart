import '/config/firebase/auth_service.dart';
import '../../domain/entities/password_entity.dart';
import 'password_service.dart';

class PasswordChangeFirebaseService implements PasswordChangeService {
  const PasswordChangeFirebaseService(this._firebaseService);

  final AuthService _firebaseService;

  @override
  Future<void> changePassword(PasswordChangeParams params) async {
    try {
      await _firebaseService.changePassword(
        currentPassword: params.currentPassword,
        newPassword: params.newPassword,
      );
    } on Exception catch (e) {
      throw PasswordChangeException(e.toString());
    }
  }
}
