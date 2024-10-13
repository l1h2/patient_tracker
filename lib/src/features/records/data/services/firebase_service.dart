import '../../domain/entities/records_entity.dart';

import '/config/firebase/firestore/collections/records.dart';
import '/config/firebase/firestore/repositories/record_dates_repository.dart';
import '/config/firebase/firestore/repositories/records_repository.dart';
import '/src/core/models/records_model.dart';
import 'records_service.dart';

class RecordsFirebaseService implements RecordsService {
  @override
  Future<String> saveRecords(RecordsParams params) async {
    final recordDatesRepo = RecordDatesRepository(params.patientId);
    final recordsRepo = RecordsRepository(
      params.userId,
      params.companyId,
      params.patientId,
    );

    String? recordId = params.records.id;

    if (recordId == null) {
      recordId = await recordsRepo.createRecord(
        RecordsDocument.fromRecords(params.records),
      );
      await recordDatesRepo.addRecordDates({params.records.date});
    } else {
      await recordsRepo.updateRecord(
        RecordsDocument.fromRecords(params.records),
      );
    }

    return recordId;
  }

  @override
  Future<Records?> getRecords(GetRecordsParams params) async {
    final recordsRepo = RecordsRepository(
      params.userId,
      params.companyId,
      params.patientId,
    );

    return await recordsRepo.readRecordByDate(params.date).then((record) {
      if (record == null) return null;
      return record.toRecords();
    });
  }

  @override
  Future<void> deleteRecords(DeleteRecordsParams params) async {
    final recordDatesRepo = RecordDatesRepository(params.patientId);
    final recordsRepo = RecordsRepository(
      params.userId,
      params.companyId,
      params.patientId,
    );

    await recordsRepo.deleteRecord(params.recordsId);
    await recordDatesRepo.removeRecordDates({params.date});
  }
}
