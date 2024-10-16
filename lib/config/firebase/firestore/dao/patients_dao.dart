import '../collections/collections.dart';
import '../collections/patients.dart';

import '/config/locator/setup.dart';
import 'base_dao.dart';

class PatientsDao {
  final FirestoreDao _baseDao = locator<FirestoreDao>();
  final String _collectionPath;

  PatientsDao(String userId, String companyId)
      : _collectionPath = CollectionPaths.patients(userId, companyId);

  Future<String> createPatient(Map<String, dynamic> data) async {
    return await _baseDao.createDocument(_collectionPath, data).then((doc) {
      return doc.id;
    });
  }

  Future<Map<String, dynamic>?> readPatient(String patientId) async {
    return await _baseDao.readDocument(
      _collectionPath,
      patientId,
      PatientAttrs.id,
    );
  }

  Future<List<Map<String, dynamic>>> readPatients() async {
    return await _baseDao.readDocuments(_collectionPath, PatientAttrs.id);
  }

  Future<void> updatePatient(
    String patientId,
    Map<String, dynamic> data,
  ) async {
    await _baseDao.updateDocument(_collectionPath, patientId, data);
  }

  Future<void> deletePatient(String patientId) async {
    await _baseDao.deleteDocumentAndSubcollections(_collectionPath, patientId);
  }
}
