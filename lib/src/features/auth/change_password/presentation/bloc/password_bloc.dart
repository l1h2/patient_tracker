import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/password_entity.dart';
import '../../domain/usecases/password_usecase.dart';

part 'password_event.dart';
part 'password_state.dart';

class PasswordBloc extends Bloc<PasswordEvent, PasswordState> {
  PasswordBloc(this._passwordChangeUseCase) : super(PasswordInitial()) {
    on<PasswordChange>(_onPasswordChange);
  }

  final PasswordChangeUseCase _passwordChangeUseCase;

  void _onPasswordChange(
    PasswordChange event,
    Emitter<PasswordState> emit,
  ) async {
    emit(PasswordChangeLoading());
    try {
      await _passwordChangeUseCase(
        PasswordChangeParams(
          currentPassword: event.currentPassword,
          newPassword: event.newPassword,
        ),
      );
      emit(PasswordChangeSuccess());
    } on PasswordChangeException {
      emit(InvalidCredentials());
    } on Exception catch (e) {
      emit(PasswordChangeFailure(e.toString()));
    }
  }
}
