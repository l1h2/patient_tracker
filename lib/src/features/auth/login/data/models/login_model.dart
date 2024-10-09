import '../../domain/entities/login_entity.dart';

import '/src/core/models/user_model.dart';

class LoginModel {
  const LoginModel({required this.params});

  final LoginParams params;
}

class LoginResponseModel {
  const LoginResponseModel({required this.isLoginComplete, required this.user});

  final bool isLoginComplete;
  final User user;

  LoginReturn toEntity() {
    if (!isLoginComplete) {
      throw LoginFailureException('Login failed');
    }
    return LoginReturn(user: user);
  }
}
