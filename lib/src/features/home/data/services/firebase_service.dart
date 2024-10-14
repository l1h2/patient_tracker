import '../../domain/entities/home_entity.dart';

import '/config/firebase/firestore/collections/companies.dart';
import '/config/firebase/firestore/repositories/companies_repository.dart';
import '/src/core/models/company_model.dart';
import 'home_service.dart';

class HomeFirebaseService implements HomeService {
  @override
  Future<String> addCompany(HomeParams params) async {
    final companyRepo = CompaniesRepository(params.userId);
    return await companyRepo.createCompany(CompanyDocument(name: params.name));
  }

  @override
  Future<List<Company>> getCompanies(String userId) async {
    final companyRepo = CompaniesRepository(userId);
    final List<CompanyDocument> companies = await companyRepo.readCompanies();
    return companies.map((company) => company.toCompany()).toList();
  }

  @override
  Future<void> updateCompany(
    String userId,
    String companyId,
    String name,
  ) async {
    final companiesRepo = CompaniesRepository(userId);
    await companiesRepo.updateCompany(
      CompanyDocument(id: companyId, name: name),
    );
  }

  @override
  Future<void> deleteCompany(String userId, String companyId) async {
    final companiesRepo = CompaniesRepository(userId);
    await companiesRepo.deleteCompany(companyId);
  }
}
