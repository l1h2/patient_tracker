import '../entities/home_entity.dart';
import '../repositories/home_repository.dart';

import '/src/core/models/company_model.dart';
import '/src/core/utils/usecase.dart';

class HomeUseCase implements UseCase<void, HomeParams> {
  const HomeUseCase(this._repository);

  final HomeRepository _repository;

  @override
  Future<void> call(HomeParams params) async {
    return await _repository.addCompany(params);
  }

  Future<List<Company>> getCompanies(String userId) async {
    return await _repository.getCompanies(userId);
  }

  Future<Company> updateCompany(
    String userId,
    Company company,
    String name,
  ) async {
    return await _repository.updateCompany(userId, company, name);
  }

  Future<void> deleteCompany(String userId, String companyId) async {
    return await _repository.deleteCompany(userId, companyId);
  }
}
