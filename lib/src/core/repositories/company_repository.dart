import 'package:hive/hive.dart';

import '../models/company_model.dart';
import '../models/user_model.dart';

import '/config/datastore/hive.dart';

class CompaniesRepository {
  User? user;
  final Box<User> userBox;

  CompaniesRepository({required this.user, required this.userBox});

  Future<void> addCompany(Company company) async {
    if (user == null) return;

    if (user!.companies.containsKey(company.id)) return;

    user!.companies[company.id] = company;
    await userBox.put(HiveKeys.user, user!);
  }

  List<Company> getCompanies() {
    if (user == null) return [];

    final List<Company> companies = user!.companies.values.toList();
    companies.sort((a, b) => a.name.compareTo(b.name));
    return companies;
  }

  Company? getCompany(String companyId) {
    return user?.companies[companyId];
  }

  Future<void> updateCompany(String companyId, String name) async {
    final Company? company = user?.companies[companyId];

    if (company == null) return;

    company.name = name;
    await userBox.put(HiveKeys.user, user!);
  }

  Future<void> removeCompany(String companyId) async {
    if (user == null) return;

    user!.companies.remove(companyId);
    await userBox.put(HiveKeys.user, user!);
  }

  Future<void> updateCompanies(List<Company> companies) async {
    if (user == null) return;

    final Set<String> localCompanyIds = user!.companies.keys.toSet();

    for (final company in companies) {
      if (localCompanyIds.contains(company.id)) {
        user!.companies[company.id]!.name = company.name;
        localCompanyIds.remove(company.id);
      } else {
        user!.companies[company.id] = company;
      }
    }

    for (final localCompanyId in localCompanyIds) {
      user!.companies.remove(localCompanyId);
    }

    await userBox.put(HiveKeys.user, user!);
  }
}
