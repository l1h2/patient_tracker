import 'package:flutter/material.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/settings_entity.dart';
import '../../domain/usecases/settings_usecase.dart';

import '/config/locator/setup.dart';
import '/src/core/models/user_model.dart';
import '/src/core/repositories/user_repository.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc(this._settingsUseCase) : super(SettingsInitial()) {
    on<ChangeTheme>(_onChangeTheme);
    on<ToggleTheme>(_onToggleTheme);
  }

  final SettingsUseCase _settingsUseCase;

  ThemeMode _currentTheme = ThemeMode.dark;

  void _onChangeTheme(ChangeTheme event, Emitter<SettingsState> emit) {
    emit(SettingsLoading());

    try {
      _currentTheme = event.isDarkMode ? ThemeMode.dark : ThemeMode.light;
      emit(ThemeChangeSuccess(
          event.isDarkMode ? ThemeMode.dark : ThemeMode.light));
    } catch (e) {
      emit(ThemeChangeFailure(e.toString()));
    }
  }

  void _onToggleTheme(ToggleTheme event, Emitter<SettingsState> emit) async {
    emit(SettingsLoading());

    final User user = locator<UserRepository>().getUser()!;
    _currentTheme =
        _currentTheme == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;

    final bool isDarkMode = _currentTheme == ThemeMode.dark;

    try {
      await _settingsUseCase(
        SettingsParams(userId: user.id, isDarkMode: isDarkMode),
      );
      user.isDarkMode = isDarkMode;
    } catch (e) {
      emit(ThemeChangeFailure(e.toString()));
    }

    emit(ThemeChangeSuccess(_currentTheme));
  }
}
