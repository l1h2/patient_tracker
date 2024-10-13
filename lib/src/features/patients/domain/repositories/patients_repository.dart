import '../entities/patients_entity.dart';

import '/src/core/models/patient_model.dart';

abstract class PatientsRepository {
  Future<void> addPatient(PatientParams params);
  Future<List<Patient>> getPatients(String userId, String companyId);
  Future<Patient> updatePatient(UpdatePatientParams params);
  Future<GetRecordsReturn> getRecords(GetRecordsParams params);
}
