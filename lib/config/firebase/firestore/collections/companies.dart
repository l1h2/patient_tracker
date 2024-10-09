import '/src/core/models/company_model.dart';
import 'patients.dart';

class CompanyDocument {
  final String? id;
  final String name;
  final List<PatientDocument>? patients;

  const CompanyDocument({
    this.id,
    required this.name,
    this.patients,
  });

  factory CompanyDocument.fromMap(Map<String, dynamic> map) => CompanyDocument(
        id: map[CompanyAttrs.id],
        name: map[CompanyAttrs.name],
      );

  CompanyDocument copyWith({required Map<String, dynamic> newAttrs}) {
    if (newAttrs.isEmpty) {
      return this;
    }

    return CompanyDocument(
      id: newAttrs[CompanyAttrs.id] ?? id,
      name: newAttrs[CompanyAttrs.name] ?? name,
      patients: newAttrs[CompanyAttrs.patients] ?? patients,
    );
  }

  Map<String, dynamic> toMap() => {CompanyAttrs.name: name};

  Company toCompany() => Company(
        id: id!,
        name: name,
      );
}

class CompanyAttrs {
  static const id = 'id';
  static const name = 'name';
  static const patients = 'patients';
}
