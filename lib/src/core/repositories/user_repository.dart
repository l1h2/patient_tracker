import '../models/company_model.dart';
import '../models/patient_model.dart';
import '../models/records_model.dart';
import '../models/user_model.dart';

class UserRepository {
  User? _user;

  void setUser(User user) {
    _user = user;
  }

  User? getUser() {
    return _user;
  }

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
    if (_user == null) return null;
    return _user!.companies[companyId];
  }

  void updateCompany(Company company) {
    if (_user == null) return;

    final Company? existingCompany = _user!.companies[company.id];

    if (existingCompany == null) return;

    _user!.companies[company.id] = existingCompany.copyWith(company);
  }

  void updateCompanies(List<Company> companies) {
    if (_user == null) return;

    for (final company in companies) {
      updateCompany(company);
      addCompany(company);
    }
  }

  void removeCompany(Company company) {
    if (_user == null) return;
    _user!.companies.remove(company.id);
  }

  void addPatient(Company company, Patient patient) {
    if (_user == null) return;

    final Company? currentCompany = _user!.companies[company.id];

    if (currentCompany == null) return;

    if (currentCompany.patients.containsKey(patient.id)) return;

    currentCompany.patients[patient.id] = patient;
  }

  List<Patient> getPatients(Company company) {
    if (_user == null) return [];

    final Company? currentCompany = _user!.companies[company.id];

    if (currentCompany == null) return [];

    final List<Patient> patients = currentCompany.patients.values.toList();
    patients.sort((a, b) => a.name.compareTo(b.name));
    return patients;
  }

  Patient? getPatient(Company company, String patientId) {
    if (_user == null) return null;

    final Company? currentCompany = _user!.companies[company.id];

    if (currentCompany == null) return null;

    return currentCompany.patients[patientId];
  }

  void updatePatient(Company company, Patient patient) {
    if (_user == null) return;

    final Company? currentCompany = _user!.companies[company.id];

    if (currentCompany == null) return;

    final Patient? existingPatient = currentCompany.patients[patient.id];

    if (existingPatient == null) return;

    currentCompany.patients[patient.id] = existingPatient.copyWith(patient);
  }

  void updatePatientRecords(
    Company company,
    Patient patient,
    Records records,
    Set<DateTime> recordDates,
  ) {
    if (_user == null) return;

    final Company? currentCompany = _user!.companies[company.id];

    if (currentCompany == null) return;

    final Patient? existingPatient = currentCompany.patients[patient.id];

    if (existingPatient == null) return;

    final newPatient = Patient(
      id: existingPatient.id,
      name: existingPatient.name,
      records: records.id == null ? {} : {records.id!: records},
      recordDates: recordDates,
    );

    currentCompany.patients[patient.id] = existingPatient.copyWith(newPatient);
  }

  void updatePatients(Company company, List<Patient> patients) {
    if (_user == null) return;

    for (final patient in patients) {
      updatePatient(company, patient);
      addPatient(company, patient);
    }
  }

  void removePatient(Company company, Patient patient) {
    if (_user == null) return;

    final Company? currentCompany = _user!.companies[company.id];

    if (currentCompany == null) return;

    currentCompany.patients.remove(patient.id);
  }

  List<Records> getRecordsList(Company company, Patient patient) {
    if (_user == null) return [];

    final Company? currentCompany = _user!.companies[company.id];

    if (currentCompany == null) return [];

    final Patient? currentPatient = currentCompany.patients[patient.id];

    if (currentPatient == null) return [];

    final List<Records> records = currentPatient.records.values.toList();
    records.sort((a, b) => a.date.compareTo(b.date));
    return records;
  }

  Records? getRecords(Company company, Patient patient, String recordId) {
    if (_user == null) return null;

    final Company? currentCompany = _user!.companies[company.id];

    if (currentCompany == null) return null;

    final Patient? currentPatient = currentCompany.patients[patient.id];

    if (currentPatient == null) return null;

    return currentPatient.records[recordId];
  }

  Records? getRecordsFromDate(
    User user,
    Company company,
    Patient patient,
    DateTime date,
  ) {
    if (_user == null) return null;

    final Company? currentCompany = _user!.companies[company.id];

    if (currentCompany == null) return null;

    final Patient? currentPatient = currentCompany.patients[patient.id];

    if (currentPatient == null) return null;

    return currentPatient.records.values.firstWhere(
      (records) => records.date == date,
      orElse: () => Records.empty(user, patient, date),
    );
  }

  void updateRecords(Company company, Patient patient, Records records) {
    if (_user == null) return;

    final Company? currentCompany = _user!.companies[company.id];

    if (currentCompany == null) return;

    final Patient? currentPatient = currentCompany.patients[patient.id];

    if (currentPatient == null) return;

    currentPatient.records[records.id!] = records;
    currentPatient.recordDates.add(records.date);
  }

  void updateRecordsFromList(
    Company company,
    Patient patient,
    List<Records> recordsList,
  ) {
    if (_user == null) return;

    for (final records in recordsList) {
      updateRecords(company, patient, records);
    }
  }

  void removeRecords(Company company, Patient patient, Records records) {
    if (_user == null) return;

    final Company? currentCompany = _user!.companies[company.id];

    if (currentCompany == null) return;

    final Patient? currentPatient = currentCompany.patients[patient.id];

    if (currentPatient == null) return;

    currentPatient.records.remove(records.id);
  }
}
