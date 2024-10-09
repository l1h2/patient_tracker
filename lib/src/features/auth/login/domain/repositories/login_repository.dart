import '../entities/login_entity.dart';

abstract class LoginRepository {
  Future<LoginReturn> login(LoginParams params);
}
