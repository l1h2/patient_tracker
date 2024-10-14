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

  Company copyWith(String name) => Company(
        id: id,
        name: name,
        patients: patients,
      );
}
