import 'package:get_it/get_it.dart';

import '/src/features/records/data/repositories/records_repository.dart';
import '/src/features/records/data/services/firebase_service.dart';
import '/src/features/records/data/services/records_service.dart';
import '/src/features/records/domain/repositories/records_repository.dart';
import '/src/features/records/domain/usecases/records_usecase.dart';

void setupRecordsLocator(GetIt locator) {
  locator.registerLazySingleton<RecordsService>(
    () => RecordsFirebaseService(),
  );
  locator.registerLazySingleton<RecordsRepository>(
    () => FirebaseRecordsRepository(locator()),
  );
  locator.registerLazySingleton<RecordsUseCase>(
    () => RecordsUseCase(locator()),
  );
}
