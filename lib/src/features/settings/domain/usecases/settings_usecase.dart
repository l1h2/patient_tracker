import '../entities/settings_entity.dart';
import '../repositories/settings_repository.dart';

import '/src/core/utils/usecase.dart';

class SettingsUseCase implements UseCase<void, SettingsParams> {
  const SettingsUseCase(this._repository);

  final SettingsRepository _repository;

  @override
  Future<void> call(SettingsParams params) async {
    return await _repository.setDarkMode(params);
  }
}
