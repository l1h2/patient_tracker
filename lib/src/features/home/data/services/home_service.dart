import '../../domain/entities/home_entity.dart';

import '/src/core/models/company_model.dart';

abstract class HomeService {
  Future<void> addCompany(HomeParams params);
  Future<List<Company>> getCompanies(String userId);
  Future<Company> updateCompany(String userId, Company company, String name);
  Future<void> deleteCompany(String userId, String companyId);
}
