import '../../domain/entities/splash_entity.dart';

abstract class SplashService {
  Future<SplashReturn> checkUser();
}
