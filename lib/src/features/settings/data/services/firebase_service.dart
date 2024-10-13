import '../../domain/entities/settings_entity.dart';

import '/config/firebase/firestore/collections/users.dart';
import '/config/firebase/firestore/repositories/users_repository.dart';
import 'settings_service.dart';

class SettingsFirebaseService implements SettingsService {
  @override
  Future<void> setDarkMode(SettingsParams params) async {
    final userRepo = UsersRepository();
    final Map<String, bool> preferences = {
      UserAttrs.isDarkMode: params.isDarkMode,
    };

    await userRepo.updateUserPreferences(params.userId, preferences);
  }
}
