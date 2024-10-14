import 'package:hive/hive.dart';

import '../models/company_model.dart';
import '../models/patient_model.dart';
import '../models/records_model.dart';
import '../models/user_model.dart';

import '/config/datastore/hive.dart';

class PatientsRepository {
  User? user;
  final Box<User> userBox;

  PatientsRepository({required this.user, required this.userBox});

  Future<void> addPatient(String companyId, Patient patient) async {
    final Company? company = user?.companies[companyId];

    if (company == null) return;

    if (company.patients.containsKey(patient.id)) return;

    company.patients[patient.id] = patient;
    await userBox.put(HiveKeys.user, user!);
  }

  List<Patient> getPatients(String companyId) {
    final Company? company = user?.companies[companyId];

    if (company == null) return [];

    final List<Patient> patients = company.patients.values.toList();
    patients.sort((a, b) => a.name.compareTo(b.name));
    return patients;
  }

  Patient? getPatient(String companyId, String patientId) {
    final Company? company = user?.companies[companyId];

    if (company == null) return null;

    return company.patients[patientId];
  }

  Future<void> updatePatient(
    String companyId,
    String patientId,
    String name,
    bool isMale,
  ) async {
    final Patient? patient = user?.companies[companyId]?.patients[patientId];

    if (patient == null) return;

    patient.name = name;
    patient.isMale = isMale;
    await userBox.put(HiveKeys.user, user!);
  }

  Future<void> updatePatientRecords(
    String companyId,
    String patientId,
    Records? records,
    Set<DateTime> recordDates,
  ) async {
    final Patient? patient = user?.companies[companyId]?.patients[patientId];

    if (patient == null) return;

    patient.records.clear();
    patient.recordDates.clear();

    if (records != null) patient.records[records.id!] = records;
    patient.recordDates.addAll(recordDates);
    await userBox.put(HiveKeys.user, user!);
  }

  Future<void> updatePatients(String companyId, List<Patient> patients) async {
    final Company? company = user?.companies[companyId];

    if (company == null) return;

    company.patients.clear();

    for (final patient in patients) {
      company.patients[patient.id] = patient;
    }
    await userBox.put(HiveKeys.user, user!);
  }

  Future<void> removePatient(String companyId, String patientId) async {
    final Company? company = user?.companies[companyId];

    if (company == null) return;

    company.patients.remove(patientId);
    await userBox.put(HiveKeys.user, user!);
  }
}
