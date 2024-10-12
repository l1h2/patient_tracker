import '../../domain/entities/patients_entity.dart';

import '/src/core/models/patient_model.dart';

abstract class PatientsService {
  Future<void> addPatient(PatientParams params);
  Future<List<Patient>> getPatients(String userId, String companyId);
  Future<Patient> updatePatient(
    String userId,
    String companyId,
    Patient patient,
    String name,
  );
  Future<GetRecordsReturn> getRecords(GetRecordsParams params);
}
