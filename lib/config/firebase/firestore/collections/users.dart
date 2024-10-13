import '/src/core/models/user_model.dart';
import 'companies.dart';

class UserDocument {
  final String uid;
  final String email;
  final String certificate;
  final String name;
  final bool isDarkMode;
  final List<CompanyDocument>? companies;

  const UserDocument({
    required this.uid,
    required this.email,
    required this.certificate,
    required this.name,
    required this.isDarkMode,
    this.companies,
  });

  factory UserDocument.fromMap(Map<String, dynamic> map) => UserDocument(
        uid: map[UserAttrs.uid],
        email: map[UserAttrs.email],
        certificate: map[UserAttrs.certificate],
        name: map[UserAttrs.name],
        isDarkMode: map[UserAttrs.isDarkMode],
      );

  factory UserDocument.fromUser(User user) => UserDocument(
        uid: user.id,
        email: user.email,
        certificate: user.certificate,
        name: user.name,
        isDarkMode: user.isDarkMode,
      );

  UserDocument copyWith({required Map<String, dynamic> newAttrs}) {
    if (newAttrs.isEmpty) {
      return this;
    }

    return UserDocument(
      uid: newAttrs[UserAttrs.uid] ?? uid,
      email: newAttrs[UserAttrs.email] ?? email,
      certificate: newAttrs[UserAttrs.certificate] ?? certificate,
      name: newAttrs[UserAttrs.name] ?? name,
      isDarkMode: newAttrs[UserAttrs.isDarkMode] ?? isDarkMode,
      companies: newAttrs[UserAttrs.companies] ?? companies,
    );
  }

  Map<String, dynamic> toMap() => {
        UserAttrs.email: email,
        UserAttrs.certificate: certificate,
        UserAttrs.name: name,
        UserAttrs.isDarkMode: isDarkMode,
      };

  User toUser() => User(
        id: uid,
        email: email,
        certificate: certificate,
        name: name,
        isDarkMode: isDarkMode,
      );
}

class UserAttrs {
  static const uid = 'uid';
  static const email = 'email';
  static const certificate = 'certificate';
  static const name = 'name';
  static const isDarkMode = 'isDarkMode';
  static const companies = 'companies';
}
