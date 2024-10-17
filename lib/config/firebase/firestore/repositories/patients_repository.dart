import '../collections/patients.dart';
import '../dao/patients_dao.dart';

import 'record_dates_repository.dart';
import 'records_repository.dart';

class PatientsRepository {
  PatientsRepository(this.userId, this.companyId)
      : _patientsDao = PatientsDao(userId, companyId);

  final String userId;
  final String companyId;
  final PatientsDao _patientsDao;

  Future<String> createPatient(PatientDocument patient) async {
    return await _patientsDao.createPatient(patient.toMap());
  }

  Future<PatientDocument?> readPatient(String patientId) async {
    final Map<String, dynamic>? data =
        await _patientsDao.readPatient(patientId);
    if (data == null) return null;
    return PatientDocument.fromMap(data);
  }

  Future<List<PatientDocument>> readPatients() async {
    final List<Map<String, dynamic>> data = await _patientsDao.readPatients();
    return data.map((e) => PatientDocument.fromMap(e)).toList();
  }

  Future<void> updatePatient(PatientDocument patient) async {
    await _patientsDao.updatePatient(patient.id!, patient.toMap());
  }

  Future<void> deletePatient(String patientId) async {
    final recordDatesRepo = RecordDatesRepository(userId, companyId, patientId);
    final recordsRepo = RecordsRepository(userId, companyId, patientId);

    await recordsRepo.deleteAllRecords();
    await recordDatesRepo.deleteRecordDates();
    await _patientsDao.deletePatient(patientId);
  }

  Future<void> deleteAllPatients() async {
    final List<Map<String, dynamic>> data = await _patientsDao.readPatients();

    for (final patient in data) {
      await deletePatient(patient[PatientAttrs.id]);
    }
  }
}
