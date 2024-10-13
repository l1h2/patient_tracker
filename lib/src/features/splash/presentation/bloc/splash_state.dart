part of 'splash_bloc.dart';

sealed class SplashState extends Equatable {
  const SplashState();

  @override
  List<Object> get props => [];
}

final class SplashInitial extends SplashState {}

final class SplashLoading extends SplashState {}

final class SplashAuthenticated extends SplashState {
  final User user;

  const SplashAuthenticated(this.user);

  @override
  List<Object> get props => [user];
}

final class SplashNotAuthenticated extends SplashState {}

final class SplashFailure extends SplashState {
  final String error;

  const SplashFailure(this.error);

  @override
  List<Object> get props => [error];
}
