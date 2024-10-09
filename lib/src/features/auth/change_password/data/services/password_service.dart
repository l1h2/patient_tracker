import '../../domain/entities/password_entity.dart';

abstract class PasswordChangeService {
  Future<void> changePassword(PasswordChangeParams params);
}
