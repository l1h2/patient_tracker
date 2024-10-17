import '../collections/record_dates.dart';
import '../dao/record_dates_dao.dart';

class RecordDatesRepository {
  RecordDatesRepository(String userId, String companyId, String patientId)
      : _recordDatesDao = RecordDatesDao(userId, companyId, patientId);

  final RecordDatesDao _recordDatesDao;

  Future<void> createRecordDates(RecordDatesDocument recordDates) async {
    await _recordDatesDao.createRecordDates(recordDates.toMap());
  }

  Future<RecordDatesDocument?> readRecordDates() async {
    final Map<String, dynamic>? data = await _recordDatesDao.readRecordDates();
    if (data == null) return null;
    return RecordDatesDocument.fromMap(data);
  }

  Future<List<RecordDatesDocument>> readRecordDatesCollection() async {
    final List<Map<String, dynamic>> data =
        await _recordDatesDao.readRecordDatesCollection();
    return data.map((e) => RecordDatesDocument.fromMap(e)).toList();
  }

  Future<void> updateRecordDates(RecordDatesDocument recordDates) async {
    await _recordDatesDao.updateRecordDates(recordDates.toMap());
  }

  Future<void> addRecordDates(Set<DateTime> recordDates) async {
    await _recordDatesDao.addRecordDates(recordDates);
  }

  Future<void> deleteRecordDates() async {
    await _recordDatesDao.deleteRecordDates();
  }

  Future<void> removeRecordDates(Set<DateTime> recordDates) async {
    await _recordDatesDao.removeRecordDates(recordDates);
  }
}
