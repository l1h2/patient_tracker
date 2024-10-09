import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/logout_usecase.dart';

import '/config/locator/setup.dart';
import '/src/core/repositories/user_repository.dart';
import '/src/core/utils/usecase.dart';

part 'logout_event.dart';
part 'logout_state.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  LogoutBloc(this._logoutUsecases) : super(LogoutInitial()) {
    on<LogoutRequest>(_onLogoutRequest);
  }

  final LogoutUseCase _logoutUsecases;

  void _onLogoutRequest(
    LogoutRequest event,
    Emitter<LogoutState> emit,
  ) async {
    emit(LogoutLoading());
    try {
      await _logoutUsecases(NoParams());
      locator<UserRepository>().clearUser();
      emit(LogoutSuccess());
    } on Exception catch (e) {
      emit(LogoutFailure(e.toString()));
    }
  }
}
