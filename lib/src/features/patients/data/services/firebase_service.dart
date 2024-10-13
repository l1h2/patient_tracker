import '../../domain/entities/patients_entity.dart';

import '/config/firebase/firestore/collections/patients.dart';
import '/config/firebase/firestore/collections/record_dates.dart';
import '/config/firebase/firestore/repositories/patients_repository.dart';
import '/config/firebase/firestore/repositories/record_dates_repository.dart';
import '/config/firebase/firestore/repositories/records_repository.dart';
import '/src/core/models/patient_model.dart';
import '/src/core/models/records_model.dart';
import 'patients_service.dart';

class PatientsFirebaseService implements PatientsService {
  @override
  Future<void> addPatient(PatientParams params) async {
    final patientsRepo = PatientsRepository(params.userId, params.companyId);
    final String patientId = await patientsRepo.createPatient(
      PatientDocument(name: params.name, isMale: params.isMale),
    );

    await RecordDatesRepository(patientId).createRecordDates(
      RecordDatesDocument(patientId: patientId, recordDates: {}),
    );
  }

  @override
  Future<List<Patient>> getPatients(String userId, String companyId) async {
    final patientsRepo = PatientsRepository(userId, companyId);
    final List<PatientDocument> patients = await patientsRepo.readPatients();
    return patients.map((patient) => patient.toPatient()).toList();
  }

  @override
  Future<Patient> updatePatient(UpdatePatientParams params) async {
    final patientsRepo = PatientsRepository(params.userId, params.companyId);
    await patientsRepo.updatePatient(
      PatientDocument(
        id: params.patient.id,
        name: params.name,
        isMale: params.isMale,
      ),
    );

    params.patient.name = params.name;
    params.patient.isMale = params.isMale;
    return params.patient;
  }

  @override
  Future<GetRecordsReturn> getRecords(GetRecordsParams params) async {
    final recordDatesRepo = RecordDatesRepository(params.patient.id);
    final recordsRepo = RecordsRepository(
      params.user.id,
      params.company.id,
      params.patient.id,
    );

    final Set<DateTime> recordDates =
        await recordDatesRepo.readRecordDates().then((recordDates) {
      return recordDates?.recordDates ?? {};
    });

    if (!recordDates.contains(params.date)) {
      return GetRecordsReturn(records: null, recordDates: recordDates);
    }

    final Records? records =
        await recordsRepo.readRecordByDate(params.date).then((record) {
      if (record == null) return null;
      return record.toRecords();
    });

    return GetRecordsReturn(records: records, recordDates: recordDates);
  }
}
