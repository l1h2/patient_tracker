import 'package:hive/hive.dart';

import '../models/patient_model.dart';
import '../models/records_model.dart';
import '../models/user_model.dart';

import '/config/datastore/hive.dart';

class RecordsRepository {
  User? user;
  final Box<User> userBox;

  RecordsRepository({required this.user, required this.userBox});

  List<Records> getRecordsList(String companyId, String patientId) {
    final Patient? patient = user?.companies[companyId]?.patients[patientId];

    if (patient == null) return [];

    final List<Records> records = patient.records.values.toList();
    records.sort((a, b) => a.date.compareTo(b.date));
    return records;
  }

  Future<void> addRecords(
      String companyId, String patientId, Records records) async {
    final Patient? patient = user?.companies[companyId]?.patients[patientId];

    if (patient == null) return;

    patient.records[records.id!] = records;
    patient.recordDates.add(records.date);
    await userBox.put(HiveKeys.user, user!);
  }

  Records? getRecords(String companyId, String patientId, String recordId) {
    final Patient? patient = user?.companies[companyId]?.patients[patientId];

    if (patient == null) return null;

    return patient.records[recordId];
  }

  Records? getRecordsFromDate(
    String companyId,
    String patientId,
    DateTime date,
  ) {
    final Patient? patient = user?.companies[companyId]?.patients[patientId];

    if (patient == null) return null;

    try {
      return patient.records.values.firstWhere(
        (records) => records.date == date,
      );
    } on StateError {
      return null;
    }
  }

  Future<void> updateRecordsFromRecords(
    String companyId,
    String patientId,
    Records records,
  ) async {
    final Patient? patient = user?.companies[companyId]?.patients[patientId];

    if (patient == null) return;

    final Records? existingRecords = patient.records[records.id!];

    if (existingRecords == null) {
      patient.records[records.id!] = records.copy();
    } else {
      existingRecords.updateWith(records);
    }

    patient.recordDates.add(records.date);
    await userBox.put(HiveKeys.user, user!);
  }

  Future<void> removeRecords(
    String companyId,
    String patientId,
    Records records,
  ) async {
    final Patient? patient = user?.companies[companyId]?.patients[patientId];

    if (patient == null) return;

    patient.records.remove(records.id);
    patient.recordDates.remove(records.date);
    await userBox.put(HiveKeys.user, user!);
  }
}
