import 'package:get_it/get_it.dart';

import '/src/features/home/data/repositories/home_repository.dart';
import '/src/features/home/data/services/firebase_service.dart';
import '/src/features/home/data/services/home_service.dart';
import '/src/features/home/domain/repositories/home_repository.dart';
import '/src/features/home/domain/usecases/home_usecase.dart';

void setupHomeLocator(GetIt locator) {
  locator.registerLazySingleton<HomeService>(
    () => HomeFirebaseService(),
  );
  locator.registerLazySingleton<HomeRepository>(
    () => FirebaseHomeRepository(locator()),
  );
  locator.registerLazySingleton<HomeUseCase>(() => HomeUseCase(locator()));
}
