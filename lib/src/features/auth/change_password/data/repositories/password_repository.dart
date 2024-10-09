import '../../domain/entities/password_entity.dart';
import '../../domain/repositories/password_repository.dart';
import '../services/password_service.dart';

class FirebasePasswordChangeRepository implements PasswordChangeRepository {
  const FirebasePasswordChangeRepository(this._service);

  final PasswordChangeService _service;

  @override
  Future<void> changePassword(PasswordChangeParams params) =>
      _service.changePassword(params);
}
