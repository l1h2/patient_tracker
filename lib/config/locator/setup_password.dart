import 'package:get_it/get_it.dart';

import '/src/features/auth/change_password/data/repositories/password_repository.dart';
import '/src/features/auth/change_password/data/services/firebase_service.dart';
import '/src/features/auth/change_password/data/services/password_service.dart';
import '/src/features/auth/change_password/domain/repositories/password_repository.dart';
import '/src/features/auth/change_password/domain/usecases/password_usecase.dart';

void setupPasswordLocator(GetIt locator) {
  locator.registerLazySingleton<PasswordChangeService>(
    () => PasswordChangeFirebaseService(locator()),
  );
  locator.registerLazySingleton<PasswordChangeRepository>(
    () => FirebasePasswordChangeRepository(locator()),
  );
  locator.registerLazySingleton<PasswordChangeUseCase>(
    () => PasswordChangeUseCase(locator()),
  );
}
