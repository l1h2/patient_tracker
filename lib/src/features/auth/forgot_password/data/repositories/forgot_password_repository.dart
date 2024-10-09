import '../../domain/repositories/forgot_password_repository.dart';
import '../services/forgot_password_service.dart';

class FirebaseForgotPasswordRepository implements ForgotPasswordRepository {
  const FirebaseForgotPasswordRepository(this._service);

  final ForgotPasswordService _service;

  @override
  Future<void> resetPassword(String email) async {
    await _service.resetPassword(email);
  }
}
