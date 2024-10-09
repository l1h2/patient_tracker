import '../models/login_model.dart';

abstract class LoginService {
  Future<LoginResponseModel> login(LoginModel params);
}
