import '../../domain/repositories/logout_repository.dart';
import '../services/logout_service.dart';

class FirebaseLogoutRepository implements LogoutRepository {
  const FirebaseLogoutRepository(this._service);

  final LogoutService _service;

  @override
  Future<void> logout() => _service.logout();
}
