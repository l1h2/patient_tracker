import '../collections/collections.dart';
import '../collections/records.dart';

import '/config/locator/setup.dart';
import 'base_dao.dart';

class RecordsDao {
  final FirestoreDao _baseDao = locator<FirestoreDao>();
  final String _collectionPath;

  RecordsDao(String userId, String companyId, String patientId)
      : _collectionPath = CollectionPaths.records(userId, companyId, patientId);

  Future<String> createRecord(Map<String, dynamic> data) async {
    return await _baseDao.createDocument(_collectionPath, data).then((doc) {
      return doc.id;
    });
  }

  Future<Map<String, dynamic>?> readRecord(String recordId) async {
    return await _baseDao.readDocument(
      _collectionPath,
      recordId,
      RecordsAttrs.id,
    );
  }

  Future<Map<String, dynamic>?> readRecordByField(
    String fieldName,
    dynamic value,
  ) async {
    return await _baseDao.readDocumentByField(
      _collectionPath,
      fieldName,
      value,
      RecordsAttrs.id,
    );
  }

  Future<List<Map<String, dynamic>>> readRecords() async {
    return await _baseDao.readDocuments(_collectionPath, RecordsAttrs.id);
  }

  Future<void> updateRecord(
    String recordId,
    Map<String, dynamic> data, [
    List<String>? fieldsToDelete,
  ]) async {
    await _baseDao.updateDocumentWithMapFields(
      _collectionPath,
      recordId,
      data,
      fieldsToDelete,
    );
  }

  Future<void> deleteRecord(String recordId) async {
    await _baseDao.deleteDocument(_collectionPath, recordId);
  }

  Future<void> deleteAllRecords() async {
    await _baseDao.deleteCollection(_collectionPath);
  }
}
