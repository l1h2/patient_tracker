import 'package:get_it/get_it.dart';

import '/src/features/settings/data/repositories/settings_repository.dart';
import '/src/features/settings/data/services/firebase_service.dart';
import '/src/features/settings/data/services/settings_service.dart';
import '/src/features/settings/domain/repositories/settings_repository.dart';
import '/src/features/settings/domain/usecases/settings_usecase.dart';

void setupSettingsLocator(GetIt locator) {
  locator.registerLazySingleton<SettingsService>(
    () => SettingsFirebaseService(),
  );
  locator.registerLazySingleton<SettingsRepository>(
    () => FirebaseSettingsRepository(locator()),
  );
  locator.registerLazySingleton<SettingsUseCase>(
    () => SettingsUseCase(locator()),
  );
}
