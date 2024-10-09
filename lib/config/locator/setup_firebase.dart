import 'package:get_it/get_it.dart';

import '/config/firebase/auth_service.dart';
import '/config/firebase/firestore/dao/base_dao.dart';

void setupFirebaseLocator(GetIt locator) {
  locator.registerLazySingleton<FirestoreDao>(() => FirestoreDao());
  locator.registerLazySingleton<AuthService>(() => AuthService());
}
