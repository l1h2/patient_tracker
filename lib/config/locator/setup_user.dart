import 'package:get_it/get_it.dart';

import '/src/core/repositories/user_repository.dart';

void setupUserLocator(GetIt locator) {
  locator.registerSingletonAsync<UserRepository>(() async {
    final userRepository = UserRepository();
    await userRepository.init();
    return userRepository;
  });
}
