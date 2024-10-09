import '../collections/users.dart';
import '../dao/users_dao.dart';

class UsersRepository {
  final UsersDao _usersDao = UsersDao();

  Future<void> createUser(UserDocument user) async {
    await _usersDao.createUser(user.toMap());
  }

  Future<UserDocument?> readUser(String userId) async {
    final Map<String, dynamic>? data = await _usersDao.readUser(userId);
    if (data == null) return null;
    return UserDocument.fromMap(data);
  }

  Future<List<UserDocument>> readUsers() async {
    final List<Map<String, dynamic>> data = await _usersDao.readUsers();
    return data.map((e) => UserDocument.fromMap(e)).toList();
  }

  Future<void> updateUser(UserDocument user) async {
    await _usersDao.updateUser(user.uid, user.toMap());
  }

  Future<void> deleteUser(String userId) async {
    await _usersDao.deleteUser(userId);
  }
}
