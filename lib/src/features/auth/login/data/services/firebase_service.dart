import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/entities/login_entity.dart';
import '../models/login_model.dart';

import '/config/firebase/auth_service.dart';
import '/config/firebase/firestore/collections/users.dart';
import '/config/firebase/firestore/repositories/users_repository.dart';
import 'login_service.dart';

class LoginFirebaseService implements LoginService {
  const LoginFirebaseService(this._service);

  final AuthService _service;

  @override
  Future<LoginResponseModel> login(LoginModel loginModel) async {
    late String userId;
    try {
      userId = await _service.signInWithEmailAndPassword(
        loginModel.params.email,
        loginModel.params.password,
      );
    } on FirebaseAuthException catch (e) {
      throw LoginIncorrectException(e.message);
    }

    final userRepo = UsersRepository();
    final UserDocument? docUser = await userRepo.readUser(userId);

    if (docUser == null) throw LoginIncorrectException('User not registered');

    return LoginResponseModel(isLoginComplete: true, user: docUser.toUser());
  }
}
