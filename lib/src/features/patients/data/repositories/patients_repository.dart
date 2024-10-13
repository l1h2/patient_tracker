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
  Future<Patient> updatePatient(UpdatePatientParams params) async {
    return await _service.updatePatient(params);
  }

  @override
  Future<GetRecordsReturn> getRecords(GetRecordsParams params) async {
    return await _service.getRecords(params);
  }

  @override
  Future<void> deletePatient(DeletePatientParams params) async {
    return await _service.deletePatient(params);
  }
}
