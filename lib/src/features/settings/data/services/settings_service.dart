import '../../domain/entities/settings_entity.dart';

abstract class SettingsService {
  Future<void> setDarkMode(SettingsParams params);
}
