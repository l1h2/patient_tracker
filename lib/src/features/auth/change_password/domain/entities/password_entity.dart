import 'package:equatable/equatable.dart';

class PasswordChangeParams extends Equatable {
  const PasswordChangeParams({
    required this.currentPassword,
    required this.newPassword,
  });

  final String currentPassword;
  final String newPassword;

  @override
  List<Object?> get props => [currentPassword, newPassword];
}

class PasswordChangeException implements Exception {
  PasswordChangeException(this.message);

  final String message;

  @override
  String toString() => 'PasswordChangeException: $message';
}
