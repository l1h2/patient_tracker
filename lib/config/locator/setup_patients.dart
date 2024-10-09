import 'package:get_it/get_it.dart';

import '/src/features/patients/data/repositories/patients_repository.dart';
import '/src/features/patients/data/services/firebase_service.dart';
import '/src/features/patients/data/services/patients_service.dart';
import '/src/features/patients/domain/repositories/patients_repository.dart';
import '/src/features/patients/domain/usecases/patients_usecase.dart';

void setupPatientsLocator(GetIt locator) {
  locator.registerLazySingleton<PatientsService>(
    () => PatientsFirebaseService(),
  );
  locator.registerLazySingleton<PatientsRepository>(
    () => FirebasePatientsRepository(locator()),
  );
  locator.registerLazySingleton<PatientsUseCase>(
    () => PatientsUseCase(locator()),
  );
}
