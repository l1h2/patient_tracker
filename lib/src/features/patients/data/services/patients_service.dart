import '../../domain/entities/patients_entity.dart';

import '/src/core/models/patient_model.dart';

abstract class PatientsService {
  Future<String> addPatient(PatientParams params);
  Future<List<Patient>> getPatients(String userId, String companyId);
  Future<void> updatePatient(UpdatePatientParams params);
  Future<GetRecordsReturn> getRecords(GetRecordsParams params);
  Future<void> deletePatient(DeletePatientParams params);
}
