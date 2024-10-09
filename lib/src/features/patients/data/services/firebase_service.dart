import '../../domain/entities/patients_entity.dart';

import '/config/firebase/firestore/collections/patients.dart';
import '/config/firebase/firestore/repositories/patients_repository.dart';
import '/src/core/models/patient_model.dart';
import 'patients_service.dart';

class PatientsFirebaseService implements PatientsService {
  @override
  Future<void> addPatient(PatientParams params) async {
    final patientsRepo = PatientsRepository(params.userId, params.companyId);
    await patientsRepo.createPatient(PatientDocument(name: params.name));
  }

  @override
  Future<List<Patient>> getPatients(String userId, String companyId) async {
    final patientsRepo = PatientsRepository(userId, companyId);
    final List<PatientDocument> patients = await patientsRepo.readPatients();
    return patients.map((patient) => patient.toPatient()).toList();
  }
}
