import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? get currentUser => _auth.currentUser;
  String? get userId => currentUser?.uid;

  Future<String> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    final UserCredential result = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return result.user!.uid;
  }

  Future<void> sendPasswordResetEmail(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  Future<void> changePassword({
    required String newPassword,
    required String currentPassword,
  }) async {
    if (currentUser == null) {
      throw FirebaseAuthException(
        message: 'No user is currently signed in',
        code: '999',
      );
    }

    await _reauthenticateUser(currentUser!.email!, currentPassword);
    await currentUser!.updatePassword(newPassword);
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<void> _reauthenticateUser(String email, String password) async {
    AuthCredential credential = EmailAuthProvider.credential(
      email: email,
      password: password,
    );
    await currentUser!.reauthenticateWithCredential(credential);
  }
}
