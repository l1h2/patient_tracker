import '../collections/records.dart';
import '../dao/records_dao.dart';

import 'record_dates_repository.dart';

class RecordsRepository {
  RecordsRepository(String userId, String companyId, String patientId)
      : _recordsDao = RecordsDao(userId, companyId, patientId),
        _recordDatesRepo = RecordDatesRepository(userId, companyId, patientId);

  final RecordsDao _recordsDao;
  final RecordDatesRepository _recordDatesRepo;

  Future<String> createRecord(RecordsDocument record) async {
    final String recordId = await _recordsDao.createRecord(
      record.toMap(isCreate: true)!,
    );
    await _recordDatesRepo.addRecordDates({record.date});

    return recordId;
  }

  Future<RecordsDocument?> readRecord(String recordId) async {
    final Map<String, dynamic>? data = await _recordsDao.readRecord(recordId);
    if (data == null) return null;
    return RecordsDocument.fromMap(data);
  }

  Future<RecordsDocument?> readRecordByDate(DateTime date) async {
    final Map<String, dynamic>? data = await _recordsDao.readRecordByField(
      RecordsAttrs.date,
      date,
    );
    if (data == null) return null;
    return RecordsDocument.fromMap(data);
  }

  Future<List<RecordsDocument>> readRecords() async {
    final List<Map<String, dynamic>> data = await _recordsDao.readRecords();
    return data.map((e) => RecordsDocument.fromMap(e)).toList();
  }

  Future<void> updateRecord(RecordsDocument record) async {
    await _recordsDao.updateRecord(record.id!, record.toMap()!);
  }

  Future<void> deleteRecord(String recordId, DateTime date) async {
    await _recordsDao.deleteRecord(recordId);
    await _recordDatesRepo.removeRecordDates({date});
  }

  Future<void> deleteAllRecords() async {
    await _recordsDao.deleteAllRecords();
  }
}
