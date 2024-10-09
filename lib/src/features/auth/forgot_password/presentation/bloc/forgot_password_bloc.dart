import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/forgot_password_usecase.dart';

part 'forgot_password_event.dart';
part 'forgot_password_state.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  ForgotPasswordBloc(this._forgotPasswordUseCase)
      : super(ForgotPasswordInitial()) {
    on<SendResetLink>(_onSendResetLink);
  }

  final ForgotPasswordUseCase _forgotPasswordUseCase;

  void _onSendResetLink(
    SendResetLink event,
    Emitter<ForgotPasswordState> emit,
  ) async {
    emit(ForgotPasswordLoading());
    try {
      await _forgotPasswordUseCase(event.email);
      emit(ResetLinkSent(event.email));
    } on Exception catch (e) {
      emit(ResetPasswordFailure(e.toString()));
    }
  }
}
