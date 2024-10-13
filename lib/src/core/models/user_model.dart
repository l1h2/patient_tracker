import 'company_model.dart';

class User {
  final String id;
  final String email;
  final String certificate;
  final String name;
  bool isDarkMode;
  final Map<String, Company> companies;

  User({
    required this.id,
    required this.email,
    required this.certificate,
    required this.name,
    this.isDarkMode = false,
    Map<String, Company>? companies,
  }) : companies = companies ?? {};

  User copyWith({required Map<String, dynamic> newAttrs}) {
    if (newAttrs.isEmpty) return this;

    return User(
      id: id,
      email: newAttrs[UserAttributes.email] ?? email,
      certificate: newAttrs[UserAttributes.certificate] ?? certificate,
      name: newAttrs[UserAttributes.name] ?? name,
      isDarkMode: newAttrs[UserAttributes.isDarkMode] ?? isDarkMode,
      companies: newAttrs[UserAttributes.companies] ?? companies,
    );
  }
}

class UserAttributes {
  static const id = 'id';
  static const email = 'email';
  static const certificate = 'certificate';
  static const name = 'name';
  static const isDarkMode = 'isDarkMode';
  static const companies = 'companies';
}
