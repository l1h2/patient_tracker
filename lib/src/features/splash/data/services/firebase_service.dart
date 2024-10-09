import '../../domain/entities/splash_entity.dart';

import '/config/firebase/auth_service.dart';
import '/config/firebase/firestore/collections/users.dart';
import '/config/firebase/firestore/repositories/users_repository.dart';
import 'splash_service.dart';

class SplashFirebaseService implements SplashService {
  SplashFirebaseService(this._firebaseService);

  final AuthService _firebaseService;

  @override
  Future<SplashReturn> checkUser() async {
    final String? userId = _firebaseService.userId;

    if (userId == null) return const SplashReturn(isLoggedIn: false);

    final userRepo = UsersRepository();
    final UserDocument? docUser = await userRepo.readUser(userId);

    if (docUser == null) return const SplashReturn(isLoggedIn: false);

    return SplashReturn(isLoggedIn: true, user: docUser.toUser());
  }
}
