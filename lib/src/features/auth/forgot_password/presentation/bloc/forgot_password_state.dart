part of 'forgot_password_bloc.dart';

sealed class ForgotPasswordState extends Equatable {
  const ForgotPasswordState();

  @override
  List<Object> get props => [];
}

final class ForgotPasswordInitial extends ForgotPasswordState {}

final class ForgotPasswordLoading extends ForgotPasswordState {}

final class ResetLinkSent extends ForgotPasswordState {
  final String email;

  const ResetLinkSent(this.email);

  @override
  List<Object> get props => [email];
}

final class ResetPasswordFailure extends ForgotPasswordState {
  final String error;

  const ResetPasswordFailure(this.error);

  @override
  List<Object> get props => [error];
}
