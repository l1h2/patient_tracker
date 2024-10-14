import '../collections/records.dart';
import '../dao/records_dao.dart';

class RecordsRepository {
  RecordsRepository(String userId, String companyId, String patientId)
      : _recordsDao = RecordsDao(userId, companyId, patientId);

  final RecordsDao _recordsDao;

  Future<String> createRecord(RecordsDocument record) async {
    return await _recordsDao.createRecord(record.toMap(isCreate: true)!);
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

  Future<void> deleteRecord(String recordId) async {
    await _recordsDao.deleteRecord(recordId);
  }
}
