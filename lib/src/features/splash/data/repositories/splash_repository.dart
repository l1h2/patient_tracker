import '../../domain/entities/splash_entity.dart';
import '../../domain/repositories/splash_repository.dart';
import '../services/splash_service.dart';

class FirebaseSplashRepository implements SplashRepository {
  const FirebaseSplashRepository(this._firebaseService);

  final SplashService _firebaseService;

  @override
  Future<SplashReturn> checkUser() async {
    return _firebaseService.checkUser();
  }
}
