import 'package:get_it/get_it.dart';

import '/src/features/splash/data/repositories/splash_repository.dart';
import '/src/features/splash/data/services/firebase_service.dart';
import '/src/features/splash/data/services/splash_service.dart';
import '/src/features/splash/domain/repositories/splash_repository.dart';
import '/src/features/splash/domain/usecases/splash_usecase.dart';

void setupSplashLocator(GetIt locator) {
  locator.registerLazySingleton<SplashService>(
    () => SplashFirebaseService(locator()),
  );
  locator.registerLazySingleton<SplashRepository>(
    () => FirebaseSplashRepository(locator()),
  );
  locator.registerLazySingleton<SplashUseCase>(() => SplashUseCase(locator()));
}
