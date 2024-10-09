import 'package:equatable/equatable.dart';

import '/src/core/models/user_model.dart';

class SplashReturn extends Equatable {
  const SplashReturn({required this.isLoggedIn, this.user});

  final bool isLoggedIn;
  final User? user;

  @override
  List<Object?> get props => [isLoggedIn, user];
}

class SplashFailureException implements Exception {
  SplashFailureException(this.message);

  final String message;

  @override
  String toString() => 'SplashFailureException: $message';
}
