import 'patient_model.dart';

class Company {
  final String id;
  String name;
  final Map<String, Patient> patients;

  Company({
    required this.id,
    required this.name,
    Map<String, Patient>? patients,
  }) : patients = patients ?? {};

  Company copyWith(Company company) => Company(
        id: id,
        name: company.name,
        patients: company.patients.isEmpty ? patients : company.patients,
      );
}
