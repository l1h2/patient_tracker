import '../entities/password_entity.dart';

abstract class PasswordChangeRepository {
  Future<void> changePassword(PasswordChangeParams params);
}
