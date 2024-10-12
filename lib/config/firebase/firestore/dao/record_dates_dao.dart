import '../collections/collections.dart';
import '../collections/record_dates.dart';

import '/config/locator/setup.dart';
import 'base_dao.dart';

class RecordDatesDao {
  final FirestoreDao _baseDao = locator<FirestoreDao>();
  final String _collectionPath = CollectionPaths.recordDates;
  final String _patientId;

  RecordDatesDao(this._patientId);

  Future<void> createRecordDates(Map<String, dynamic> data) async {
    await _baseDao.createDocumentWithId(_collectionPath, _patientId, data);
  }

  Future<Map<String, dynamic>?> readRecordDates() async {
    return await _baseDao.readDocument(
      _collectionPath,
      _patientId,
      RecordDatesAttrs.patientId,
    );
  }

  Future<List<Map<String, dynamic>>> readRecordDatesCollection() async {
    return await _baseDao.readDocuments(
      _collectionPath,
      RecordDatesAttrs.patientId,
    );
  }

  Future<void> updateRecordDates(Map<String, dynamic> data) async {
    await _baseDao.updateDocument(_collectionPath, _patientId, data);
  }

  Future<void> addRecordDates(Set<DateTime> recordDates) async {
    await _baseDao.appendToArray(
      _collectionPath,
      _patientId,
      RecordDatesAttrs.recordDates,
      recordDates.toList(),
    );
  }

  Future<void> removeRecordDates(Set<DateTime> recordDates) async {
    await _baseDao.removeFromArray(
      _collectionPath,
      _patientId,
      RecordDatesAttrs.recordDates,
      recordDates.toList(),
    );
  }

  Future<void> deleteRecordDates() async {
    await _baseDao.deleteDocument(_collectionPath, _patientId);
  }
}
