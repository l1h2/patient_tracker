import '../collections/companies.dart';
import '../dao/companies_dao.dart';
import 'patients_repository.dart';

class CompaniesRepository {
  CompaniesRepository(this.userId) : _companiesDao = CompaniesDao(userId);

  final String userId;
  final CompaniesDao _companiesDao;

  Future<String> createCompany(CompanyDocument company) async {
    return await _companiesDao.createCompany(company.toMap());
  }

  Future<CompanyDocument?> readCompany(String companyId) async {
    final Map<String, dynamic>? data =
        await _companiesDao.readCompany(companyId);
    if (data == null) return null;
    return CompanyDocument.fromMap(data);
  }

  Future<List<CompanyDocument>> readCompanies() async {
    final List<Map<String, dynamic>> data = await _companiesDao.readCompanies();
    return data.map((e) => CompanyDocument.fromMap(e)).toList();
  }

  Future<void> updateCompany(CompanyDocument company) async {
    await _companiesDao.updateCompany(company.id!, company.toMap());
  }

  Future<void> deleteCompany(String companyId) async {
    final patientsRepo = PatientsRepository(userId, companyId);

    await patientsRepo.deleteAllPatients();
    await _companiesDao.deleteCompany(companyId);
  }
}
