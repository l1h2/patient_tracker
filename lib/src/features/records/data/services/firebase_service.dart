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

    final Records newRecords = params.records.copy();

    if (newRecords.id == null) {
      final String recordId = await recordsRepo.createRecord(
        RecordsDocument.fromRecords(newRecords),
      );
      newRecords.id = recordId;
      await recordDatesRepo.addRecordDates({newRecords.date});
    } else {
      await recordsRepo.updateRecord(
        RecordsDocument.fromRecords(newRecords),
      );
    }

    return newRecords.id!;
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
}
