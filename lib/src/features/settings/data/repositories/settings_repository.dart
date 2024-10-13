import '../../domain/entities/settings_entity.dart';
import '../../domain/repositories/settings_repository.dart';
import '../services/settings_service.dart';

class FirebaseSettingsRepository implements SettingsRepository {
  final SettingsService _service;

  FirebaseSettingsRepository(this._service);

  @override
  Future<void> setDarkMode(SettingsParams params) async {
    return await _service.setDarkMode(params);
  }
}
