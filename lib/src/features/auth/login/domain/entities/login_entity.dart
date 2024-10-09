import 'package:equatable/equatable.dart';

import '/src/core/models/user_model.dart';

class LoginReturn extends Equatable {
  const LoginReturn({required this.user});

  final User user;

  @override
  List<Object?> get props => [user];
}

class LoginParams extends Equatable {
  const LoginParams({required this.email, required this.password});

  final String email;
  final String password;

  @override
  List<Object?> get props => [];
}

class LoginIncorrectException implements Exception {
  LoginIncorrectException(this.message);

  final String? message;

  @override
  String toString() => 'LoginIncorrectException: $message';
}

class LoginFailureException implements Exception {
  LoginFailureException(this.message);

  final String message;

  @override
  String toString() => 'LoginFailureException: $message';
}
