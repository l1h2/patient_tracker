import '../entities/splash_entity.dart';
import '../repositories/splash_repository.dart';

import '/src/core/utils/usecase.dart';

class SplashUseCase implements UseCase<void, NoParams> {
  final SplashRepository _repository;

  SplashUseCase(this._repository);

  @override
  Future<SplashReturn> call(NoParams params) => _repository.checkUser();
}
