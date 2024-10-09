import '../repositories/logout_repository.dart';

import '/src/core/utils/usecase.dart';

class LogoutUseCase implements UseCase<void, NoParams> {
  const LogoutUseCase(this._repository);

  final LogoutRepository _repository;

  @override
  Future<void> call(NoParams params) => _repository.logout();
}
