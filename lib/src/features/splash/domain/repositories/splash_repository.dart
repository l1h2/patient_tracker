import '../entities/splash_entity.dart';

abstract class SplashRepository {
  Future<SplashReturn> checkUser();
}
