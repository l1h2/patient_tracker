import '../../domain/entities/patients_entity.dart';
import '../../domain/repositories/patients_repository.dart';
import '../services/patients_service.dart';

import '/src/core/models/patient_model.dart';

class FirebasePatientsRepository implements PatientsRepository {
  final PatientsService _service;

  const FirebasePatientsRepository(this._service);

  @override
  Future<void> addPatient(PatientParams params) async {
    return await _service.addPatient(params);
  }

  @override
  Future<List<Patient>> getPatients(String userId, String companyId) async {
    return await _service.getPatients(userId, companyId);
  }

  @override
  Future<Patient> updatePatient(
    String userId,
    String companyId,
    Patient patient,
    String name,
  ) async {
    return await _service.updatePatient(userId, companyId, patient, name);
  }

  @override
  Future<GetRecordsReturn> getRecords(GetRecordsParams params) async {
    return await _service.getRecords(params);
  }
}
