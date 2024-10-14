import 'package:hive/hive.dart';

import 'company_model.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class User {
  @HiveField(0)
  String id;

  @HiveField(1)
  String email;

  @HiveField(2)
  String certificate;

  @HiveField(3)
  String name;

  @HiveField(4)
  bool isDarkMode;

  @HiveField(5)
  final Map<String, Company> companies;

  User({
    required this.id,
    required this.email,
    required this.certificate,
    required this.name,
    this.isDarkMode = false,
    Map<String, Company>? companies,
  }) : companies = companies ?? {};

  factory User.empty() => User(
        id: '',
        email: '',
        certificate: '',
        name: '',
        isDarkMode: false,
        companies: {},
      );

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

  void clear() => this
    ..id = ''
    ..email = ''
    ..certificate = ''
    ..name = ''
    ..isDarkMode = false
    ..companies.clear();
}

class UserAttributes {
  static const id = 'id';
  static const email = 'email';
  static const certificate = 'certificate';
  static const name = 'name';
  static const isDarkMode = 'isDarkMode';
  static const companies = 'companies';
}
