import 'package:hive/hive.dart';

import '../models/company_model.dart';
import '../models/patient_model.dart';
import '../models/records_model.dart';
import '../models/user_model.dart';

import '/config/datastore/hive.dart';
import 'company_repository.dart';
import 'patient_repository.dart';
import 'records_repository.dart';

class UserRepository {
  late User _user;
  late Box<User> _userBox;
  late CompaniesRepository companiesRepo;
  late PatientsRepository patientsRepo;
  late RecordsRepository recordsRepo;

  Future<void> init() async {
    await _initializeBox();
    _initializeUser();
    companiesRepo = CompaniesRepository(user: _user, userBox: _userBox);
    patientsRepo = PatientsRepository(user: _user, userBox: _userBox);
    recordsRepo = RecordsRepository(user: _user, userBox: _userBox);
  }

  Future<void> _initializeBox() async =>
      _userBox = await Hive.openBox<User>(HiveBoxes.user);

  void _initializeUser() {
    _user = _userBox.get(HiveKeys.user) ?? User.empty();
  }

  User? get user => _user;
  String? get userId => _user.id;

  Future<void> setUser(User user) async {
    _user = user;
    await _userBox.put(HiveKeys.user, _user);
  }

  Future<void> clearUser() async {
    _user.clear();
    await _userBox.put(HiveKeys.user, _user);
  }

  Future<void> updateUser({required Map<String, dynamic> newAttrs}) async {
    if (newAttrs.isEmpty) return;
    _user = _user.copyWith(newAttrs: newAttrs);
    await _userBox.put(HiveKeys.user, _user);
  }

  Future<void> addCompany(Company company) async =>
      await companiesRepo.addCompany(company);

  List<Company> getCompanies() => companiesRepo.getCompanies();

  Company? getCompany(String companyId) => companiesRepo.getCompany(companyId);

  Future<void> updateCompany(String companyId, String name) async =>
      await companiesRepo.updateCompany(companyId, name);

  Future<void> updateCompanies(List<Company> companies) async =>
      await companiesRepo.updateCompanies(companies);

  Future<void> removeCompany(String companyId) async =>
      await companiesRepo.removeCompany(companyId);

  Future<void> addPatient(String companyId, Patient patient) async =>
      await patientsRepo.addPatient(companyId, patient);

  List<Patient> getPatients(String companyId) =>
      patientsRepo.getPatients(companyId);

  Patient? getPatient(String companyId, String patientId) =>
      patientsRepo.getPatient(companyId, patientId);

  Future<void> updatePatient(
    String companyId,
    String patientId,
    String name,
    bool isMale,
  ) async =>
      await patientsRepo.updatePatient(companyId, patientId, name, isMale);

  Future<void> updatePatientRecords(
    String companyId,
    String patientId,
    Records? records,
    Set<DateTime> recordDates,
  ) async =>
      await patientsRepo.updatePatientRecords(
        companyId,
        patientId,
        records,
        recordDates,
      );

  Future<void> updatePatients(String companyId, List<Patient> patients) async =>
      await patientsRepo.updatePatients(companyId, patients);

  Future<void> removePatient(String companyId, String patientId) async =>
      await patientsRepo.removePatient(companyId, patientId);

  List<Records> getRecordsList(String companyId, String patientId) =>
      recordsRepo.getRecordsList(companyId, patientId);

  Future<void> addRecords(
    String companyId,
    String patientId,
    Records records,
  ) async =>
      await recordsRepo.addRecords(companyId, patientId, records);

  Records? getRecords(String companyId, String patientId, String recordId) =>
      recordsRepo.getRecords(companyId, patientId, recordId);

  Records? getRecordsFromDate(
    String companyId,
    String patientId,
    DateTime date,
  ) =>
      recordsRepo.getRecordsFromDate(companyId, patientId, date);

  Future<void> updateRecordsFromRecords(
    String companyId,
    String patientId,
    Records records,
  ) async =>
      await recordsRepo.updateRecordsFromRecords(companyId, patientId, records);

  Future<void> removeRecords(
    String companyId,
    String patientId,
    Records records,
  ) async =>
      await recordsRepo.removeRecords(companyId, patientId, records);
}
