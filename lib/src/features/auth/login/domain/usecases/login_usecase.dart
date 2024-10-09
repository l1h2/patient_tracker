import '../entities/login_entity.dart';
import '../repositories/login_repository.dart';

import '/src/core/utils/usecase.dart';

class LoginUseCase implements UseCase<LoginReturn, LoginParams> {
  const LoginUseCase(this._repository);

  final LoginRepository _repository;

  @override
  Future<LoginReturn> call(LoginParams params) => _repository.login(params);
}
