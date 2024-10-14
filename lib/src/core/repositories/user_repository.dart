import '../models/company_model.dart';
import '../models/patient_model.dart';
import '../models/records_model.dart';
import '../models/user_model.dart';

class UserRepository {
  User? _user;

  void setUser(User user) {
    _user = user;
  }

  User? get user => _user;
  String? get userId => _user?.id;

  void updateUser({required Map<String, dynamic> newAttrs}) {
    if (_user == null || newAttrs.isEmpty) return;
    _user = _user!.copyWith(newAttrs: newAttrs);
  }

  void clearUser() {
    _user = null;
  }

  void addCompany(Company company) {
    if (_user == null) return;

    if (_user!.companies.containsKey(company.id)) return;

    _user!.companies[company.id] = company;
  }

  List<Company> getCompanies() {
    if (_user == null) return [];

    final List<Company> companies = _user!.companies.values.toList();
    companies.sort((a, b) => a.name.compareTo(b.name));
    return companies;
  }

  Company? getCompany(String companyId) {
    return _user?.companies[companyId];
  }

  void updateCompany(String companyId, String name) {
    final Company? company = _user?.companies[companyId];

    if (company == null) return;

    company.name = name;
  }

  void updateCompanies(List<Company> companies) {
    if (_user == null) return;

    _user!.companies.clear();

    for (final company in companies) {
      addCompany(company);
    }
  }

  void removeCompany(String companyId) {
    if (_user == null) return;
    _user!.companies.remove(companyId);
  }

  void addPatient(String companyId, Patient patient) {
    final Company? company = _user?.companies[companyId];

    if (company == null) return;

    if (company.patients.containsKey(patient.id)) return;

    company.patients[patient.id] = patient;
  }

  List<Patient> getPatients(String companyId) {
    final Company? company = _user?.companies[companyId];

    if (company == null) return [];

    final List<Patient> patients = company.patients.values.toList();
    patients.sort((a, b) => a.name.compareTo(b.name));
    return patients;
  }

  Patient? getPatient(String companyId, String patientId) {
    final Company? company = _user?.companies[companyId];

    if (company == null) return null;

    return company.patients[patientId];
  }

  void updatePatient(
    String companyId,
    String patientId,
    String name,
    bool isMale,
  ) {
    final Patient? patient = _user?.companies[companyId]?.patients[patientId];

    if (patient == null) return;

    patient.name = name;
    patient.isMale = isMale;
  }

  void updatePatientRecords(
    String companyId,
    String patientId,
    Records? records,
    Set<DateTime> recordDates,
  ) {
    final Patient? patient = _user?.companies[companyId]?.patients[patientId];

    if (patient == null) return;

    patient.records.clear();
    patient.recordDates.clear();

    if (records != null) patient.records[records.id!] = records;
    patient.recordDates.addAll(recordDates);
  }

  void updatePatients(String companyId, List<Patient> patients) {
    final Company? company = _user?.companies[companyId];

    if (company == null) return;

    company.patients.clear();

    for (final patient in patients) {
      addPatient(companyId, patient);
    }
  }

  void removePatient(String companyId, String patientId) {
    final Company? company = _user?.companies[companyId];

    if (company == null) return;

    company.patients.remove(patientId);
  }

  List<Records> getRecordsList(String companyId, String patientId) {
    final Patient? patient = _user?.companies[companyId]?.patients[patientId];

    if (patient == null) return [];

    final List<Records> records = patient.records.values.toList();
    records.sort((a, b) => a.date.compareTo(b.date));
    return records;
  }

  void addRecords(String companyId, String patientId, Records records) {
    final Patient? patient = _user?.companies[companyId]?.patients[patientId];

    if (patient == null) return;

    patient.records[records.id!] = records;
    patient.recordDates.add(records.date);
  }

  Records? getRecords(String companyId, String patientId, String recordId) {
    final Patient? patient = _user?.companies[companyId]?.patients[patientId];

    if (patient == null) return null;

    return patient.records[recordId];
  }

  Records? getRecordsFromDate(
    String companyId,
    String patientId,
    DateTime date,
  ) {
    final Patient? patient = _user?.companies[companyId]?.patients[patientId];

    if (patient == null) return null;

    try {
      return patient.records.values.firstWhere(
        (records) => records.date == date,
      );
    } on StateError {
      return null;
    }
  }

  void updateRecordsFromRecords(
    String companyId,
    String patientId,
    Records records,
  ) {
    final Patient? patient = _user?.companies[companyId]?.patients[patientId];

    if (patient == null) return;

    final Records? existingRecords = patient.records[records.id!];

    if (existingRecords == null) {
      patient.records[records.id!] = records.copy();
    } else {
      existingRecords.updateWith(records);
    }

    patient.recordDates.add(records.date);
  }

  void removeRecords(
    String companyId,
    String patientId,
    Records records,
  ) {
    final Patient? patient = _user?.companies[companyId]?.patients[patientId];

    if (patient == null) return;

    patient.records.remove(records.id);
    patient.recordDates.remove(records.date);
  }
}
