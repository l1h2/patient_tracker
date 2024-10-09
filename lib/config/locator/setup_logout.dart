import 'package:get_it/get_it.dart';

import '/src/features/auth/logout/data/repositories/logout_repository.dart';
import '/src/features/auth/logout/data/services/firebase_service.dart';
import '/src/features/auth/logout/data/services/logout_service.dart';
import '/src/features/auth/logout/domain/repositories/logout_repository.dart';
import '/src/features/auth/logout/domain/usecases/logout_usecase.dart';

void setupLogoutLocator(GetIt locator) {
  locator.registerLazySingleton<LogoutService>(
    () => LogoutFirebaseService(locator()),
  );
  locator.registerLazySingleton<LogoutRepository>(
    () => FirebaseLogoutRepository(locator()),
  );
  locator.registerLazySingleton<LogoutUseCase>(() => LogoutUseCase(locator()));
}
