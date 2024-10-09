import 'package:get_it/get_it.dart';

import '/src/features/auth/forgot_password/data/repositories/forgot_password_repository.dart';
import '/src/features/auth/forgot_password/data/services/firebase_service.dart';
import '/src/features/auth/forgot_password/data/services/forgot_password_service.dart';
import '/src/features/auth/forgot_password/domain/repositories/forgot_password_repository.dart';
import '/src/features/auth/forgot_password/domain/usecases/forgot_password_usecase.dart';

void setupForgotPasswordLocator(GetIt locator) {
  locator.registerLazySingleton<ForgotPasswordService>(
    () => ForgotPasswordFirebaseService(locator()),
  );
  locator.registerLazySingleton<ForgotPasswordRepository>(
    () => FirebaseForgotPasswordRepository(locator()),
  );
  locator.registerLazySingleton<ForgotPasswordUseCase>(
    () => ForgotPasswordUseCase(locator()),
  );
}
