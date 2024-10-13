import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/splash_entity.dart';
import '../../domain/usecases/splash_usecase.dart';

import '/config/locator/setup.dart';
import '/src/core/models/user_model.dart';
import '/src/core/repositories/user_repository.dart';
import '/src/core/utils/usecase.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc(this._splashUseCase) : super(SplashInitial()) {
    on<SplashCheckAuthentication>(_onCheckAuthentication);
  }

  final SplashUseCase _splashUseCase;

  void _onCheckAuthentication(
    SplashCheckAuthentication event,
    Emitter<SplashState> emit,
  ) async {
    emit(SplashLoading());
    try {
      final SplashReturn splashReturn = await _splashUseCase(NoParams());
      if (splashReturn.isLoggedIn) {
        locator<UserRepository>().setUser(splashReturn.user!);
        emit(SplashAuthenticated(splashReturn.user!));
      } else {
        emit(SplashNotAuthenticated());
      }
    } on Exception catch (e) {
      emit(SplashFailure(e.toString()));
    }
  }
}
