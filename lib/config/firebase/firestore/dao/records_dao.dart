import '../collections/collections.dart';
import '../collections/records.dart';

import '/config/locator/setup.dart';
import 'base_dao.dart';

class RecordsDao {
  final FirestoreDao _baseDao = locator<FirestoreDao>();
  final String _collectionPath;

  RecordsDao(String userId, String companyId, String patientId)
      : _collectionPath = CollectionPaths.records(userId, companyId, patientId);

  Future<void> createRecord(Map<String, dynamic> data) async {
    await _baseDao.createDocument(_collectionPath, data);
  }

  Future<Map<String, dynamic>?> readRecord(String recordId) async {
    return await _baseDao.readDocument(
      _collectionPath,
      recordId,
      RecordAttrs.id,
    );
  }

  Future<List<Map<String, dynamic>>> readRecords() async {
    return await _baseDao.readDocuments(_collectionPath, RecordAttrs.id);
  }

  Future<void> updateRecord(
    String recordId,
    Map<String, dynamic> data,
  ) async {
    await _baseDao.updateDocument(_collectionPath, recordId, data);
  }

  Future<void> deleteRecord(String recordId) async {
    await _baseDao.deleteDocument(_collectionPath, recordId);
  }
}
