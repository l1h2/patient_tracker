import '../entities/patients_entity.dart';
import '../repositories/patients_repository.dart';

import '/src/core/models/patient_model.dart';
import '/src/core/utils/usecase.dart';

class PatientsUseCase implements UseCase<void, PatientParams> {
  PatientsUseCase(this._repository);

  final PatientsRepository _repository;

  @override
  Future<String> call(PatientParams params) async {
    return await _repository.addPatient(params);
  }

  Future<List<Patient>> getPatients(String userId, String companyId) async {
    return await _repository.getPatients(userId, companyId);
  }

  Future<void> updatePatient(UpdatePatientParams params) async {
    await _repository.updatePatient(params);
  }

  Future<GetRecordsReturn> getRecords(GetRecordsParams params) async {
    return await _repository.getRecords(params);
  }

  Future<void> deletePatient(DeletePatientParams params) async {
    await _repository.deletePatient(params);
  }
}
