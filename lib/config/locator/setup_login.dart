import 'package:get_it/get_it.dart';

import '/src/features/auth/login/data/repositories/login_repository.dart';
import '/src/features/auth/login/data/services/firebase_service.dart';
import '/src/features/auth/login/data/services/login_service.dart';
import '/src/features/auth/login/domain/repositories/login_repository.dart';
import '/src/features/auth/login/domain/usecases/login_usecase.dart';

void setupLoginLocator(GetIt locator) {
  locator.registerLazySingleton<LoginService>(
    () => LoginFirebaseService(locator()),
  );
  locator.registerLazySingleton<LoginRepository>(
    () => FirebaseLoginRepository(locator()),
  );
  locator.registerLazySingleton<LoginUseCase>(() => LoginUseCase(locator()));
}
