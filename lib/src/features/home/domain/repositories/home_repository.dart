import '../entities/home_entity.dart';

import '/src/core/models/company_model.dart';

abstract class HomeRepository {
  Future<void> addCompany(HomeParams params);
  Future<List<Company>> getCompanies(String userId);
  Future<Company> updateCompany(String userId, Company company, String name);
}
