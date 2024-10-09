part of 'password_bloc.dart';

sealed class PasswordState extends Equatable {
  const PasswordState();

  @override
  List<Object> get props => [];
}

final class PasswordInitial extends PasswordState {}

final class PasswordChangeLoading extends PasswordState {}

final class PasswordChangeSuccess extends PasswordState {}

final class InvalidCredentials extends PasswordState {}

final class PasswordChangeFailure extends PasswordState {
  const PasswordChangeFailure(this.error);

  final String error;

  @override
  List<Object> get props => [error];
}
