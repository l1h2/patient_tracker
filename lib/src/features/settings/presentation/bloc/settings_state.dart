part of 'settings_bloc.dart';

sealed class SettingsState extends Equatable {
  const SettingsState();

  @override
  List<Object> get props => [];
}

final class SettingsInitial extends SettingsState {}

final class SettingsLoading extends SettingsState {}

final class ThemeChangeSuccess extends SettingsState {
  final ThemeMode themeMode;

  const ThemeChangeSuccess(this.themeMode);

  @override
  List<Object> get props => [themeMode];
}

final class ThemeChangeFailure extends SettingsState {
  final String error;

  const ThemeChangeFailure(this.error);

  @override
  List<Object> get props => [error];
}

final class SettingsFailure extends SettingsState {
  final String error;

  const SettingsFailure(this.error);

  @override
  List<Object> get props => [error];
}
