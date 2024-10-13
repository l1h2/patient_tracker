import '../entities/settings_entity.dart';

abstract class SettingsRepository {
  Future<void> setDarkMode(SettingsParams params);
}
