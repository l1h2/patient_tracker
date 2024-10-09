import '../repositories/forgot_password_repository.dart';

import '/src/core/utils/usecase.dart';

class ForgotPasswordUseCase implements UseCase<void, String> {
  const ForgotPasswordUseCase(this._repository);

  final ForgotPasswordRepository _repository;

  @override
  Future<void> call(String email) => _repository.resetPassword(email);
}
