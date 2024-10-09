import '../entities/password_entity.dart';
import '../repositories/password_repository.dart';

import '/src/core/utils/usecase.dart';

class PasswordChangeUseCase implements UseCase<void, PasswordChangeParams> {
  const PasswordChangeUseCase(this._repository);

  final PasswordChangeRepository _repository;

  @override
  Future<void> call(PasswordChangeParams params) =>
      _repository.changePassword(params);
}
