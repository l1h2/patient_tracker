import '../entities/home_entity.dart';

import '/src/core/models/company_model.dart';

abstract class HomeRepository {
  Future<String> addCompany(HomeParams params);
  Future<List<Company>> getCompanies(String userId);
  Future<void> updateCompany(String userId, String companyId, String name);
  Future<void> deleteCompany(String userId, String companyId);
}
