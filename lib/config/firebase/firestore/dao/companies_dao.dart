import '../collections/collections.dart';
import '../collections/companies.dart';

import '/config/locator/setup.dart';
import 'base_dao.dart';

class CompaniesDao {
  CompaniesDao(String userId)
      : _collectionPath = CollectionPaths.companies(userId);

  final FirestoreDao _baseDao = locator<FirestoreDao>();
  final String _collectionPath;

  Future<String> createCompany(Map<String, dynamic> data) async {
    return await _baseDao.createDocument(_collectionPath, data).then((doc) {
      return doc.id;
    });
  }

  Future<Map<String, dynamic>?> readCompany(String companyId) async {
    return await _baseDao.readDocument(
      _collectionPath,
      companyId,
      CompanyAttrs.id,
    );
  }

  Future<List<Map<String, dynamic>>> readCompanies() async {
    return await _baseDao.readDocuments(_collectionPath, CompanyAttrs.id);
  }

  Future<void> updateCompany(
    String companyId,
    Map<String, dynamic> data,
  ) async {
    await _baseDao.updateDocument(_collectionPath, companyId, data);
  }

  Future<void> deleteCompany(String companyId) async {
    await _baseDao.deleteDocument(_collectionPath, companyId);
  }
}
