import '../collections/collections.dart';
import '../collections/users.dart';

import '/config/locator/setup.dart';
import 'base_dao.dart';

class UsersDao {
  final FirestoreDao _baseDao = locator<FirestoreDao>();
  final String _collectionPath = CollectionPaths.users;

  Future<void> createUser(Map<String, dynamic> data) async {
    await _baseDao.createDocument(_collectionPath, data);
  }

  Future<Map<String, dynamic>?> readUser(String userId) async {
    return await _baseDao.readDocument(_collectionPath, userId, UserAttrs.uid);
  }

  Future<List<Map<String, dynamic>>> readUsers() async {
    return await _baseDao.readDocuments(_collectionPath, UserAttrs.uid);
  }

  Future<void> updateUser(String userId, Map<String, dynamic> data) async {
    await _baseDao.updateDocument(_collectionPath, userId, data);
  }

  Future<void> deleteUser(String userId) async {
    await _baseDao.deleteDocument(_collectionPath, userId);
  }
}
