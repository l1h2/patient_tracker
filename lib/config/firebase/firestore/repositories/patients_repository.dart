import '../collections/patients.dart';
import '../dao/patients_dao.dart';

class PatientsRepository {
  PatientsRepository(String userId, String companyId)
      : _patientsDao = PatientsDao(userId, companyId);

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
    await _patientsDao.deletePatient(patientId);
  }
}
