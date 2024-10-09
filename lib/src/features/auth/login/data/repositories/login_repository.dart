import '../../domain/entities/login_entity.dart';
import '../../domain/repositories/login_repository.dart';
import '../models/login_model.dart';
import '../services/login_service.dart';

class FirebaseLoginRepository implements LoginRepository {
  const FirebaseLoginRepository(this._service);

  final LoginService _service;

  @override
  Future<LoginReturn> login(LoginParams params) async {
    final LoginResponseModel response = await _service.login(
      LoginModel(params: params),
    );
    return response.toEntity();
  }
}
