import '../../domain/entities/home_entity.dart';
import '../../domain/repositories/home_repository.dart';
import '../services/home_service.dart';

import '/src/core/models/company_model.dart';

class FirebaseHomeRepository implements HomeRepository {
  final HomeService _service;

  FirebaseHomeRepository(this._service);

  @override
  Future<String> addCompany(HomeParams params) async {
    return await _service.addCompany(params);
  }

  @override
  Future<List<Company>> getCompanies(String userId) async {
    return await _service.getCompanies(userId);
  }

  @override
  Future<void> updateCompany(
    String userId,
    String companyId,
    String name,
  ) async {
    await _service.updateCompany(userId, companyId, name);
  }

  @override
  Future<void> deleteCompany(String userId, String companyId) async {
    await _service.deleteCompany(userId, companyId);
  }
}
