part of 'forgot_password_bloc.dart';

sealed class ForgotPasswordEvent extends Equatable {
  const ForgotPasswordEvent();

  @override
  List<Object> get props => [];
}

final class SendResetLink extends ForgotPasswordEvent {
  final String email;

  const SendResetLink(this.email);

  @override
  List<Object> get props => [email];
}
