import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/login_entity.dart';
import '../../domain/usecases/login_usecase.dart';

import '/config/locator/setup.dart';
import '/src/core/models/user_model.dart';
import '/src/core/repositories/user_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(this._loginUsecase) : super(LoginInitial()) {
    on<LoginRequest>(_onLoginRequest);
  }

  final LoginUseCase _loginUsecase;

  void _onLoginRequest(
    LoginRequest event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());
    try {
      final LoginReturn loginReturn = await _loginUsecase(
        LoginParams(
          email: event.email,
          password: event.password,
        ),
      );

      await locator<UserRepository>().setUser(loginReturn.user);
      emit(LoginSuccess(loginReturn.user));
    } on LoginIncorrectException catch (_) {
      emit(LoginUserNotFound());
    } on Exception catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }
}
